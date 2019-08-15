package mz.co.osoma.controller;


import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;
import java.util.Optional;

@Controller

public class ExamDetails {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;


    @RequestMapping(value = "/exam-details/{id}", method = RequestMethod.GET)
    public ModelAndView examDetailsShow(@PathVariable("id") int id, HttpSession session) {

        ModelAndView model = new ModelAndView("exam-details");

        session.invalidate();

        Exam exam = crudService.findEntByJPQueryT("SELECT e FROM Exam e where e.examId = " + id, null);
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


    @RequestMapping(value = "/online-test")
    public ModelAndView examDiagnosis(@RequestParam("id") int id, @RequestParam("question") Optional<Integer> pg, HttpSession session) {
        ModelAndView modelo = new ModelAndView("diagnosis");

        List<Question> questions = questionsOfExam(id);

        int nrQuestion = 0;
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

            modelo.addObject("questions", question);
            modelo.addObject("questionAnswers", questionAnswers);
            modelo.addObject("id", id);


            if (session != null) {
                if( session.getAttribute(question.getId().toString()) !=null){
                    int answerId = Integer.parseInt((String)session.getAttribute(question.getId().toString()));
                    modelo.addObject("sessionAnswer", answerId);
                }
            }

            modelo.addObject("quantidadeExames", questions.size());
            modelo.addObject("next", nrQuestion + 1);
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
    public ModelAndView results(@RequestParam int idExam) {


        ModelAndView modelo = new ModelAndView("exam-results");
       /* List<Question> questions=questionsOfExam(idExam);

        List<QuestionAnswers> questionAnswers =
                crudService.findByJPQuery("SELECT e FROM QuestionAnswers e, Question q where e.question = q.id and  q.id = "  , null);

        modelo.addObject("questions", questions);
        modelo.addObject("questionAnswers", questionAnswers);
        modelo.addObject("id", idExam);
*/
        return modelo;
    }
}
