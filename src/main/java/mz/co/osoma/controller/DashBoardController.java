package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin")
public class DashBoardController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView dashboard(){
        ModelAndView model = new ModelAndView("dashboard");
        return model;
    }

    @RequestMapping(value = "/charts", method = RequestMethod.GET)
    public ModelAndView charts(){
        ModelAndView model = new ModelAndView("charts");
        return model;
    }

}
