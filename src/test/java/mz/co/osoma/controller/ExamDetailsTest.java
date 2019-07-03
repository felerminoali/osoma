package mz.co.osoma.controller;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.model.Question;
import mz.co.osoma.service.CRUDService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)
public class ExamDetailsTest {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    public ExamDetails examDetails;

    @Before
    public void setUp() throws Exception {
        examDetails = new ExamDetails();
        examDetails.crudService = crudService;
    }

    @Test
    public void testExamDetailsShowNull() {

        /*
        * Testa a busca de detalhes de exames que nao existem na base dados
        *
        * */

        ModelAndView modelAndView = examDetails.examDetailsShow(555);

        assertNull(modelAndView.getModel().get("exame"));

    }
    @Test
    public void testExamDetailsShowNotNull() {

        /*
        * Verfica se o resultado da busca por exames existentes!
        *
        * */
        ModelAndView modelAndView = examDetails.examDetailsShow(2);

        assertNotNull(modelAndView.getModel().get("exame"));
    }

    @Test
    public void testExamDiagnosis() {
        int id = 2;
        Optional<Integer> numberQuesiton = Optional.of(2);

        ModelAndView modelAndView = examDetails.examDiagnosis(id, numberQuesiton);
    }

    @Test
    public void testExamNotHasQuestions() {
        int id = 5000;
        List<Question> questionList = examDetails.questionsOfExam(id);

        assertEquals(0, questionList.size());
    }

    @Test
    public void testExamHasQuestions() {
        int id = 2;
        List<Question> questionList = examDetails.questionsOfExam(id);
        assertNotNull(questionList);
    }
    @Test
    public void results() {
    }
}