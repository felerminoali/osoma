package mz.co.osoma.controller;

import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;
    public User user;

    @RequestMapping(value = "/login")
    public ModelAndView index() {

        ModelAndView model = new ModelAndView("login");
        model.addObject("error", null);

        return model;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView admin() {
        ModelAndView model = new ModelAndView("adminLogin");
        model.addObject("error", 0);
        return model;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public ModelAndView index(@RequestParam("login_email")String email,
                              @RequestParam("login_password")String password) {

        boolean login = validLogin(email, password);
        if(login){
            ModelAndView model = new ModelAndView("dashboard-home");
            User u = crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = '"+email+"'", null);

            model.addObject("email", u.getName());
            return model;
        }else{
            ModelAndView model = new ModelAndView("adminLogin");

            model.addObject("error", 0);
            return model;
        }

    }
    public boolean validLogin(String email, String password){
        user = this.crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = '"+email+"'", null);
        return user != null && "1234".equals(password);

    }

}
