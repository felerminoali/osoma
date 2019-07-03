package mz.co.osoma.controller;


import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller

public class ExamDetails {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/exam-details/{id}", method = RequestMethod.GET)
    public ModelAndView examDetailsShow(@PathVariable("id") int id) {

        ModelAndView model= new ModelAndView("exam-details");

        Exam exam = crudService.findEntByJPQueryT("SELECT e FROM Exam e where e.examId = " + id, null);
        if(exam != null) {
            University university = crudService.findEntByJPQueryT("SELECT u FROM University u where u.id = " + exam.getUniversity().getId(), null);
            Category category = crudService.findEntByJPQueryT("SELECT c FROM Category c where c.id = " + exam.getCategory().getId(), null);
            model.addObject("university", university);
            model.addObject("category", "../" + category.getCover());
            model.addObject("exame", exam);

        }else {

            model.addObject("exame", null);
        }

        return model;
    }

    @RequestMapping(value = "/exam-details", method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelo = new ModelAndView("exam-details");
        modelo.addObject("exame", null);
        return modelo;
    }

    @RequestMapping(value = "/online-test")
    public ModelAndView examDiagnosis(@RequestParam("id") int id, @RequestParam("question") Optional<Integer> pg){
        ModelAndView modelo = new ModelAndView("diagnosis");

        List<Question> questions = questionsOfExam(id);

        int nrQuestion = 0;
        if(questions.size()>0){
            if (pg.isPresent()){
                nrQuestion = pg.get();
            }
        }else{
            modelo.addObject("questions", null);
            return modelo;
        }
        Question question = questions.get(nrQuestion);
        List<QuestionAnswers> questionAnswers =
        crudService.findByJPQuery("SELECT e FROM QuestionAnswers e, Question q where e.question = q.id and  q.id = "+question.getId(), null);


        modelo.addObject("questions", question);
        modelo.addObject("questionAnswers", questionAnswers);
        modelo.addObject("id", id);


        modelo.addObject("quantidadeExames", questions.size());
        if(questions.size()>nrQuestion){
            modelo.addObject("next", nrQuestion+1);
        }else{
            modelo.addObject("next", -1);
        }
        return modelo;
    }

    public List<Question> questionsOfExam(int id){
        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.examId = " + id, null);

        if(questions == null){
            return null;
        }else{
            return questions;
        }
    }
    @RequestMapping(value = "/results", method = RequestMethod.POST)
    public ModelAndView results(){
        ModelAndView modelo = new ModelAndView("exam-results");
        modelo.addObject("exame", null);
        return modelo;
    }


}
