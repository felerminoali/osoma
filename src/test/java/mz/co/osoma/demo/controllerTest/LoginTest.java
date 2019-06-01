package mz.co.osoma.demo.controllerTest;

import mz.co.osoma.controller.LoginController;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import static org.junit.Assert.*;

public class LoginTest {

    LoginController login;

    @Before
    public void variable(){
         this.login = new LoginController();
    }

    @Test
    public void testValidLogin(){

        assertFalse(login.validLogin("felerminoali@gmail.com","5555"));
    }

    @Test
    public void testInvalidLogin(){
        assertTrue(login.validLogin("felerminoali@gmail.com","1234"));
    }

}
