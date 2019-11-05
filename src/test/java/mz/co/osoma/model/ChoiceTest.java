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

public class ChoiceTest {

    @Test
    public void getId() {
        Choice choice = new Choice();
        Integer id = 200;
        choice.setId(id);
        assertEquals(id, choice.getId());
    }

    @Test
    public void getCharId() {
        Choice choice = new Choice();
        String charId = "1111";
//        choice.setCharId(charId);
//        assertEquals(choice.getCharId(),charId);
    }

    @Test
    public void getAnswer() {
        Choice choice = new Choice();
        String answer = "1111";
        choice.setAnswer(answer);
        assertEquals(choice.getAnswer(),answer);
    }

    @Test
    public void getImage() {
        Choice choice = new Choice();
        String answer = "1111";
        choice.setAnswer(answer);
        assertEquals(choice.getAnswer(),answer);
    }

    @Test
    public void setImage() {
        Choice choice = new Choice();
        String imagem = "imagem1";
        choice.setImage(imagem);
        assertEquals(choice.getImage(),imagem);
    }

    @Test
    public void getFraction() {
        Choice choice = new Choice();
        choice.setFraction(Long.valueOf(1000));
        assertEquals(Long.valueOf(1000), choice.getFraction());
    }


    @Test
    public void hashCode1() {
        Choice choice = new Choice();
        assertEquals(choice.hashCode(),0);
    }

    @Test
    public void equals() {
        Integer examId = 12;
        Choice question = new Choice(examId);

        assertFalse(question.equals(new Question()));
        assertTrue(question.equals(new Choice(examId)));
        assertFalse(question.equals(new Countries()));
        question.setId(null);
        assertFalse(question.equals(new Choice(examId)));

    }

    @Test
    public void toString1() {
        Choice choice = new Choice();
        assertTrue(choice.toString().length() > 0);
    }
}
