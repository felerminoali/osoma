package mz.co.osoma.model;

import mz.co.osoma.config.HibernateConf;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)

public class ExamAttemptsPKTest {

    @Test
    public void getExamId() {
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK();
        examAttemptsPK.setExamId(1);
        Integer id = 1;
        Integer idd = examAttemptsPK.getExamId();
        assertEquals(id, idd);
    }


    @Test
    public void getUserId() {
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK();
        Integer id = 1;
        examAttemptsPK.setUserId(id);
        Integer idd = examAttemptsPK.getUserId();
        assertEquals(id, idd);
    }



    @Test
    public void hashCode1() {
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK();
        assertEquals(examAttemptsPK.hashCode(),0);
    }

    @Test
    public void equals() {
        Integer examId = 12;
        Integer userId = 20;

        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK(examId,userId);
        examAttemptsPK.setExamId(examId);
        assertFalse(examAttemptsPK.equals(new Exam()));
        assertTrue(examAttemptsPK.equals(new ExamAttemptsPK(examId,userId)));
        assertFalse(examAttemptsPK.equals(new ExamAttemptsPK()));
        examAttemptsPK.setExamId(examId);
        assertFalse(examAttemptsPK.equals(new ExamAttemptsPK(examId,2000)));

    }

    @Test
    public void toString1() {
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK(200,22);
        assertTrue(examAttemptsPK.toString().length() > 1);
    }
}
