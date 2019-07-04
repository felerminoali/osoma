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

        examAttempts.setExamAttemptsPK(new ExamAttemptsPK());
    }

    @Test
    public void setExamAttemptsPK() {
    }

    @Test
    public void getAttemptDatetime() {
    }

    @Test
    public void setAttemptDatetime() {
    }

    @Test
    public void getResult() {
    }

    @Test
    public void setResult() {
    }

    @Test
    public void getUser() {
    }

    @Test
    public void setUser() {
    }

    @Test
    public void getExam() {
    }

    @Test
    public void setExam() {
    }

    @Test
    public void hashCode1() {
    }

    @Test
    public void equals1() {
    }

    @Test
    public void toString1() {
    }
}