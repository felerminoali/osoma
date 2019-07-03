package mz.co.osoma.model;

import org.junit.Assert;
import org.junit.Test;

import java.util.Optional;

import static org.junit.Assert.*;

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
        Question question=new Question();

        Optional <Integer> id=Optional.of(12);


       // Assert.assertNotEquals(question.setId(id.hashCode()));

    }

    @Test
    public void getExamId() {
    }

    @Test
    public void setExamId() {
    }

    @Test
    public void getName() {
    }

    @Test
    public void setName() {
    }

    @Test
    public void getQuestiontextformat() {
    }

    @Test
    public void setQuestiontextformat() {
    }

    @Test
    public void getImage() {
    }

    @Test
    public void setImage() {
    }

    @Test
    public void getFeedback() {
    }

    @Test
    public void setFeedback() {
    }

    @Test
    public void getTimecreated() {
    }

    @Test
    public void setTimecreated() {
    }

    @Test
    public void getTimemodified() {
    }

    @Test
    public void setTimemodified() {
    }

    @Test
    public void getCreatedby() {
    }

    @Test
    public void setCreatedby() {
    }

    @Test
    public void getModifiedby() {
    }

    @Test
    public void setModifiedby() {
    }

    @Test
    public void getQtype() {
    }

    @Test
    public void setQtype() {
    }

    @Test
    public void getQuestionAnswersList() {
    }

    @Test
    public void setQuestionAnswersList() {
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