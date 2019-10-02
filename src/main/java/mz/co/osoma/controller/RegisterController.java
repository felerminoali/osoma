package mz.co.osoma.controller;

import mz.co.osoma.model.Province;
import mz.co.osoma.model.University;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class RegisterController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView index(){


        ModelAndView model = new ModelAndView("user-register");

        List<Province> provinceList = crudService.getAll(Province.class);
        List<University> universities = crudService.getAll(University.class);

        model.addObject("provinceList", provinceList);
        model.addObject("universities", universities);

        return model;
    }
}
