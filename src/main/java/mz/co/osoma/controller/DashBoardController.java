package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
    public ModelAndView adminDashBoard(@RequestParam("pg") Optional<Integer> pg,
                                       @RequestParam("remove") Optional<Integer> examId,
                                       @RequestParam("statusAdd") Optional<Boolean> statusAdd
    ) {

        model = new ModelAndView("exams-admin");
        exams = crudService.getAll(Exam.class);

        List<University> universities=crudService.getAll(University.class);
        List <Category> categories=crudService.getAll(Category.class);

        // Aqui eh onde sao eliminados os exames
        if (examId.hashCode()>0) {
            exam = crudService.get(Exam.class, examId.hashCode());
            List<Question> questions = crudService.findByJPQuery("SELECT q FROM Question q where q.examId.examId=" + exam.getExamId(), null);

            for(Question question: questions){
                List<QuestionAnswers> questionAnswers = crudService.findByJPQuery("SELECT q FROM QuestionAnswers q where q.question.id=" + question.getId(), null);

                for(QuestionAnswers questionAnswer: questionAnswers){
                    try {
                        crudService.delete(questionAnswer);
                    }catch (Exception e){
                        System.out.println("Nao Foi Possivel Apagar uma das Alternativas, ao apagar o exame");
                    }
                }

                try {
                    crudService.delete(question);
                }catch (Exception e){
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
        model.addObject("status",statusAdd.isPresent());
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

    @RequestMapping(value = "/exams-admin/exam-details-admin")
    public ModelAndView examDetailsAdmin(@RequestParam("examId") Optional<Integer> examId,
                                         @RequestParam("remove") Optional<Integer> questionId) {
        model = new ModelAndView("exam-details-admin");


        exam = crudService.get(Exam.class, examId.hashCode());
        List<Question> questions = crudService.findByJPQuery("SELECT q FROM Question q where q.examId.examId=" + exam.getExamId(), null);//getAll(Question.class);

        if (questionId.hashCode()>0) {
            Question question = crudService.get(Question.class, questionId.hashCode());

            List<QuestionAnswers> questionAnswers = crudService.findByJPQuery("SELECT q FROM QuestionAnswers q where q.question.id=" + question.getId(), null);

            for (QuestionAnswers questionAnswer: questionAnswers) {
                try{
                    crudService.delete(questionAnswer);
                }catch (Exception e){
                    System.out.println("Nao foi possivel apagar uma das opcoes da questao ");
                }
            }

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
        Optional<Boolean> status=Optional.of(false);
        Optional <Integer> idExam=Optional.empty();
        Optional <Integer> pg=Optional.empty();



        Exam exam;
        if (examId.hashCode()>0) {
            exam = crudService.get(Exam.class, examId.hashCode());
            System.out.println("======entra=====");
        }else {
            exam=new Exam();
            System.out.println("======ererrerererrre=====");
        }


        exam.setCategory(category);
        exam.setUniversity(university);
        exam.setExamYear(examYear);
        exam.setDescription(description);
        exam.setDuration(duration);
        exam.setNoquestion(noquestion);
        exam.setPdfresource(pdfresource);
        if (!(examId.hashCode()>0)) {
            try {
                crudService.Save(exam);
                System.out.println("Save Sucessfull");
                status=Optional.of(true);
                return this.adminDashBoard(idExam,pg,status);
            } catch (Exception e) {

                System.out.println("exam not saved");

            }
        } else {
            try {
                crudService.update(exam);
                status=Optional.of(true);
                return this.adminDashBoard(idExam,pg,status);
            } catch (Exception e) {
                System.out.println("error, update unsucessfull");

            }
        }
        return this.adminDashBoard(idExam,pg,status);
    }
    @RequestMapping(value = "exams-admin/exam-details-admin/question-add/question-save", method = RequestMethod.POST)
    public ModelAndView saveQuestion(@RequestParam("examId") Integer examId,
                               @RequestParam("id") Optional<Integer> questionId,
                               @RequestParam("name") String name,
                               @RequestParam("questiontextformat") String questiontextformat,
                               @RequestParam("feedback") String feedback,
                               @RequestParam("qtype") Integer qtype,
                               @RequestParam("a") String answerA,
                               @RequestParam("b") String answerB,
                               @RequestParam("c") String answerC,
                               @RequestParam("d") String answerD,
                               @RequestParam("e") Optional <String> answerE,
                               @RequestParam("correctAnswer") Character correctAnswer,
                               @RequestParam("answerFeedback") String answerFeedback) {

        exam = crudService.get(Exam.class, examId);
        Qtype questionType = crudService.get(Qtype.class, qtype);
        Optional <Integer> idExam=Optional.of(examId);
        Optional <Integer> quest=Optional.empty();

//        String target="exams-admin/exam-details-admin/?examId="+examId.hashCode();
        Question question;
        QuestionAnswers questionAnswers1 = new QuestionAnswers();
        QuestionAnswers questionAnswers2 = new QuestionAnswers();
        QuestionAnswers questionAnswers3 = new QuestionAnswers();
        QuestionAnswers questionAnswers4 = new QuestionAnswers();
        QuestionAnswers questionAnswers5 = new QuestionAnswers();

        if (questionId.hashCode()>0) {
           question = crudService.get(Question.class, questionId.hashCode());
        } else {
        question = new Question();
        }
        question.setExamId(exam);
        question.setName(name);
        question.setQuestiontextformat(questiontextformat);
        question.setFeedback(feedback);
        question.setQtype(questionType);

        questionAnswers1.setAnswer(answerA);
        questionAnswers2.setAnswer(answerB);
        questionAnswers3.setAnswer(answerC);
        questionAnswers4.setAnswer(answerD);
        questionAnswers5.setAnswer(answerE.get());

        switch (correctAnswer){
            case 'a':{
                questionAnswers1.setFraction((long) 1);
                questionAnswers2.setFraction((long) 0);
                questionAnswers3.setFraction((long) 0);
                questionAnswers4.setFraction((long) 0);
                questionAnswers5.setFraction((long) 0);
                questionAnswers1.setFeedback(answerFeedback);
                questionAnswers2.setFeedback("opcao incorrecta");
                questionAnswers3.setFeedback("opcao incorrecta");
                questionAnswers4.setFeedback("opcao incorrecta");
                questionAnswers5.setFeedback("opcao incorrecta");
            }break;
            case 'b':{
                questionAnswers1.setFraction((long) 0);
                questionAnswers2.setFraction((long) 1);
                questionAnswers3.setFraction((long) 0);
                questionAnswers4.setFraction((long) 0);
                questionAnswers5.setFraction((long) 0);
                questionAnswers1.setFeedback("opcao incorrecta");
                questionAnswers2.setFeedback(answerFeedback);
                questionAnswers3.setFeedback("opcao incorrecta");
                questionAnswers4.setFeedback("opcao incorrecta");
                questionAnswers5.setFeedback("opcao incorrecta");
            }break;

            case 'c':{
                questionAnswers1.setFraction((long) 0);
                questionAnswers2.setFraction((long) 0);
                questionAnswers3.setFraction((long) 1);
                questionAnswers4.setFraction((long) 0);
                questionAnswers5.setFraction((long) 0);
                questionAnswers1.setFeedback("opcao incorrecta");
                questionAnswers2.setFeedback("opcao incorrecta");
                questionAnswers3.setFeedback(answerFeedback);
                questionAnswers4.setFeedback("opcao incorrecta");
                questionAnswers5.setFeedback("opcao incorrecta");
            }break;
            case 'd':{
                questionAnswers1.setFraction((long) 0);
                questionAnswers2.setFraction((long) 0);
                questionAnswers3.setFraction((long) 0);
                questionAnswers4.setFraction((long) 1);
                questionAnswers5.setFraction((long) 0);
                questionAnswers1.setFeedback("opcao incorrecta");
                questionAnswers2.setFeedback("opcao incorrecta");
                questionAnswers3.setFeedback("opcao incorrecta");
                questionAnswers4.setFeedback(answerFeedback);
                questionAnswers5.setFeedback("opcao incorrecta");
            }break;
            case 'e':{
                questionAnswers1.setFraction((long) 0);
                questionAnswers2.setFraction((long) 0);
                questionAnswers3.setFraction((long) 0);
                questionAnswers4.setFraction((long) 0);
                questionAnswers5.setFraction((long) 1);
                questionAnswers1.setFeedback("opcao incorrecta");
                questionAnswers2.setFeedback("opcao incorrecta");
                questionAnswers3.setFeedback("opcao incorrecta");
                questionAnswers4.setFeedback("opcao incorrecta");
                questionAnswers5.setFeedback(answerFeedback);
            }break;


        }



        questionAnswers1.setCharId("a");
        questionAnswers2.setCharId("b");
        questionAnswers3.setCharId("c");
        questionAnswers4.setCharId("d");
        questionAnswers5.setCharId("e");
        if (!(questionId.hashCode()>0)) {
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
                   return this.examDetailsAdmin(idExam,quest);
                } catch (Exception e) {
                    System.out.println("error, nao foi possivel salvar uma questao");
                }
            } catch (Exception e) {
                System.out.println("Error, nao foi possivel adicionar a questao");
            }
        } else {
            try {
                crudService.update(question);
                return this.examDetailsAdmin(idExam,quest);
            } catch (Exception e) {
                System.out.println("error, nao foi possivel actualizar a questao");
            }
        }

        return this.examDetailsAdmin(idExam,quest);
    }


    @RequestMapping(value = "exams-admin/exam-add", method = RequestMethod.GET)
    public ModelAndView examAdd() {

        model = new ModelAndView("exam-form");
        List<Category> categories = crudService.getAll(Category.class);
        List<University> universities = crudService.getAll(University.class);
        model.addObject("categories", categories);
        model.addObject("universities", universities);
        model.addObject("exam", null);

        return model;
    }
    @RequestMapping(value = "/explainers-admin", method = RequestMethod.GET)
    public ModelAndView explainersAdmin(
    ) {
        model = new ModelAndView("explainers-admin");
        return model;
    }
}
