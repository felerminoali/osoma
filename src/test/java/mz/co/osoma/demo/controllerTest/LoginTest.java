package mz.co.osoma.demo.controllerTest;

import mz.co.osoma.controller.LoginController;
import mz.co.osoma.service.CRUDService;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.Assert.*;

@Controller
public class LoginTest {

    @Autowired
    public CRUDService crudService;

    private MockMvc mockMvc;
    private LoginController login;

    @Before
    public void variable(){
         this.login = new LoginController();
         this.mockMvc = MockMvcBuilders.standaloneSetup(crudService).build();
    }
    @Test
    public void crudService(){

    }

    @Test
    public void testValidLogin() throws Exception {
        this.mockMvc.perform(MockMvcRequestBuilders.get("/index")).andExpect(MockMvcResultMatchers.status().isOk());
    }

    @Test
    public void testInvalidLogin(){
        assertTrue(login.validLogin("felerminoali@gmail.com","1234"));
    }

}
