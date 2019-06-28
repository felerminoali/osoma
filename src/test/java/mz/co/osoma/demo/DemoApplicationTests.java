package mz.co.osoma.demo;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.controller.HomeController;
import mz.co.osoma.service.CRUDService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration (classes = {HibernateConf.class})
public class DemoApplicationTests {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;


    @Test
    public void contextLoads() {


    }

}

