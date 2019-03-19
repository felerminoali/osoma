package mz.co.osoma.controller;

import mz.co.osoma.model.Exam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value = "/exam-details")
public class ExamDetails {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "exam-details";
    }
}
