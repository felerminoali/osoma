package mz.co.osoma.controller;

import mz.co.osoma.model.Exam;
import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class DashBoardController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    private ModelAndView model;
    private List<Exam> exams = new ArrayList<Exam>();
    private List<User> users = new ArrayList<>();
    @RequestMapping(value = "/exams-admin", method = RequestMethod.GET)
    public ModelAndView adminDashBoard(@RequestParam("pg") Optional<Integer> pg
                                       ) {

        model = new ModelAndView("exams-admin");
        exams = crudService.getAll(Exam.class);

        users = crudService.getAll(User.class);

        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        //homeController.setUsers(users);
        homeController.pagination(pg);


       // homeController.getModel().addObject("users", homeController.getUsers());
        homeController.getModel().addObject("exams", homeController.getExams());
     // model.addObject("exams",exams);
      return homeController.getModel();


    }
    @RequestMapping(value = "/users-admin", method = RequestMethod.GET)
    public ModelAndView usersAdmin(
    ) {

        model = new ModelAndView("users-admin");
        users = crudService.getAll(User.class);
      /*  exams = crudService.getAll(Exam.class);


        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        homeController.setUsers(users);
        homeController.pagination(pg);

        homeController.paginationUsers(t2pg);

        homeController.getModel().addObject("users", homeController.getUsers());
        homeController.getModel().addObject("exams", homeController.getExams());
        */
      model.addObject("users",users);
      return model;
    }
    @RequestMapping(value = "/dash", method = RequestMethod.GET)
    public ModelAndView dashboardHome(
    ) {

        model = new ModelAndView("dashboard-home");
        users = crudService.getAll(User.class);

        return model;
    }

    @RequestMapping(value = "/explainers-admin", method = RequestMethod.GET)
    public ModelAndView explainersAdmin(
    ) {

        model = new ModelAndView("explainers-admin");

      /*  exams = crudService.getAll(Exam.class);
        users = crudService.getAll(User.class);

        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        homeController.setUsers(users);
        homeController.pagination(pg);

        homeController.paginationUsers(t2pg);

        homeController.getModel().addObject("users", homeController.getUsers());
        homeController.getModel().addObject("exams", homeController.getExams());
        */return model;


    }
        public void pagination(Optional<Integer> pg, Optional<Integer> table) {

            int length = 8;
            int min = 0;
            int max = length;
            if (pg.hashCode() > 1 && isValidPage(pg.get(), length,table.hashCode())) {
                min = max * (pg.hashCode() - 1);
                max = min + length;

                switch (table.hashCode()){
                    case 1: if (exams.size() < min) {
                                min = exams.size();
                            }
                            if (exams.size() < max) {
                                max = exams.size();
                            }

                            model.addObject("nPage", quantityPage(exams.size(), length));
                            if ( (pg.hashCode() > 1) && isValidPage(pg.get(), length,table.hashCode()) ) {
                                model.addObject("back", pg.hashCode() - 1);
                            } else {
                                model.addObject("back", 0);
                            }

                            if (pg.hashCode() <= quantityPage(exams.size(), length)) {
                                int next = pg.hashCode() == 0 ? 2 : 1;
                                model.addObject("next", pg.hashCode() + next);
                            }else{
                                model.addObject("next", 0);
                            }

                            if (exams.size() < max) {
                                max = exams.size();
                            }
                            exams = exams.subList(min, max); break;

                    case 2: if (users.size() < min) {
                                min = users.size();
                            }
                            if (users.size() < max) {
                                max = users.size();
                            }
                            model.addObject("t2Page", quantityPage(exams.size(), length));
                            if ( (pg.hashCode() > 1) && isValidPage(pg.get(), length,table.hashCode()) ) {
                                model.addObject("t2back", pg.hashCode() - 1);
                            } else {
                                model.addObject("t2back", 0);
                            }

                            if (pg.hashCode() <= quantityPage(users.size(), length)) {
                                int next = pg.hashCode() == 0 ? 2 : 1;
                                model.addObject("t2next", pg.hashCode() + next);
                            }else{
                                model.addObject("t2next", 0);
                            }

                            if (users.size() < max) {
                                max = users.size();
                            }
                            users = users.subList(min, max); break;
                    }


            }


            model.addObject("nPage", quantityPage(exams.size(), length));
            if ( (pg.hashCode() > 1) && isValidPage(pg.get(), length,table.hashCode()) ) {
                model.addObject("back", pg.hashCode() - 1);
            } else {
                model.addObject("back", 0);
            }

            if (pg.hashCode() <= quantityPage(exams.size(), length)) {
                int next = pg.hashCode() == 0 ? 2 : 1;
                model.addObject("next", pg.hashCode() + next);
            }else{
                model.addObject("next", 0);
            }

            if (exams.size() < max) {
                max = exams.size();
            }
            exams = exams.subList(min, max);

        }




    private int quantityPage(int size, int nPage) {
        return size % nPage != 0 ? ((size / nPage) + 1) : (size / nPage);
    }

    private boolean isValidPage(Integer page, int length,Integer table){
        switch (table.hashCode()){
            case 1: return page.hashCode() <= quantityPage(exams.size(), length);
            case 2: return page.hashCode()<= quantityPage(users.size(),length);
        }
        return false;
    }
}
