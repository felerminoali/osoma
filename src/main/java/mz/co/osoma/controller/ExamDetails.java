package mz.co.osoma.controller;


import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller

public class ExamDetails {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;


    @RequestMapping(value = "/exam-details/{id}", method = RequestMethod.GET)
    public ModelAndView examDetailsShow(@PathVariable("id") int id, HttpSession session) {

        ModelAndView model = new ModelAndView("exam-details");

        //session.invalidate();

        Exam exam = crudService.findEntByJPQueryT("SELECT e FROM Exam e where e.id = " + id, null);
        if (exam != null) {
            University university = crudService.findEntByJPQueryT("SELECT u FROM University u where u.id = " + exam.getUniversity().getId(), null);
            Category category = crudService.findEntByJPQueryT("SELECT c FROM Category c where c.id = " + exam.getCategory().getId(), null);
            model.addObject("university", university);
            model.addObject("category", "../" + category.getCover());
            model.addObject("exame", exam);

        } else {

            model.addObject("exame", null);
        }
        return model;
    }

    @RequestMapping(value = "/exam-details", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelo = new ModelAndView("exam-details");
        modelo.addObject("exame", null);
        return modelo;
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

            String htmlCaseOfStudy = question.getCaseofstudy();

            if (htmlCaseOfStudy != null) {
                String noHtmlCaseOfStudy = Jsoup.parse(htmlCaseOfStudy).text();
                String shortText = noHtmlCaseOfStudy.substring(0, 120) + " ... " + "<a href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\">Monstrar mais</a>";
                modelo.addObject("shortText", shortText);
                modelo.addObject("htmlCaseOfStudy", htmlCaseOfStudy);
            }

            List<Choice> choices =
                    crudService.findByJPQuery("SELECT e FROM Choice e, Question q where e.question = q.id and  q.id = " + question.getId(), null);

            Collections.shuffle(choices);

            modelo.addObject("questions", question);
            modelo.addObject("choices", choices);

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

    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public ModelAndView results(HttpServletRequest request, HttpSession session) {

        ModelAndView modelo = new ModelAndView("exam-results");

        int idExam = Integer.parseInt(request.getParameter("examid"));

        String start = request.getParameter("starttimestamp");

        Exam exam = crudService.get(Exam.class, idExam);

        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + idExam, null);

        modelo.addObject("questions", questions);
        modelo.addObject("exam", exam);
        modelo.addObject("qtdquestion", questions.size());
        modelo.addObject("start", start);
        Locale l = new Locale("pt", "BR");
        Calendar c = Calendar.getInstance(l);
        SimpleDateFormat df = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss", l);
        modelo.addObject("finish", df.format(c.getTime()));

        int correct = 0;

        for (Question q : questions) {


            Map<String, Object> par = new HashMap<String, Object>();
            par.put("q", q.getId());
            par.put("r", Short.parseShort("1"));
            Choice choice = crudService.findEntByJPQuery("FROM Choice p WHERE p.question.id = :q AND p.rightchoice = :r", par);

            if (session.getAttribute(q.getId() + "") != null && session.getAttribute(q.getId() + "").equals(choice.getId() + "")) {
                correct++;
            }

        }
        modelo.addObject("percentage", ((float) correct / questions.size()) * 100.00f);
        return modelo;
    }
}
