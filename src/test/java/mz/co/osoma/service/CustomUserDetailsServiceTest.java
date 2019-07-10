package mz.co.osoma.service;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.controller.LoginController;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)
public class CustomUserDetailsServiceTest {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    public CustomUserDetailsService customUserDetailsService;

    @Before
    public void setUp() throws Exception {
        customUserDetailsService = new CustomUserDetailsService();
        customUserDetailsService.crudService = crudService;
    }

    @Test
    public void loadUserByUsernameInvalidTest() {
        UserDetails userDetails= customUserDetailsService.loadUserByUsername("felerminoali2@gmail.com");
        assertNull(userDetails);
    }
    @Test
    public void loadUserByUsernameValidTest() {
        UserDetails userDetails= customUserDetailsService.loadUserByUsername("felerminoali@gmail.com");
        assertNotNull(userDetails);
    }
}