package mz.co.osoma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CodingExamController {


    @GetMapping(value = "/coding")
    public ModelAndView coding(){
        ModelAndView model = new ModelAndView("code-exam");
        return model;
    }
}
