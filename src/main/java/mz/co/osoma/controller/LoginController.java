package mz.co.osoma.controller;

import mz.co.osoma.model.Exam;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
public class LoginController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;
    public User user;
    private List<Exam> exams = new ArrayList<Exam>();
    private List<User> users = new ArrayList<>();


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView("login");
        model.addObject("error", 0);
        return model;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public ModelAndView index(@RequestParam("email")Optional<String> email,
                              @RequestParam("password")Optional<String> password,
                              @RequestParam("pg") Optional<Integer> pg,@RequestParam("t2pg") Optional<Integer> t2pg) {


        boolean login = validLogin(email.get(), password.get());

        if(login){
            ModelAndView model = new ModelAndView("adminDashboard");
            model.addObject("email", email.get());
            exams = crudService.getAll(Exam.class);
            users = crudService.getAll(User.class);

            HomeController homeController = new HomeController();

            homeController.setModel(model);
            homeController.setExams(exams);
            homeController.setUsers(users);
            homeController.pagination(pg);
            homeController.paginationUsers(t2pg);

            homeController.getModel().addObject("users", homeController.getUsers());
            homeController.getModel().addObject("exams", homeController.getExams());
            return homeController.getModel();

        }else{
            ModelAndView model = new ModelAndView("login");

            model.addObject("error", 1);
            return model;
        }

    }
    public boolean validLogin(String email, String password){
        user = this.crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = '"+email+"'", null);
        return user != null && user.getPassword().equals(password);

    }

}
