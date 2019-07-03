package mz.co.osoma.controller;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.controller.DashBoardController;
import mz.co.osoma.model.Exam;
import mz.co.osoma.model.Question;
import mz.co.osoma.model.QuestionAnswers;
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
public class DashBoardControllerTest {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Test
    public void adminDashBoardWithExamIdNull() {

        Optional<Integer> pg = Optional.of(2);
        Optional<Integer> examId = Optional.empty();

        ModelAndView model = new ModelAndView("exams-admin");

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model1 = dashBoardController.adminDashBoard(pg, examId);
        Assert.assertNotEquals(model, model1);

    }
/*
    @Test
    public void adminDashBoardWithPgNull() {

        Optional<Integer> pg = Optional.empty();
        Optional<Integer> examId = Optional.of(13);



        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.adminDashBoard(pg, examId);
        Assert.assertNotNull(model);

    }
*/
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
        Optional<Integer> examId = Optional.of(12);
        Optional<Integer> questionId = Optional.empty();



        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.examDetailsAdmin(examId, questionId);
        Assert.assertNotNull(model);


    }

    /*@Test
    public void examDetailsAdminWithQuestionIdNotNull() {
        Optional<Integer> examId = Optional.of(12);
        Optional<Integer> questionId = Optional.of(52);

        List<Question> questions = crudService.findByJPQuery("SELECT q FROM Question q where q.examId.examId=" + examId.hashCode(), null);
        List<List<QuestionAnswers>> answer = null;
        for (Question question : questions) {
            answer.add(crudService.findByJPQuery("SELECT q FROM QuestionAnswers q where q.question.id=" + question.getId(), null));
        }

        //List<Question> questions = crudService.findByJPQuery("SELECT q FROM Question q where q.examId.examId=" + examId.hashCode(), null);

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.examDetailsAdmin(examId, questionId);
        Assert.assertNotNull(model);


        for (Question question :
                questions) {
            try {
                crudService.Save(question);
            } catch (Exception e) {

            }
        }

        for (int i = 0; i < answer.size(); i++) {
            List<QuestionAnswers> questionAnswersList = answer.get(i);

            for (QuestionAnswers questionAnswers : questionAnswersList) {
                try {
                    crudService.Save(questionAnswers);
                } catch (Exception e) {

                }
            }
        }
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

        String result = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertEquals("success", result);

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

        String result = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertEquals("error", result);

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

        String result = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertEquals("success", result);

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

        String result = dashBoardController.saveExam(examId, examYear, description, duration, noquestion, pdfresource,
                categoryId, universityId);
        Assert.assertEquals("error", result);

    }

    @Test
    public void saveQuestionWithQuestionIdNull() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.empty();
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        Optional<String> answerE = Optional.of("Vos Parles");
        Character correctAnswer = 'a';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("success", result);


    }

   /* @Test
    public void saveQuestionWithQuestionIdNullExamIdNotExist() {

        Integer examId =12;
        Optional<Integer> questionId = Optional.of(1000);
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        String answerE = "Vos Parles";
        Character correctAnswer = 'a';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("error", result);


    }*/


    @Test
    public void saveQuestionWithQuestionIdNotNull() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.of(52);
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        Optional<String> answerE = Optional.of("Vos Parles");
        Character correctAnswer = 'a';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("success", result);


    }
    @Test
    public void saveQuestionWithQuestionIdNotNullB() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.of(52);
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        Optional<String> answerE = Optional.of("Vos Parles");
        Character correctAnswer = 'b';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("success", result);


    }
    @Test
    public void saveQuestionWithQuestionIdNotNullC() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.of(52);
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        Optional<String> answerE = Optional.of("Vos Parles");
        Character correctAnswer = 'c';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("success", result);


    }
    @Test
    public void saveQuestionWithQuestionIdNotNullD() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.of(52);
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        Optional<String> answerE = Optional.of("Vos Parles");
        Character correctAnswer = 'd';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("success", result);


    }
    @Test
    public void saveQuestionWithQuestionIdNotNullE() {

        Integer examId = 12;
        Optional<Integer> questionId = Optional.of(52);
        String name = "question 0";
        String questiontextformat = "Je parle portuguee";
        String feedback = "salama";
        Integer qtype = 2;
        String answerA = "je parle";
        String answerB = "ele parle";
        String answerC = "Nos Parlamos";
        String answerD = "Eles parlam";
        Optional<String> answerE = Optional.of("Vos Parles");
        Character correctAnswer = 'e';
        String answerFeedback = "boa resposta";


        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        String result = dashBoardController.saveQuestion(examId, questionId, name,
                questiontextformat, feedback, qtype, answerA, answerB, answerC, answerD, answerE, correctAnswer, answerFeedback);

        Assert.assertEquals("success", result);


    }






    @Test
    public void examAdd() {

        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.examAdd();
        Assert.assertNotNull(model);
    }

    @Test
    public void explainersAdmin() {
        DashBoardController dashBoardController = new DashBoardController();
        dashBoardController.crudService = crudService;

        ModelAndView model = dashBoardController.explainersAdmin();
        Assert.assertNotNull(model);

    }
}