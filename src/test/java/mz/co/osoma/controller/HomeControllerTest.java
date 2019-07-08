package mz.co.osoma.controller;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.controller.HomeController;
import mz.co.osoma.model.Exam;
import mz.co.osoma.model.ExamGroup;
import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration (classes = HibernateConf.class)
public class HomeControllerTest {


    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;


    private CRUDService getCrudService() {
        return crudService;
    }

    @Test
    public void indexController() {

        Optional<Integer> ano = Optional.of(2005);
        Optional<Integer> universidade = Optional.empty();
        Optional<Integer> pg = Optional.empty();
        Optional<Integer> exame = Optional.empty();
        Optional<String> search = Optional.empty();

        HomeController homeController = new HomeController();
        homeController.crudService = crudService;

        ModelAndView model = homeController.index(ano, universidade, pg, exame, search);

        Assert.assertNotNull(model);
    }

   /* @Test
    public void SetupModelAttributes() {

        Optional<Integer> ano = Optional.of(2007);
        Optional<Integer> universidade = Optional.of(72);
        Optional<Integer> exame = Optional.empty();

        HomeController homeController = new HomeController();

        homeController.crudService = getCrudService();

        homeController.SetupModelAttributes(ano, universidade, exame);

        Assert.assertNotNull(homeController.model);

    }*/

    /*@Test
    public void getModel() {
        HomeController homeController = new HomeController();
        Assert.assertNotNull(homeController.model);
    }*/

    @Test
    public void setModel() {

        HomeController homeController = new HomeController();

        ModelAndView m = new ModelAndView();

        homeController.setModel(m);

        Assert.assertEquals(m, homeController.model);


    }

    @Test
    public void getExams() {

        Exam e1 = new Exam();
        Exam e2 = new Exam();
        Exam e3 = new Exam();

        HomeController homeController = new HomeController();

        homeController.exams.add(e1);

        homeController.exams.add(e2);

        homeController.exams.add(e3);

        Assert.assertEquals(homeController.getExams().size(), 3);

    }


    @Test
    public void setExams() {

        Exam e1 = new Exam();
        Exam e2 = new Exam();

        HomeController homeController = new HomeController();

        List<Exam> exams = new ArrayList<Exam>();

        exams.add(e1);

        homeController.setExams(exams);

        Assert.assertEquals(e2, homeController.exams.get(0));
    }


    @Test
    public void setUsers() {
        HomeController homeController = new HomeController();

        User u1 = new User();
        User u2 = new User();


        List usrs = new ArrayList<User>();

        usrs.add(u1);
        usrs.add(u2);

        homeController.setUsers(usrs);

        Assert.assertEquals(2, homeController.users.size());

    }

    @Test
    public void getUsers() {
        HomeController homeController = new HomeController();

        User u1 = new User();
        User u2 = new User();

        List<User> users = new ArrayList<User>();

        users.add(u1);
        users.add(u2);

        homeController.setUsers(users);

        Assert.assertEquals(2, homeController.getUsers().size());
    }




    // Ver cobertura de codigo para este teste
    @Test
    public void getYearsCount() {

        HomeController homeController = new HomeController();
        homeController.crudService = getCrudService();

        Integer ano = 2005;
        Integer exame = null;
        Integer university = null;

        List<ExamGroup> eGroup = new ArrayList<ExamGroup>();

        eGroup = homeController.getYearsCount(ano, exame, university);

        ExamGroup e = new ExamGroup();

        e = eGroup.get(0);
        Assert.assertEquals(7, e.count);
        Assert.assertEquals(e.year, 2005);
    }

    @Test
    public void getExamsCount() {

        HomeController homeController = new HomeController();

        crudService = this.getCrudService();
        homeController.crudService = crudService;

        Integer ano = 2007;
        Integer exame = null;
        Integer universidade = null;

        List<ExamGroup> examGroups = homeController.getExamsCount(exame, ano, universidade);

        // deve retornar 1 uma universidade de 2007
        Assert.assertEquals(examGroups.size(), 0);
        exame = 2;

        //*********
        examGroups = homeController.getExamsCount(exame, ano, universidade);
        Assert.assertEquals(examGroups.size(), 0);

        universidade = 12;

        //*********
        examGroups = homeController.getExamsCount(exame, ano, universidade);
        Assert.assertEquals(examGroups.size(), 0);

    }

