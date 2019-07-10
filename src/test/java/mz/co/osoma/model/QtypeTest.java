package mz.co.osoma.model;

import mz.co.osoma.config.HibernateConf;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)

public class QtypeTest {

    Qtype qtype = new Qtype();

    @Test
    public void getId(){

        qtype.setId(2);

        long identifiy = 2;
        long auxiliar = qtype.getId();

        assertEquals(identifiy,auxiliar);
    }

    @Test

    public  void setId(){

        long id = 1;
        qtype.setId((int)id);

        assertEquals((long)qtype.getId(),id);
    }

    @Test
    public void getType(){

        String val = "single-response";
        qtype.setType(val);
        assertEquals(val , qtype.getType());
    }

    @Test
    public void setType(){

        qtype.setType("Time2");
        assertEquals("Time2", qtype.getType());
    }

    @Test
    public void getQuestionList(){

        qtype.getQuestionList();
        assertNull(qtype.getQuestionList());
    }

    @Test
    public void setQuestionList(){

        qtype.setQuestionList(null);
        assertNull(qtype.getQuestionList());
    }

    @Test
    public void hashCode2() {

        Integer id = 1;
        Qtype qtype1 = new Qtype(id);
        assertNotEquals(qtype1, qtype1.hashCode());
    }

    @Test
    public void equals2() {

        Integer id = 12;
        Qtype qtype1 = new Qtype(id);

        assertFalse(qtype1.equals(new Qtype()));
        assertTrue(qtype1.equals(new Qtype(id)));
      //  assertFalse(qtype1.equals(new Admin()));
        qtype1.setId(null);
        assertFalse(qtype1.equals(new Qtype(id)));
    }

    @Test
    public void toString2() {


        Integer id = 12;
        Qtype qtype = new Qtype(id);
        assertNotEquals(qtype.toString(),"");
        assertNotEquals(qtype.toString(),null);
        assertEquals(qtype.toString(),"mz.co.osoma.model.Qtype[ id=" + qtype.getId() + " ]");
    }
}
