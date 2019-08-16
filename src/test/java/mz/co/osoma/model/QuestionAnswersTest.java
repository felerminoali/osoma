package mz.co.osoma.model;

import mz.co.osoma.config.HibernateConf;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)

public class QuestionAnswersTest {

    @Test
    public void getId() {
        QuestionAnswers questionAnswers = new QuestionAnswers();
        Integer id = 200;
        questionAnswers.setId(id);
        assertEquals(id,questionAnswers.getId());
    }

    @Test
    public void getCharId() {
        QuestionAnswers  questionAnswers = new QuestionAnswers();
        String charId = "1111";
//        questionAnswers.setCharId(charId);
//        assertEquals(questionAnswers.getCharId(),charId);
    }

    @Test
    public void getAnswer() {
        QuestionAnswers  questionAnswers = new QuestionAnswers();
        String answer = "1111";
        questionAnswers.setAnswer(answer);
        assertEquals(questionAnswers.getAnswer(),answer);
    }

    @Test
    public void getImage() {
        QuestionAnswers  questionAnswers = new QuestionAnswers();
        String answer = "1111";
        questionAnswers.setAnswer(answer);
        assertEquals(questionAnswers.getAnswer(),answer);
    }

    @Test
    public void setImage() {
        QuestionAnswers  questionAnswers = new QuestionAnswers();
        String imagem = "imagem1";
        questionAnswers.setImage(imagem);
        assertEquals(questionAnswers.getImage(),imagem);
    }

    @Test
    public void getFraction() {
        QuestionAnswers questionAnswers = new QuestionAnswers();
        questionAnswers.setFraction(Long.valueOf(1000));
        assertEquals(Long.valueOf(1000),questionAnswers.getFraction());
    }


    @Test
    public void hashCode1() {
        QuestionAnswers questionAnswers = new QuestionAnswers();
        assertEquals(questionAnswers.hashCode(),0);
    }

    @Test
    public void equals() {
        Integer examId = 12;
        QuestionAnswers question = new QuestionAnswers(examId);

        assertFalse(question.equals(new Question()));
        assertTrue(question.equals(new QuestionAnswers(examId)));
        assertFalse(question.equals(new Countries()));
        question.setId(null);
        assertFalse(question.equals(new QuestionAnswers(examId)));

    }

    @Test
    public void toString1() {
        QuestionAnswers questionAnswers = new QuestionAnswers();
        assertTrue(questionAnswers.toString().length() > 0);
    }
}
