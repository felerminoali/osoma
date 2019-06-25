package mz.co.osoma.demo.controllerTest;

import mz.co.osoma.controller.ExamDetails;
import mz.co.osoma.service.CRUDService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;


public class ExamDetailsTest {

    @Autowired
    public CRUDService crudService;

    ExamDetails examDetails;

    @Before
    public void initialize(){
        this.examDetails = new ExamDetails();

    }

    @Test
    public void teste1(){

            Assert.assertEquals(crudService,null);

    }

    @Test
    public void notFoundExame(){
        assert(true);
    }
}
