package mz.co.osoma.demo;

import mz.co.osoma.DemoApplication;
import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.config.SecurityConfiguration;
import mz.co.osoma.config.WebMVCConfig;
import mz.co.osoma.controller.HomeController;
import mz.co.osoma.dao.CRUDDao;
import mz.co.osoma.dao.CRUDDaoImpl;
import mz.co.osoma.model.Exam;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.CRUDServiceImpl;
import org.hibernate.service.spi.InjectService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.util.ApplicationContextTestUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
classes = HibernateConf.class)
public class DemoApplicationTests {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Test
    public void contextLoads() throws Exception{
        HomeController homeController = new HomeController();

        //crudService = getCrudService();
        List<Exam> list = crudService.findByJPQuery("SELECT e FROM Exam e", null);

        /*homeController.model = new ModelAndView("index");

        Optional<Integer> ano = Optional.of(2005);
        Optional<Integer> universidade = Optional.of(2);
        Optional<Integer> exame = Optional.of(92);
        Optional<String> search = Optional.of("bio");
        List<Exam> examList = homeController.filterExam(ano, universidade, exame, search);
        */
        //assertNoNull(crudService);
        Assert.assertEquals(list.size(), 9);

    }

}