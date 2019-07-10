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

public class ExamGroupTest {

    ExamGroup examGroup = new ExamGroup();


        @Test
        public void testExamGroup1(){

            int count = 4;
            examGroup.setCount(count);

            int year = 2005;
            examGroup.setYear(year);

            ExamGroup ex = new ExamGroup(count, year);

            assertFalse(ex.equals(new ExamGroup()));
        }

    @Test
    public void testExamGroup2() {


        String description = "Matematica";
        int count = 5;

        examGroup.setCount(count);

        examGroup.setDescription(description);

        ExamGroup ex = new ExamGroup(count, description);

        assertFalse(ex.equals(new ExamGroup()));
    }

    public void testExamGroup3() {


        String description = "Matematica";
        int count = 5;
        int id = 52;

        examGroup.setCount(count);
        examGroup.setId(id);
        examGroup.setDescription(description);

        ExamGroup ex = new ExamGroup(count, description, id);

        assertFalse(ex.equals(new ExamGroup()));
    }


    @Test
    public void getCount() {

        int count = 2;
        examGroup.setCount(count);
        assertEquals(count, examGroup.getCount());
    }

    @Test
    public void setCount() {

        int count = 2;
        examGroup.setCount(count);
        assertEquals(count, examGroup.getCount());
    }

    @Test
    public void getYear() {

        int year = 2005;
        examGroup.setYear(year);
        assertEquals(year, examGroup.getYear());
    }

    @Test
    public void setYear() {


        int year = 2005;
        examGroup.setYear(year);
        assertEquals(year, examGroup.getYear());
    }

    @Test
    public void getId() {

        int id = 92;
        examGroup.setId(id);
        assertEquals(id, examGroup.getId());
    }

    @Test
    public void setId() {


        int id = 92;
        examGroup.setId(id);
        assertEquals(id, examGroup.getId());
    }

    @Test
    public void getDescription() {

        String description = "Geografia";
        examGroup.setDescription(description);
        assertEquals(description, examGroup.getDescription());
    }

    @Test
    public void setDescription() {


        String description = "Geografia";
        examGroup.setDescription(description);
        assertEquals(description, examGroup.getDescription());
    }
}
