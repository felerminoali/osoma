package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class DashBoardController {


    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    private ModelAndView model;
    private List<Exam> exams = new ArrayList<Exam>();
    private Exam exam;
    private List<User> users = new ArrayList<>();

    @RequestMapping(value = "/exams-admin", method = RequestMethod.GET)
    public ModelAndView adminDashBoard(@RequestParam("pg") Optional<Integer> pg, @RequestParam("remove") Optional<Integer> examId
    ) {

        model = new ModelAndView("exams-admin");
        exams = crudService.getAll(Exam.class);

        // Aqui eh onde sao eliminados os exames
        if (!this.isNull(examId)) {
            exam = crudService.get(Exam.class, examId.hashCode());
            try {
                crudService.delete(exam);
                model.addObject("removed", true);
            } catch (Exception e) {
                System.out.println("Nao Conseguiu Deletar o exame");
            }
        }

        // edicao de exames

 /*       if(!this.isNull(examId)){
            exam = crudService.get(Exam.class, examId.hashCode());

            try {
                model.addObject(attribute:)

            }catch (Exception exception){

                System.out.println("falha ao editar este exame ");

            }

        }*/


        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        //homeController.setUsers(users);
        homeController.pagination(pg);


        // homeController.getModel().addObject("users", homeController.getUsers());
        homeController.getModel().addObject("exams", homeController.getExams());
        // model.addObject("exams",exams);
        return homeController.getModel();


    }

    @RequestMapping(value = "/exams-admin/editExam")
    public ModelAndView editExam(@RequestParam("examId") Integer examId) {
        model = new ModelAndView("exam-edit");

        exam = crudService.get(Exam.class, examId);

        List<University> universities = crudService.getAll(University.class);
        List<Category> categories = crudService.getAll(Category.class);
        model.addObject("categories", categories);
        model.addObject("universities", universities);
        model.addObject("exam", exam);
        return model;
    }

    @RequestMapping(value = "exams-admin/exam-details-admin/question-add/")
    public ModelAndView examDetailsAdminQuestion(@RequestParam("examId") Integer examId) {
        model = new ModelAndView("question-form");

        exam = crudService.get(Exam.class, examId);
        //List<Question> questions=crudService.getAll(Question.class);


        //model.addObject("questions",questions);
        model.addObject("exam", exam);
        return model;
    }

    @RequestMapping(value = "/exams-admin/exam-details-admin")
    public ModelAndView examDetailsAdmin(@RequestParam("examId") Optional<Integer> examId,
                                         @RequestParam("remove") Optional<Integer> questionId) {
        model = new ModelAndView("exam-details-admin");


        exam = crudService.get(Exam.class, examId.hashCode());
        List<Question> questions = crudService.findByJPQuery("SELECT q FROM Question q where q.examId.examId=" + exam.getExamId(), null);//getAll(Question.class);

        if (!isNull(questionId)) {
            Question question = crudService.get(Question.class, questionId.hashCode());

            try {
                crudService.delete(question);
            } catch (Exception e) {
                System.out.println("Error, nao foi possivel apagar a aquestao");
            }
        }


        model.addObject("questions", questions);
        model.addObject("exam", exam);
        return model;
    }

    @RequestMapping(value = "/users-admin", method = RequestMethod.GET)
    public ModelAndView usersAdmin(
    ) {

        model = new ModelAndView("users-admin");
        users = crudService.getAll(User.class);
      /*  exams = crudService.getAll(Exam.class);


        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        homeController.setUsers(users);
        homeController.pagination(pg);

        homeController.paginationUsers(t2pg);

        homeController.getModel().addObject("users", homeController.getUsers());
        homeController.getModel().addObject("exams", homeController.getExams());
        */
        model.addObject("users", users);
        return model;
    }

    @RequestMapping(value = "/dash", method = RequestMethod.GET)
    public ModelAndView dashboardHome(
    ) {

        model = new ModelAndView("dashboard-home");
        users = crudService.getAll(User.class);

        return model;
    }

    @RequestMapping(value = "/exams-admin/exam-add/exam-save", method = RequestMethod.POST)
    public String saveExam(@RequestParam("examId") Optional<Integer> examId,
                           @RequestParam("examYear") Integer examYear,
                           @RequestParam("description") String description,
                           @RequestParam("duration") Integer duration,
                           @RequestParam("noquestion") Integer noquestion,
                           @RequestParam("pdfresource") String pdfresource,
                           @RequestParam("category") Integer categoryId,
                           @RequestParam("university") Integer universityId
    ) {

        Category category = crudService.get(Category.class, categoryId);
        University university = crudService.get(University.class, universityId);
        Exam exam;

        if (examId==null) {
            exam = crudService.get(Exam.class, examId.hashCode());
            System.out.println("======entra=====");
        }else {
            exam=new Exam();
        }


        exam.setCategory(category);
        exam.setUniversity(university);
        exam.setExamYear(examYear);
        exam.setDescription(description);
        exam.setDuration(duration);
        exam.setNoquestion(noquestion);
        exam.setPdfresource(pdfresource);

        if (examId==null) {

            try {
                crudService.Save(exam);
                System.out.println("Save Sucessfull");
                return "success";
            } catch (Exception e) {

                System.out.println("exam not saved");
                return "error";
            }
        } else {
            try {
                crudService.update(exam);
                return "success";
            } catch (Exception e) {
                System.out.println("error, update unsucessfull");
                return "error";
            }
        }
        //return "";
    }

    @RequestMapping(value = "exams-admin/exam-details-admin/question-add/question-save", method = RequestMethod.POST)
    public String saveQuestion(@RequestParam("examId") Integer examId,
                               @RequestParam("id") Optional<Integer> questionId,
                               @RequestParam("name") String name,
                               @RequestParam("questiontextformat") String questiontextformat,
                               @RequestParam("image") String image,
                               @RequestParam("feedback") String feedback,
                               @RequestParam("qtype") Integer qtype,
                               @RequestParam("a") String answerA,
                               @RequestParam("b") String answerB,
                               @RequestParam("c") String answerC,
                               @RequestParam("d") String answerD,
                               @RequestParam("e") String answerE,
                               @RequestParam("correctAnswer") Character correctAnswer,
                               @RequestParam("answerFeedback") String answerFeedback) {

        exam = crudService.get(Exam.class, examId);
        Qtype questionType = crudService.get(Qtype.class, qtype);

        Question question;
        QuestionAnswers questionAnswers1 = new QuestionAnswers();
        QuestionAnswers questionAnswers2 = new QuestionAnswers();
        QuestionAnswers questionAnswers3 = new QuestionAnswers();
        QuestionAnswers questionAnswers4 = new QuestionAnswers();
        QuestionAnswers questionAnswers5 = new QuestionAnswers();

        //if (!isNull(questionId)) {
        //   question = crudService.get(Question.class, questionId.hashCode());
        //} else {
        question = new Question();
        //}


        question.setExamId(exam);
        question.setName(name);
        question.setQuestiontextformat(questiontextformat);
        question.setImage(image);
        question.setFeedback(feedback);
        question.setQtype(questionType);

        questionAnswers1.setAnswer(answerA);
        questionAnswers2.setAnswer(answerB);
        questionAnswers3.setAnswer(answerC);
        questionAnswers4.setAnswer(answerD);
        questionAnswers5.setAnswer(answerE);

        questionAnswers1.setFeedback("");
        questionAnswers2.setFeedback("");
        questionAnswers3.setFeedback("");
        questionAnswers4.setFeedback("");
        questionAnswers5.setFeedback("");

        questionAnswers1.setCharId("a");
        questionAnswers2.setCharId("b");
        questionAnswers3.setCharId("c");
        questionAnswers4.setCharId("d");
        questionAnswers5.setCharId("e");


        if (isNull(questionId)) {
            try {
                crudService.Save(question);

                List<Question> questions = crudService.getAll(Question.class);
                Question question1 = questions.get(questions.size() - 1);

                questionAnswers1.setQuestion(question1);
                questionAnswers2.setQuestion(question1);
                questionAnswers3.setQuestion(question1);
                questionAnswers4.setQuestion(question1);
                questionAnswers5.setQuestion(question1);

                try {
                    crudService.Save(questionAnswers1);
                    crudService.Save(questionAnswers2);
                    crudService.Save(questionAnswers3);
                    crudService.Save(questionAnswers4);
                    crudService.Save(questionAnswers5);

                } catch (Exception e) {
                    System.out.println("error, nao foi possivel salvar uma questao");
                }

                return "success";
            } catch (Exception e) {
                System.out.println("Error, nao foi possivel adicionar a questao");
            }
        } else {
            try {
                crudService.update(question);
            } catch (Exception e) {
                System.out.println("error, nao foi possivel actualizar a questao");
                return "error";
            }
        }

        return "success";
    }


    @RequestMapping(value = "exams-admin/exam-add", method = RequestMethod.GET)
    public ModelAndView examAdd() {

        model = new ModelAndView("exam-form");
        List<Category> categories = crudService.getAll(Category.class);
        List<University> universities = crudService.getAll(University.class);
        model.addObject("categories", categories);
        model.addObject("universities", universities);
        model.addObject("exam", null);
        //  users = crudService.getAll(User.class);

        return model;
    }

    @RequestMapping(value = "/explainers-admin", method = RequestMethod.GET)
    public ModelAndView explainersAdmin(
    ) {

        model = new ModelAndView("explainers-admin");

      /*  exams = crudService.getAll(Exam.class);
        users = crudService.getAll(User.class);

        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        homeController.setUsers(users);
        homeController.pagination(pg);

        homeController.paginationUsers(t2pg);

        homeController.getModel().addObject("users", homeController.getUsers());
        homeController.getModel().addObject("exams", homeController.getExams());
        */
        return model;


    }


    private boolean isNull(Object object) {
        return object == null;
    }
}
