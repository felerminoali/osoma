package mz.co.osoma.controller;

import mz.co.osoma.model.University;
import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.CRUDServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.Null;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
public class LoginController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;
    public User user;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView index() {

        ModelAndView model = new ModelAndView("login");
        model.addObject("error", 0);
        return model;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView admin() {
        ModelAndView model = new ModelAndView("adminLogin");
        //model.addObject("error", 0);
        return model;
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView model = new ModelAndView("user-register");

        List<University> universities=crudService.getAll(University.class);
        model.addObject("universities",universities);
        model.addObject("error", 0);
        return model;
    }

    @RequestMapping(value = "/admin_", method = RequestMethod.POST)
    public ModelAndView index(@RequestParam("login_email")Optional<String> email,
                              @RequestParam("login_password")Optional<String> password) {

        boolean login = validLogin(email.get(), password.get());

        if(login){
            ModelAndView model = new ModelAndView("dashboard-home");
            model.addObject("email", email.get());
            return model;
        }else{
            ModelAndView model = new ModelAndView("adminLogin");

            model.addObject("error", 1);
            return model;
        }

    }
    public boolean validLogin(String email, String password){
        user = this.crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = '"+email+"'", null);
        return user != null && user.getPassword().equals(password);

    }

}
