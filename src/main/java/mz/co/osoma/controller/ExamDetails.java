package mz.co.osoma.controller;


import mz.co.osoma.model.Category;
import mz.co.osoma.model.Exam;
import mz.co.osoma.model.University;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller

public class ExamDetails {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/exam-details/{id}", method = RequestMethod.GET)
    public ModelAndView index(Optional<Integer> exameid, @PathVariable("id") int identificador) {

        ModelAndView model= new ModelAndView("exam-details");

        Exam exam = crudService.findEntByJPQueryT("SELECT e FROM Exam e where e.examId = " + identificador, null);
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


}
