package mz.co.osoma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/exam")
public class ExamController {

    @RequestMapping("/details")
    public String index(Map<String, Object> model) {
        return "exam-details";
    }
}
