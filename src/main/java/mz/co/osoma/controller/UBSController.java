package mz.co.osoma.controller;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.Helper;
import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("ubs")
public class UBSController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {

        Map<String, Object> par = new HashMap<String, Object>();
        par.put("uni", 33);
        par.put("year", 2020);

        String hqlQuery = "SELECT e FROM Exam e WHERE e.university.id = :uni and  e.examYear = :year";
        List<Exam> exams = crudService.findByJPQuery(hqlQuery, par);

        ModelAndView model = new ModelAndView("exam-ubs");
        model.addObject("exams", exams);

        return model;

    }


    @RequestMapping(value = "/exam-details/{id}", method = RequestMethod.GET)
    public ModelAndView examDetailsShow(@AuthenticationPrincipal final UserDetails userDetails, @PathVariable("id") int id, HttpSession session) {

        ModelAndView model = new ModelAndView("exam-ubs-details");


        Exam exam = crudService.findEntByJPQueryT("SELECT e FROM Exam e where e.id = " + id, null);




        if (exam != null) {


            List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + exam.getId(), null);
            if (questions != null) {
                // clean case has has some response already
                cleanSession(session, questions);
            }

            University university = crudService.findEntByJPQueryT("SELECT u FROM University u where u.id = " + exam.getUniversity().getId(), null);
            Category category = crudService.findEntByJPQueryT("SELECT c FROM Category c where c.id = " + exam.getCategory().getId(), null);
            model.addObject("university", university);
            model.addObject("category", "../" + category.getCover());
            model.addObject("exame", exam);

            User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);
            List<ExamAttempts> examAttempts = crudService.findByJPQuery("SELECT e FROM ExamAttempts e where e.user.id = " + user.getId() + " and e.exam.id=" + id, null);;


            boolean attemptAllowed = true;
//            if(examAttempts!=null && examAttempts.size()>0){
//                attemptAllowed = false;
//            }

            model.addObject("nrQuestions", exam.getQuestionList().size());
            model.addObject("attemptAllowed", attemptAllowed);

        } else {

            model.addObject("exame", null);
        }

        return model;
    }

    @RequestMapping(value = "/online-test", method = RequestMethod.GET)
    public ModelAndView examDiagnosis(@RequestParam("id") int examID, @RequestParam("question") Optional<Integer> pg, HttpSession session) {
        ModelAndView model = new ModelAndView("diagnosis");
        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + examID, null);

        if (questions == null) {
            return new ModelAndView("exam-noquestion");
        }

        // clean case has has some response already
        //cleanSession(session, questions);

        model.addObject("id", examID);
        Exam exam = crudService.get(Exam.class, examID);
        model.addObject("exam", exam);

//        Admin admin = crudService.get(Admin.class, 12);
//        JSONObject examJson = new JSONObject(exam);

//        Gson gson = new Gson();
        ObjectMapper objectMapper = new ObjectMapper();

       try {
           model.addObject("examJson", objectMapper.writeValueAsString(exam));
       }catch (JsonProcessingException ex){
           ex.printStackTrace();
       }






        int index = (pg.isPresent()) ? pg.get() : 0;

        // end of list
        if (index > questions.size()) {
            model.addObject("next", -1);
            model.addObject("quantidadeExames", questions.size());
            return new ModelAndView("exam-results");
        }

        Question question = questions.get(index);

        String htmlCaseOfStudy = question.getCaseofstudy();
        if (htmlCaseOfStudy != null) {
            String shortText = Helper.shortenHTMLText(htmlCaseOfStudy);
            shortText += Helper.linkModal();
            model.addObject("shortText", shortText);
            model.addObject("htmlCaseOfStudy", htmlCaseOfStudy);
        }

        List<Choice> choices =
                crudService.findByJPQuery("SELECT e FROM Choice e, Question q where e.question = q.id and  q.id = " + question.getId(), null);

        //Collections.shuffle(choices);
        model.addObject("questions", question);
        model.addObject("choices", choices);
        model.addObject("questionlist", questions);

        if (session != null) {
            if (session.getAttribute(question.getId().toString()) != null) {
                String answerSession = (String) session.getAttribute(question.getId().toString());
                String[] answerArray = answerSession.split("_");
                Integer answerId = Integer.parseInt(answerArray[0]);
                model.addObject("sessionAnswer", answerId);
            }
        }

        model.addObject("quantidadeExames", questions.size());
