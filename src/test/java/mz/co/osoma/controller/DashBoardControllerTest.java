package mz.co.osoma.controller;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.model.Exam;
import mz.co.osoma.service.CRUDService;
import org.junit.Assert;
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

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)
public class DashBoardControllerTest {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Test
    public void adminDashBoardWithExamIdNull() {

        Optional<Integer> pg = Optional.of(2);
        Optional<Integer> examId = Optional.empty();
        Optional<Boolean> status = Optional.of(true);

        ModelAndView model = new ModelAndView("exams-admin");

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model1 = dashBoardController.adminDashBoard(pg, examId, status);
        Assert.assertNotEquals(model, model1);

    }

    @Test
    public void questionDetails() {
        Integer examId = 12;
        Integer questionId = 42;
        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView modelAndView = dashBoardController.questionDetails(questionId, examId);
        Assert.assertNotNull(modelAndView);

    }


    @Test
    public void adminDashBoardWithPgNull() {

        Optional<Integer> pg = Optional.empty();
        Optional<Boolean> status = Optional.of(true);

        this.saveExamWithExamIdNull();

        List<Exam> exams = crudService.getAll(Exam.class);
        Exam exam = exams.get(exams.size() - 1);
        Optional<Integer> examId = Optional.of(exam.getId());


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.adminDashBoard(pg, examId, status);
        Assert.assertNotNull(model);

    }

    @Test
    public void editExam() {
        Integer examId = 12;


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.editExam(examId);
        Assert.assertNotNull(model);
    }

    @Test
    public void examDetailsAdminQuestion() {
        Integer examId = 12;


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.examDetailsAdminQuestion(examId);
        Assert.assertNotNull(model);
    }

    @Test
    public void examDetailsAdminWithQuestionIdNull() {
        Integer examId = 12;
        Optional<Integer> questionId = Optional.empty();
        Optional<Boolean> status = Optional.of(true);


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.examDetailsAdmin(examId, questionId, status);
        Assert.assertNotNull(model);


    }

   /* @Test
    public void examDetailsAdminWithQuestionIdNotNull() {
        Integer examId = 12;
        Optional<Boolean> status = Optional.of(false);
        this.saveQuestion();
        List<Question> questions = crudService.getAll(Question.class);
        Question question = questions.get(questions.size() - 1);
        Optional<Integer> questionId = Optional.of(question.getId());

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.examDetailsAdmin(examId, questionId, status);
        Assert.assertNotNull(model);


    }
*/
    @Test
    public void usersAdmin() {

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.usersAdmin();
        Assert.assertNotNull(model);
    }

    @Test
    public void dashboardHome() {
        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.dashboardHome();
        Assert.assertNotNull(model);
    }

    @Test
    public void saveExamWithExamIdNull() {
        Optional<Integer> examId = Optional.empty();
        Integer examYear = 2016;
        String description = "Exame de Matematica";
        Integer duration = 120;
        Integer noquestion = 10;
        String pdfresource = "www.google.com";
        Integer categoryId = 2;
        Integer universityId = 2;

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertNotNull(model);

    }

    @Test
    public void saveExamWithExamIdNullUniversityNotExist() {
        Optional<Integer> examId = Optional.empty();
        Integer examYear = 2016;
        String description = "Exame de Matematica";
        Integer duration = 120;
        Integer noquestion = 10;
        String pdfresource = "www.google.com";
        Integer categoryId = 2;
        Integer universityId = 56;

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertNotNull(model);

    }

    @Test
    public void saveExamWithExamIdNotNull() {
        Optional<Integer> examId = Optional.of(12);
        Integer examYear = 2016;
        String description = "Exame de Matematica";
        Integer duration = 120;
        Integer noquestion = 10;
        String pdfresource = "www.google.com";
        Integer categoryId = 2;
        Integer universityId = 2;

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView modelAndView = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertNotNull(modelAndView);

    }

    @Test
    public void saveExamWithExamIdNotNullUniversityNotExist() {
        Optional<Integer> examId = Optional.of(12);
        Integer examYear = 2016;
        String description = "Exame de Matematica";
        Integer duration = 120;
        Integer noquestion = 10;
        String pdfresource = "www.google.com";
        Integer categoryId = 2;
        Integer universityId = 56;

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertNotNull(model);

    }
/*
    @Test
    public void saveQuestion() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.empty();
        String questiontextformat = "A questao adicionada pelo teste";
        String correctAnswer = "opcione correcta";
        String feedback = "salama";
        String answers = "Teste,Teste";
        Optional<String> answerFeedback = Optional.of("boa resposta");


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.saveQuestion(examId, correctAnswer, answers, questiontextformat, answerFeedback);
        Assert.assertNotNull(model);


    }
*/

    @Test
    public void splitAnswers() {
        String argument = "rofino,chunga";

        DashBoardController dashBoardController = new DashBoardController();

        String[] result = dashBoardController.splitAnswers(argument);

        Assert.assertEquals("chunga", result[1]);
    }

    @Test
    public void explainersAdmin() {
        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.explainersAdmin();
        Assert.assertNotNull(model);

    }
}