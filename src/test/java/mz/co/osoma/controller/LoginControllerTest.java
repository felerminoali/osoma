package mz.co.osoma.controller;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.service.CRUDService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.servlet.ModelAndView;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)
public class LoginControllerTest {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    public LoginController loginController;

    @Before
    public void setUp() throws Exception {
        loginController = new LoginController();
        loginController.crudService = crudService;
    }

    @Test
    public void index() {
        ModelAndView modelAndView = loginController.index();

        assertEquals(modelAndView.getModel().get("error"), 0);
    }

    @Test
    public void admin() {
    }

    @Test
    public void register() {
    }

    @Test
    public void index1() {
    }

    @Test
    public void validLogin() {
    }
}