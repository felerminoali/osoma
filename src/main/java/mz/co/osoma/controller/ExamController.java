package mz.co.osoma.controller;

import mz.co.osoma.model.Exam;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/exam")
public class ExamController {
    @Autowired
    @Qualifier("CRUDServiceImpl")
    private CRUDService crudService;

    @RequestMapping("/details")
    public String index(Map<String, Object> model) {

        return "exam-details";
    }
    @RequestMapping(value = "/exam-save",method = RequestMethod.GET)
    public String save(Exam exam){
        System.out.println("Cadastrando o exam "+exam);
        System.out.println("Salama");
        return "exam-form";
    }
}
