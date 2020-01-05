package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class DashBoardController {


    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    private ModelAndView model;
    private List<Question> questions = new ArrayList<>();
    private List<Exam> exams = new ArrayList<>();
    private Exam exam;
    private List<User> users = new ArrayList<>();


    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView dashboard(){
        ModelAndView model = new ModelAndView("dashboard");
        return model;
    }


    @RequestMapping(value = "/exams-admin", method = RequestMethod.GET)
    public ModelAndView adminDashBoard(@RequestParam("pg") Optional<Integer> pg,
                                       @RequestParam("remove") Optional<Integer> examId,
                                       @RequestParam("statusAdd") Optional<Boolean> statusAdd
    ) {

        model = new ModelAndView("exams-admin");
        exams = crudService.getAll(Exam.class);

        List<University> universities = crudService.getAll(University.class);
        List<Category> categories = crudService.getAll(Category.class);

        // Aqui eh onde sao eliminados os exames
        if (examId.hashCode() > 0) {
            exam = crudService.get(Exam.class, examId.hashCode());
            List<Question> questions = crudService.findByJPQuery("SELECT q FROM Question q where q.exam.id=" + exam.getId(), null);

            for (Question question : questions) {
                List<Choice> choices = crudService.findByJPQuery("SELECT q FROM Choice q where q.question.id=" + question.getId(), null);

                for (Choice questionAnswer : choices) {
                    try {
                        crudService.delete(questionAnswer);
                    } catch (Exception e) {
                        System.out.println("Nao Foi Possivel Apagar uma das Alternativas, ao apagar o exame");
                    }
                }
                try {
                    crudService.delete(question);
                } catch (Exception e) {
                    System.out.println("Nao foi possivel apagar uma das perguntas do exame");
                }
            }
            try {
                crudService.delete(exam);
                model.addObject("removed", true);
            } catch (Exception e) {
                System.out.println("Nao Conseguiu Deletar o exame");
            }
        }

        HomeController homeController = new HomeController();

        homeController.setModel(model);
        homeController.setExams(exams);
        homeController.pagination(pg);

        // homeController.getModel().addObject("users", homeController.getUsers());
        model.addObject("categories", categories);
        model.addObject("universities", universities);
        model.addObject("status", statusAdd.isPresent());
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
        model.addObject("exam", exam);
        return model;
    }

    @RequestMapping(value = "/exams-admin/exam-details-admin", method = RequestMethod.GET)
    public ModelAndView examDetailsAdmin(@RequestParam("examId") Integer examId,
                                         @RequestParam("remove") Optional<Integer> questionId,
                                         @RequestParam("status") Optional<Boolean> status) {
        model = new ModelAndView("exam-details-admin");

        exam = crudService.get(Exam.class, examId.hashCode());
        // questions = crudService.findByJPQuery("SELECT q FROM Question q where q.exam.examId=" + examId.hashCode(), null);//getAll(Question.class);

        if (questionId.hashCode() > 0) {
            Question question = crudService.get(Question.class, questionId.hashCode());

            List<Choice> choices = crudService.findByJPQuery("SELECT q FROM Choice q where q.question.id=" + question.getId(), null);

            for (Choice choice : choices) {
                try {
                    crudService.delete(choice);
                } catch (Exception e) {
                    System.out.println("Nao foi possivel apagar uma das opcoes da questao ");
                }
            }

            try {
                crudService.delete(question);
            } catch (Exception e) {
                System.out.println("Error, nao foi possivel apagar a aquestao");
            }
        }
        model.addObject("status", status.isPresent());
        //model.addObject("questions", questions);
        model.addObject("exam", exam);
        return model;
    }

    @RequestMapping(value = "/exams-admin/exam-details-admin/question-details")
    public ModelAndView questionDetails(@RequestParam("questionId") Integer questionId,
                                        @RequestParam("examId") Integer examId) {

        model = new ModelAndView("question-details");
        Question question = crudService.get(Question.class, questionId);
        Exam exam = crudService.get(Exam.class, examId);
        List<Choice> choices = crudService.findByJPQuery("SELECT e FROM Choice e where e.question.id = " + question.getId(), null);
        model.addObject("question", question);
        model.addObject("exam", exam);
        return model;
    }

    @RequestMapping(value = "/exams-admin/exam-details-admin/question-edit")
    public ModelAndView questionEdit(@RequestParam("questionId") Integer questionId
    ) {

        model = new ModelAndView("question-edit");
        Question question = crudService.get(Question.class, questionId);
        model.addObject("question", question);
        return model;
    }

    @RequestMapping(value = "/users-admin", method = RequestMethod.GET)
    public ModelAndView usersAdmin(
    ) {

        model = new ModelAndView("users-admin");
        users = crudService.getAll(User.class);
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
    public ModelAndView saveExam(@RequestParam("examId") Optional<Integer> examId,
                                 @RequestParam("examYear") Integer examYear, @RequestParam("description") String description, @RequestParam("duration") Integer duration,
                                 @RequestParam("noquestion") Integer noquestion,
                                 @RequestParam("pdfresource") String pdfresource,
                                 @RequestParam("category") Integer categoryId,
                                 @RequestParam("university") Integer universityId
    ) {


        Category category = crudService.get(Category.class, categoryId);
        University university = crudService.get(University.class, universityId);
        Optional<Boolean> status = Optional.of(false);
        Optional<Integer> idExam = Optional.empty();
        Optional<Integer> pg = Optional.empty();


        Exam exam;
        if (examId.hashCode() > 0) {
            exam = crudService.get(Exam.class, examId.hashCode());
            System.out.println("======entra=====");
        } else {
            exam = new Exam();
            System.out.println("======ererrerererrre=====");
        }


        exam.setCategory(category);
        exam.setUniversity(university);
        exam.setExamYear(examYear);
        exam.setDescription(description);
        exam.setDuration(duration);
        exam.setNoquestion(noquestion);
        exam.setPdfresource(pdfresource);
        if (!(examId.hashCode() > 0)) {
            try {
                crudService.Save(exam);
                System.out.println("Save Sucessfull");
                status = Optional.of(true);
                return this.adminDashBoard(idExam, pg, status);
            } catch (Exception e) {

                System.out.println("exam not saved");

            }
        } else {
            try {
                crudService.update(exam);
                status = Optional.of(true);
                return this.adminDashBoard(idExam, pg, status);
            } catch (Exception e) {
                System.out.println("error, update unsucessfull");

            }
        }
        return this.adminDashBoard(idExam, pg, status);
    }

    @RequestMapping(value = "/exams-admin/exam-details-admin/question-add/question-save", method = RequestMethod.POST)
    public ModelAndView saveQuestion(HttpServletRequest request) {

        Integer examId = Integer.parseInt(request.getParameter("examId"));
        String correctAnswer = request.getParameter("correctAnswer");
        String questiontextformat = request.getParameter("questiontextformat");
        String answerFeedback = request.getParameter("answerFeedback");
        String video = request.getParameter("video");
        String text = request.getParameter("text");
        Integer qtdQuestion=Integer.parseInt(request.getParameter("qtdQuestion"));


        System.out.println("============= Quantidade de questoes "+qtdQuestion+"=======================");

        exam = crudService.get(Exam.class, examId);

        Qtype questionType = crudService.get(Qtype.class, 2);
        Optional<Integer> quest = Optional.empty();
        Optional<Boolean> status = Optional.of(false);



        Question question;

        question = new Question();
        question.setExam(exam);

        System.out.println("============"+exam.getId()+"=================");

        question.setQuestion(questiontextformat);
        question.setYoutubeurl(video);
        question.setCaseofstudy(text);
        question.setQtype(questionType);
        question.setFeedback(answerFeedback.toString());


        try {
            crudService.Save(question);
            List<Question> questions = crudService.getAll(Question.class);
            Question question1 = questions.get(questions.size() - 1);
            Choice correct = new Choice();
            correct.setFraction((long) 1);
            correct.setRightchoice((short)1);
            // char character=charId.charAt(0);
            //correct.setCharId(charId);

            correct.setQuestion(question1);
            correct.setAnswer(correctAnswer);

            try {
                crudService.Save(correct);
            } catch (Exception e) {
                System.out.println("Nao foi possivel adicionar a opcao correcta");
                return this.examDetailsAdmin(examId, quest, status);
            }
            for (int i = 1; i <= qtdQuestion; i++) {

                String questionOption;


                    questionOption=request.getParameter("question"+i);


                System.out.println(questionOption);
                if (!questionOption.equals(null)) {
                    Choice choice = new Choice();
                    choice.setFraction((long) 0);
                    choice.setRightchoice((short)0);

                    choice.setQuestion(question1);
                    choice.setAnswer(questionOption);

                    try {
                        crudService.Save(choice);
                        System.out.println("===========" + i + "============");
                    } catch (Exception e) {
                        System.out.println("Error, nao conseguiu inserir uma das questoes");
                        return this.examDetailsAdmin(examId, quest, status);
                    }
                }
            }
            status = Optional.of(true);
            return examDetailsAdmin(examId, quest, status);

        } catch (Exception e) {
            System.out.println("Error, nao foi possivel adicionar a questao");
            return this.examDetailsAdmin(examId, quest, status);
        }
    }

    public String[] splitAnswers(String answers) {
        String[] result = answers.split(",");
        return result;
    }

    @RequestMapping(value = "/explainers-admin", method = RequestMethod.GET)
    public ModelAndView explainersAdmin(
    ) {
        model = new ModelAndView("explainers-admin");
        return model;
    }
}