    @Test
    public void getUniversityCount() {

        HomeController homeController = new HomeController();
        crudService = getCrudService();
        homeController.crudService = crudService;

        Integer ano = 2007;
        Integer universidade = null;
        Integer exame = null;

        int size = homeController.getUniversitiesCount(universidade,ano,exame).size();

        // Testa os a quantidade de universidades que tenha exame de 2007
        Assert.assertEquals(size,0);

        // Exames da UEM e que sejam de 2005: ==  no banco de dados estao cadastrados 6 exames
        ano = 2005;
        universidade = 2;

        size = homeController.getUniversitiesCount(universidade,ano,exame).get(0).count;

        Assert.assertEquals(6,size);


        //Exame da UEM que seja de 2005 da disciplina Biologia com id 92, no banco de dados existe somente 1 exame
        exame = 92;
        Assert.assertEquals(1,homeController.getUniversitiesCount(universidade,ano,exame).size());

    }


    //HA PROBLEMAS COM A INSTRUCAO FOR DO HomeController:218 ..  Necessario passar por revisao
    @Test
    public void sqlExamUniversiies(){

        HashMap<String, Object> parameters = new HashMap<>();

        HomeController homeController = new HomeController();
        homeController.crudService = getCrudService();

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT u FROM Exam u");

        //int size = homeController.sqlExamUniversities(sql,null).size();
        //System.out.println(size);

    }



    @Test
    public void filterExam(){
        Optional <Integer> ano = Optional.empty();
        Optional <Integer> exame = Optional.empty();
        Optional <Integer> universidade = Optional.empty();
        Optional <String> search = Optional.empty();

        HomeController homeController = new HomeController();
        homeController.crudService = getCrudService();

        // Testa o numero maximo de exames que sao 9
        int size = crudService.findByJPQuery("Select e from Exam e",null).size();
        Assert.assertEquals(size,homeController.filterExam(ano,universidade,exame,search).size());

        HashMap<String,Object> parameter = new HashMap<String,Object>();

        homeController.exams.add(new Exam());
        // exame de matematica id = 2;
        parameter.put("id",2);

        //Busca a quantidade de exames de matematica que estao no banco de dados
        size = crudService.findByJPQuery("select e from Exam e  WHERE e.id = :id",parameter).size();

        //Assert.assertEquals(size,homeController.filterExam(Optional.empty(),Optional.empty(),Optional.empty(),Optional.empty()).size());


        // Teste de exames de disciplinas que pertencem a uma universidade
        parameter.clear();

        // universidade UEM id = 2 ; disciplina Matematica id = 2
        int idExame = 2;
        int idUniverisidade = 2;
        int anoExame = 2005;

        parameter.put("idExame",2);
        parameter.put("idUniversidade",2);
        parameter.put("anoExame", 2005);

        size = crudService.findByJPQuery("select e from Exam e, University u  WHERE e.examYear = :anoExame AND e.id = :idExame AND u.id = :idUniversidade",parameter).size();

        //Assert.assertEquals(size,homeController.filterExam(Optional.of(anoExame),Optional.of(idUniverisidade),Optional.of(idExame),Optional.empty()).size());

        String description = "Bio";
        parameter.clear();

        parameter.put("description","%"+description+"%");

        size = homeController.filterExam(Optional.empty(),Optional.empty(),Optional.empty(),Optional.of(description)).size();

        Assert.assertEquals(size,crudService.findByJPQuery("select e from Exam e where e.description like :description",parameter).size());
    }

    @Test
    public void  sqlQuery() {

        HomeController homeController = new HomeController();

        String table = "exam";

        String query1 = "select e from exam e ";

        String query2 = homeController.sqlQuery(table).toLowerCase();

        Assert.assertEquals(query1, query2);
    }

    @Test
    public  void isNull(){

        HomeController homeController = new HomeController();

        boolean bool = homeController.isNull(null);

        Assert.assertEquals(true,bool);

        bool = homeController.isNull(new String());

        Assert.assertEquals(false,bool);

    }

    @Test
    public void isValidPage(){
        HomeController homeController = new HomeController();
        Assert.assertEquals(false,homeController.isValidPage(1,2));
    }

    @Test
    public void quantityPage(){
        HomeController homeController = new HomeController();
        Assert.assertEquals(1,homeController.quantityPage(1,2));
    }

    // Teste do metodo Pagination


}