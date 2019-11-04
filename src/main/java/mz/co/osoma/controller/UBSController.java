package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        par.put("year", 2019);

        String hqlQuery = "SELECT e FROM Exam e WHERE e.university.id = :uni and  e.examYear = :year";
        List<Exam> exams = crudService.findByJPQuery(hqlQuery, par);

        ModelAndView model = new ModelAndView("exam-ubs");
        model.addObject("exams", exams);

        return model;

    }


    @RequestMapping(value = "/exam-details/{id}", method = RequestMethod.GET)
    public ModelAndView examDetailsShow(@AuthenticationPrincipal final UserDetails userDetails, @PathVariable("id") int id, HttpSession session) {

        ModelAndView model = new ModelAndView("exam-ubs-details");

//        session.invalidate();

        Exam exam = crudService.findEntByJPQueryT("SELECT e FROM Exam e where e.id = " + id, null);
        if (exam != null) {
            University university = crudService.findEntByJPQueryT("SELECT u FROM University u where u.id = " + exam.getUniversity().getId(), null);
            Category category = crudService.findEntByJPQueryT("SELECT c FROM Category c where c.id = " + exam.getCategory().getId(), null);
            model.addObject("university", university);
            model.addObject("category", "../" + category.getCover());
            model.addObject("exame", exam);

            User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);
            List<ExamAttempts> examAttempts = crudService.findByJPQuery("SELECT e FROM ExamAttempts e where e.user.id = " + user.getId()+" and e.exam.id="+id, null);;


            boolean attemptAllowed = true;
//            if(examAttempts!=null && examAttempts.size()>0){
//                attemptAllowed = false;
//            }

            model.addObject("attemptAllowed", attemptAllowed);

        } else {

            model.addObject("exame", null);
        }

        return model;
    }

    @RequestMapping(value = "/online-test", method = RequestMethod.GET)
    public ModelAndView examDiagnosis(@RequestParam("id") int id, @RequestParam("question") Optional<Integer> pg, HttpSession session) {
        ModelAndView modelo = new ModelAndView("diagnosis");
        List<Question> questions = questionsOfExam(id);

        int nrQuestion = 0;
        modelo.addObject("id", id);

        if (questions != null && questions.size() > 0) {
            if (pg.isPresent()) {
                nrQuestion = pg.get();
            }
        } else if (questions == null) {
            return new ModelAndView("exam-noquestion");
        }

        if (questions.size() > nrQuestion) {
            Question question = questions.get(nrQuestion);
            List<QuestionAnswers> questionAnswers =
                    crudService.findByJPQuery("SELECT e FROM QuestionAnswers e, Question q where e.question = q.id and  q.id = " + question.getId(), null);

            Collections.shuffle(questionAnswers);

            modelo.addObject("questions", question);
            modelo.addObject("questionAnswers", questionAnswers);


            if (session != null) {
                if (session.getAttribute(question.getId().toString()) != null) {
                    int answerId = Integer.parseInt((String) session.getAttribute(question.getId().toString()));
                    modelo.addObject("sessionAnswer", answerId);
                }
            }

            modelo.addObject("quantidadeExames", questions.size());
            modelo.addObject("next", nrQuestion + 1);
            Locale l = new Locale("pt", "BR");
            Calendar c = Calendar.getInstance(l);
            SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", l);
            modelo.addObject("starttimestamp", df.format(c.getTime()));
        } else {
            modelo.addObject("next", -1);
            modelo.addObject("quantidadeExames", questions.size());
            return new ModelAndView("exam-results");
        }

        return modelo;
    }

    public List<Question> questionsOfExam(int id) {
        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + id, null);

        if (questions.size() == 0) {
            return null;
        } else {
            return questions;
        }
    }

    @RequestMapping(value = "/results", method = RequestMethod.POST)
    public ModelAndView results(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session) {

        ModelAndView modelo = new ModelAndView("exam-results");

        int idExam = Integer.parseInt(request.getParameter("examid"));

        String start = request.getParameter("starttimestamp");

        Exam exam = crudService.get(Exam.class, idExam);

        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + idExam, null);

        modelo.addObject("questions", questions);
        modelo.addObject("exam", exam);
        modelo.addObject("qtdquestion", questions.size());
        modelo.addObject("start", start);
        Locale locale = new Locale("pt", "BR");
        Calendar c = Calendar.getInstance(locale);
        SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", locale);
        modelo.addObject("finish", df.format(c.getTime()));

        int correct = 0;


        for (Question q : questions) {
            Map<String, Object> par = new HashMap<String, Object>();
            par.put("q", q.getId());
            par.put("r", Short.parseShort("1"));
            QuestionAnswers answers = crudService.findEntByJPQuery("FROM QuestionAnswers p WHERE p.question.id = :q AND p.rightchoice = :r", par);

            if (session.getAttribute(q.getId() + "") != null && session.getAttribute(q.getId() + "").equals(answers.getId() + "")) {
                correct++;
            }
        }

        double result = ((double) correct / questions.size()) * 100.00f;
        modelo.addObject("percentage", result);

        ExamAttempts attempts = new ExamAttempts();
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK();
        examAttemptsPK.setExam(exam.getId());

        User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);

        examAttemptsPK.setExam(exam.getId());
        examAttemptsPK.setUser(user.getId());
        examAttemptsPK.setEnd(c.getTime());

        try {
            Date startDate = stringToDate(start, locale);
            attempts.setStart(startDate);
        }catch(ParseException e){
            e.printStackTrace();
        }

        attempts.setExamAttemptsPK(examAttemptsPK);
        attempts.setResult(result);

        crudService.Save(attempts);

        return modelo;
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public ModelAndView history(@AuthenticationPrincipal final UserDetails userDetails, HttpServletRequest request, HttpSession session) {

        ModelAndView modelo = new ModelAndView("exam-history");


        User user = crudService.findEntByJPQuery("FROM User u WHERE u.email = '" + ((CustomUserDetails) userDetails).getEmail() + "'", null);

        List<ExamAttempts> examAttempts = crudService.findByJPQuery("SELECT e FROM ExamAttempts e where e.user.id = " + user.getId(), null);;

        modelo.addObject("examAttempts",examAttempts);

//      long diffInMillies = Math.abs(secondD.getTime() - firstDate.getTime());
//        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);



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


}
