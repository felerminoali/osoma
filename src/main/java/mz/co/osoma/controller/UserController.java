package mz.co.osoma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/register")
    public String index(Map<String, Object> model) {
        return "register";
    }
}
