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

public class ExamTest {

    @Test
    public void getExamId() {
        Exam exam = new Exam();
        exam.setId(1);
        Integer id = 1;
        Integer idd = exam.getId();
        assertEquals(id, idd);
    }


    @Test
    public void getExamYear() {
        Exam exam = new Exam();
        Integer year1 = 2015;
        exam.setExamYear(year1);
        assertEquals((long) year1, exam.getExamYear());
    }


    @Test
    public void getDescription() {
        Exam exam = new Exam();
        String description = "Exame de Matematica";
        exam.setDescription(description);
        assertEquals(description, exam.getDescription());
    }


    @Test
    public void getDuration() {
        Exam exam = new Exam();
        Integer duration = 20;
        exam.setDuration(duration);
        assertEquals(duration, exam.getDuration());
    }


    @Test
    public void getNoquestion() {
        Exam exam = new Exam();
        Integer noquestions = 20;
        exam.setNoquestion(noquestions);
        assertEquals(noquestions, exam.getNoquestion());
    }

//    @Test
//    public void getAssessment() {
//        Exam exam = new Exam();
//        short assesment = 20;
//        exam.set(assesment);
//        assertEquals((long) assesment, (long) exam.getAssessment());
//    }

    @Test
    public void getPdfresource() {
        Exam exam = new Exam();
        String pdfSource = "www.gool.bit.ty";
        exam.setPdfresource(pdfSource);
        assertEquals(pdfSource, exam.getPdfresource());
    }


    @Test
    public void getElearning() {
        Exam exam = new Exam();
        String elearning = "www.gool.bit.ty";
        exam.setElearning(elearning);
        assertEquals(elearning, exam.getElearning());
    }


    @Test
    public void getCategory() {
        Exam exam = new Exam();
        Integer id = 12;
        Category category = new Category(id);
        exam.setCategory(category);
        assertEquals(category, exam.getCategory());
    }


    @Test
    public void getUniversity() {
        Exam exam = new Exam();
        Integer id = 12;
        University university = new University(id);
        exam.setUniversity(university);
        assertEquals(university, exam.getUniversity());
    }

//    @Test
//    public void getExamAttemptsList() {
//        Exam exam = new Exam();
//        exam.setExamAttemptsList(null);
//        assertEquals(null, exam.getExamAttemptsList());
//    }


    @Test
    public void hashCode1() {
        Exam exam = new Exam();
        assertEquals(exam.hashCode(), 0);
    }

    @Test
    public void equals() {
        Integer examId = 12;
        Exam exam = new Exam(examId);

        assertFalse(exam.equals(new Exam()));
        assertTrue(exam.equals(new Exam(examId)));
        assertFalse(exam.equals(new Countries()));
        exam.setId(null);
        assertFalse(exam.equals(new Exam(examId)));
    }

    @Test
    public void toString1() {
        Integer examId = 20;
        Integer examYear = 2015;
        Exam e = new Exam(examId, examYear);
        assertNotNull(e.toString());
    }
}