//        model.addObject("next", index + 1);

        model.addObject("next", index);

        Locale l = new Locale("pt", "BR");
        Calendar c = Calendar.getInstance(l);
        SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", l);
        model.addObject("starttimestamp", df.format(c.getTime()));

        return model;
    }

    private void cleanSession(HttpSession session, List<Question> questions) {
        for (Question q : questions) {
            session.removeAttribute(q.getId() + "");
        }
    }


    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView resultGET(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session, @RequestParam("exam") Optional<Integer> idExam, @RequestParam("timestamp")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime timestamp) {

        ModelAndView model = new ModelAndView("exam-results");
        if (idExam.isPresent()) {

            Exam exam = crudService.get(Exam.class, idExam.get());
            User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);

            Map<String, Object> parm = new HashMap<String, Object>();
            parm.put("exam", exam.getId());
            parm.put("user", user.getId());
            parm.put("timestamp", Date.from(timestamp.atZone(ZoneId.systemDefault()).toInstant()));

            ExamAttempts examAttempts = crudService.findEntByJPQuery("SELECT a FROM ExamAttempts a WHERE  a.examAttemptsPK.exam = :exam and  a.examAttemptsPK.user = :user and a.examAttemptsPK.timestamp = :timestamp", parm);

            try {
                updateSession(idExam.get(), user.getId(), timestamp, session);
            } catch (Exception e) {

            }

            List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + idExam.get(), null);

            model.addObject("questions", questions);
            model.addObject("exam", exam);
            model.addObject("qtdquestion", questions.size());
            Locale locale = new Locale("pt", "BR");
            Calendar c = Calendar.getInstance(locale);
            SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", locale);
            model.addObject("finish", df.format(Date.from(timestamp.atZone(ZoneId.systemDefault()).toInstant())));
            model.addObject("start",df.format(examAttempts.getStart()));

            int correct = 0;

            for (Question q : questions) {
                Map<String, Object> par = new HashMap<String, Object>();
                par.put("q", q.getId());
                par.put("r", Short.parseShort("1"));
                Choice answers = crudService.findEntByJPQuery("FROM Choice p WHERE p.question.id = :q AND p.rightchoice = :r", par);

                if (session.getAttribute(q.getId().toString()) != null && session.getAttribute(q.getId().toString()).equals(answers.getId().toString())) {
                    correct++;
                }
            }

            double score = ((double) correct / questions.size()) * 100.00f;
            model.addObject("percentage", (int)score);

            return model;
        }
        model = new ModelAndView("error");
        return model;
    }


    public List<AttemptResult> updateSession(int idExam, int idUser, LocalDateTime timestamp, HttpSession session) {
        Date date = Date.from(timestamp.atZone(ZoneId.systemDefault()).toInstant());

        Map<String, Object> par = new HashMap<String, Object>();
        par.put("exam", idExam);
        par.put("user", idUser);
        par.put("timestamp", date);

        List<AttemptResult> attemptResults = crudService.findByJPQuery("SELECT a FROM AttemptResult a WHERE  a.examAttempts.examAttemptsPK.exam = :exam and  a.examAttempts.examAttemptsPK.user = :user and a.examAttempts.examAttemptsPK.timestamp = :timestamp", par);

        if (attemptResults != null) {
//            for (AttemptResult attemptResult : attemptResults) {
//                session.setAttribute(attemptResult.getChoice().getQuestion().getId().toString(), attemptResult.getChoice().getId().toString());
//            }

            for (int i=0; i<attemptResults.size(); i++) {
                String key = attemptResults.get(i).getChoice().getQuestion().getId().toString()+"_"+((char)i+65);
                String value = attemptResults.get(i).getChoice().getId().toString();
                session.setAttribute(key,value);
            }
        }

        return attemptResults;
    }

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public ModelAndView resultPost(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session) {

        ModelAndView model = new ModelAndView("exam-results");

        int idExam = Integer.parseInt(request.getParameter("examid"));
        String start = request.getParameter("starttimestamp");
        Exam exam = crudService.get(Exam.class, idExam);

        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + idExam, null);

        model.addObject("questions", questions);
        model.addObject("exam", exam);
        model.addObject("qtdquestion", questions.size());
        model.addObject("start", start);
        Locale locale = new Locale("pt", "BR");
        Calendar c = Calendar.getInstance(locale);
        Date timestamp = c.getTime();
        SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", locale);
        model.addObject("finish", df.format(c.getTime()));

        int correct = 0;

        User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);

        ExamAttempts attempts = new ExamAttempts();
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK();
        examAttemptsPK.setExam(exam.getId());
        examAttemptsPK.setExam(exam.getId());
        examAttemptsPK.setUser(user.getId());
        examAttemptsPK.setTimestamp(timestamp);

        try {
            Date startDate = stringToDate(start, locale);
            attempts.setStart(startDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        attempts.setExamAttemptsPK(examAttemptsPK);
        attempts.setUser(user);
        attempts.setExam(exam);

        List<AttemptResult> attemptResultList = new ArrayList<>();
        for (Question q : questions) {
            Map<String, Object> par = new HashMap<String, Object>();
            par.put("q", q.getId());
            par.put("r", Short.parseShort("1"));
            Choice answers = crudService.findEntByJPQuery("FROM Choice p WHERE p.question.id = :q AND p.rightchoice = :r", par);

            // AnswerSession = 1223_A
            String[] sessionAnswers = session.getAttribute(q.getId().toString())!=null ? ((String) session.getAttribute(q.getId() + "")).split("_") : null;
            if (sessionAnswers != null && sessionAnswers[0].equals(answers.getId() + "")) {
                correct++;
            }

            Choice choice = null;
            if(sessionAnswers !=null){
                Integer ansId = Integer.parseInt(sessionAnswers[0]);
                choice = (session.getAttribute(q.getId() + "")) != null ? crudService.get(Choice.class, ansId) : null;
            }

            if (choice != null) {
                AttemptResult attemptResult = new AttemptResult();
                attemptResult.setChoice(choice);
                attemptResult.setExamAttempts(attempts);
                attemptResultList.add(attemptResult);
            }
        }

        double score = ((double) correct / questions.size()) * 100;
        model.addObject("percentage", (int)score);
        attempts.setScore(score);

        attempts.setAttemptResultList(attemptResultList);


        Map<String, Object> par = new HashMap<String, Object>();
        par.put("user", attempts.getExamAttemptsPK().getUser());
        par.put("exam", attempts.getExamAttemptsPK().getExam());
        par.put("timestamp", attempts.getExamAttemptsPK().getTimestamp());

        ExamAttempts eA = crudService.findEntByJPQueryT("SELECT e FROM ExamAttempts e WHERE e.examAttemptsPK.user = :user AND e.examAttemptsPK.exam = :exam AND e.examAttemptsPK.timestamp = :timestamp", par);



//        for (AttemptResult attemptResult:attemptResultList){
//            System.out.println(attemptResult);
//        }


        // Saving Attempts
        if(eA == null){
            crudService.Save(attempts);
        }else{
            crudService.update(attempts);
        }

        return model;
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public ModelAndView history(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session) {

        ModelAndView modelo = new ModelAndView("exam-history");

        User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);
        List<ExamAttempts> examAttempts = crudService.findByJPQuery("SELECT e FROM ExamAttempts e where e.user.id = " + user.getId() + " ORDER BY e.examAttemptsPK.timestamp DESC", null);;

        modelo.addObject("examAttempts", examAttempts);
        modelo.addObject("user", user);
        return modelo;

    }


    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView admin(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session) {
        ModelAndView modelo = new ModelAndView("403");
        return modelo;
    }


    @RequestMapping(value = "/help", method = RequestMethod.GET)
    public ModelAndView help(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session) {
        ModelAndView modelo = new ModelAndView("help");
        return modelo;
    }

    private Date stringToDate(String strDate, Locale locale) throws ParseException {
        return new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", locale).parse(strDate);
    }

    private String dateToString(Date date) {
        DateFormat format = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        return format.format(date);
    }
}
