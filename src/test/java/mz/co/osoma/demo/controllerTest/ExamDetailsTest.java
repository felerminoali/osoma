package mz.co.osoma.demo.controllerTest;

import mz.co.osoma.controller.ExamDetails;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class ExamDetailsTest {

    ExamDetails examDetails;

    @Before
    public void initialize(){
        this.examDetails = new ExamDetails();

    }


    @Test
    public void notFoundExame(){
        assert(true);
    }
}
