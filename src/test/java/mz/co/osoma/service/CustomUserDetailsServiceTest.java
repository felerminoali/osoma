package mz.co.osoma.service;

import mz.co.osoma.config.HibernateConf;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
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


    @Test
    public void loadUserByUsername() {
        String email="felerminoali@gmail.com";

        CustomUserDetailsService customUserDetailsService=new CustomUserDetailsService();
        customUserDetailsService.crudService=crudService;
        Assert.assertNotNull(customUserDetailsService.loadUserByUsername(email));

    }
}