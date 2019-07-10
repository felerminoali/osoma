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

public class UniversityTest {

    @Test
    public void getId() {
        University university = new University();
        university.setId(12);
        assertEquals((long)university.getId(),12L);
    }

    @Test
    public void getName() {
        University university = new University();
        university.setName("elton");
        assertEquals("elton",university.getName());
    }

    @Test
    public void getShortname() {
        University university = new University(12);
        university.setShortname("el");
        assertEquals(university.getShortname(),"el");
    }

    @Test
    public void getExamList() {
        University university = new University();
        university.setExamList(null);
        assertNull(university.getExamList());

        List<Exam> exs = new ArrayList<Exam>();

        for (int i = 0 ; i  < 100 ;i++){
            exs.add(new Exam());
        }

        assertEquals(exs.size(),100);
    }

    @Test
    public void hashCode1() {
        University university = new University();
        assertEquals(university.hashCode(),0);

        university = new University(12);
        assertTrue(university.hashCode() > 0);
    }

    @Test
    public void equals() {
        Integer id = 12;
        University university = new University(id);
        assertFalse(university.equals(new Countries()));
        assertTrue(university.equals(new University(id)));
        assertFalse(university.equals(new Countries()));
        university.setId(null);
        assertFalse(university.equals(new University(id)));
    }

    @Test
    public void toString1() {
        University university = new University(12);
        assertTrue(university.toString().length() > 0);
    }
}
