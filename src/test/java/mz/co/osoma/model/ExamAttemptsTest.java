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


public class ExamAttemptsTest {

    @Test
    public void getExamAttemptsPK() {

        ExamAttempts examAttempts=new ExamAttempts();
        ExamAttemptsPK examAttemptsPK =  new ExamAttemptsPK();
        examAttempts.setExamAttemptsPK( examAttemptsPK);
        assertEquals(examAttemptsPK,examAttempts.getExamAttemptsPK());
    }


//    @Test
//    public void getAttemptDatetime() {
//        ExamAttempts examAttempts = new ExamAttempts();
//        examAttempts.setAttemptDatetime(null);
//        assertEquals(null,examAttempts.getAttemptDatetime());
//    }
//
//    @Test
//    public void getResult() {
//        long result = 200;
//        ExamAttempts examAttempts = new ExamAttempts();
//        examAttempts.setResult(result);
//        assertEquals(result,(long)examAttempts.getResult());
//    }

    @Test
    public void getUser() {
        User user = new User();
        ExamAttempts examAttempts = new ExamAttempts();
        examAttempts.setUser(user);
        assertNotNull(examAttempts.getUser());
    }

    @Test
    public void getExam() {
        Exam exam = new Exam();
        ExamAttempts examAttempts = new ExamAttempts();
        examAttempts.setExam(exam);
        assertNotNull(examAttempts.getExam());
    }

    @Test
    public void hashCode1() {
        ExamAttempts examAttempts = new ExamAttempts();
        assertEquals(examAttempts.hashCode(),0);
    }

    @Test
    public void equals1() {
        ExamAttemptsPK examAttemptsPK = new ExamAttemptsPK();
        ExamAttempts examAttempts = new ExamAttempts(examAttemptsPK);
        assertFalse(examAttempts.equals(new Countries()));
        assertTrue(examAttempts.equals(new ExamAttempts(examAttemptsPK)));
        assertFalse(examAttempts.equals(new Countries()));
        examAttempts.setExamAttemptsPK(null);
        assertFalse(examAttempts.equals(new ExamAttempts(examAttemptsPK)));
    }

//    @Test
//    public void toString1() {
//        ExamAttempts examAttempts = new ExamAttempts();
//        assertNotNull(examAttempts.toString());
//        assertTrue(examAttempts.toString().length() > 0);
//
//        int examId = 2015 ;
//        int userId = 2;
//        ExamAttempts examAttempts1 = new ExamAttempts(examId,userId);
//        assertTrue(examAttempts1.toString().length() > 0);
//
//    }
}
