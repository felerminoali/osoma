package mz.co.osoma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;


@Controller
public class LoginController {

    @RequestMapping("/login")
    public String index(Map<String, Object> model) {
        return "login";
    }
}
