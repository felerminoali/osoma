package mz.co.osoma.model;

import mz.co.osoma.config.HibernateConf;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigInteger;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)

public class QuestionTest {

    @Test
    public void getIdNull() {
        Question question=new Question();
        Assert.assertNull(question.getId());
    }

    @Test
    public void getIdNotNull() {
        Optional <Integer> id=Optional.of(12);
        Question question=new Question();
        question.setId(id.hashCode());
        Assert.assertEquals(question.getId().hashCode(),id.hashCode());
    }

    @Test
    public void setId() {
        Question question = new Question();
        Integer id = 2000;
        question.setId(id);
        assertEquals(id,question.getId());
    }

    @Test
    public void getExamId() {
        Question question = new Question();
        Exam e = new Exam();
        question.setExamId(e);
        assertNotNull(question.getExamId());
    }


    @Test
    public void getName() {
        Question question = new Question();
        String name = "exame de matematica";
        question.setName(name);
        assertEquals(question.getName(),name);
    }

    @Test
    public void getQuestiontextformat() {
        Question question  = new Question();
        String format = "multichoice";
        question.setQuestiontextformat(format);
        assertEquals(format,question.getQuestiontextformat());
    }

    @Test
    public void getImage() {
        Question question = new Question();
        String image = "image1";
        question.setImage(image);
        assertEquals(image,question.getImage());
    }
    @Test
    public void getFeedback() {
        Question question = new Question();
        String feedback = "feed1";
        question.setFeedback(feedback);
        assertEquals(feedback,question.getFeedback());
    }

    @Test
    public void getTimecreated() {
        Question question = new Question();
        BigInteger feedback = BigInteger.valueOf(Integer.valueOf(100));
        question.setTimecreated(feedback);
        assertEquals(feedback,question.getTimecreated());
    }
    @Test
    public void getTimemodified() {
        Question question = new Question();
        BigInteger feedback =  BigInteger.valueOf(Integer.valueOf(100));
        question.setTimemodified(feedback);
        assertEquals(feedback,question.getTimemodified());
    }

    @Test
    public void getCreatedby() {
        Question question = new Question();
        Integer feed = 15;
        question.setCreatedby(feed);
        assertEquals(feed,question.getCreatedby());
    }

    @Test
    public void getModifiedby() {
        Question question = new Question();
        Integer feed = 15;
        question.setModifiedby(feed);
        assertEquals(feed,question.getModifiedby());
    }

    @Test
    public void getQtype() {
        Question question = new Question();
        Qtype feed = new Qtype();
        question.setQtype(feed);
        assertNotNull(feed);
    }

    @Test
    public void getQuestionAnswersList() {
        Question question = new Question();
        question.setQuestionAnswersList(null);
        assertNull(question.getQuestionAnswersList());
    }

    @Test
    public void hashCode1() {
        Question question = new Question();
        assertEquals(0,question.hashCode());
    }

    @Test
    public void equals1() {
        Integer examId = 12;
        Question question = new Question(examId);

        assertFalse(question.equals(new Question()));
        assertTrue(question.equals(new Question(examId)));
        assertFalse(question.equals(new Countries()));
        question.setId(null);
        assertFalse(question.equals(new Question(examId)));

    }

    @Test
    public void toString1() {
        Question question = new Question();
        assertTrue(question.toString().length() > 0);
    }
}
