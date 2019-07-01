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
import java.util.*;

@Controller
public class HomeController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    public ModelAndView model;
    public List<Exam> exams = new ArrayList<Exam>();
    public List<User> users = new ArrayList<>();

    public ModelAndView getModel() {
        return model;
    }

    public void setModel(ModelAndView model) {
        this.model = model;
    }

    public List<Exam> getExams() {
        return exams;
    }

    public void setExams(List<Exam> exams) {
        this.exams = exams;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam("ano") Optional<Integer> ano, @RequestParam Optional<Integer> universidade,
                              @RequestParam("pg") Optional<Integer> pg, Optional<Integer> exame, Optional<String> search) {


        model = new ModelAndView("index");

        exams = filterExam(ano, universidade, exame, search);

        SetupModelAttributes(ano, universidade, exame);

        pagination(pg);

        model.addObject("exams", exams);
        model.addObject("email", null);
        return model;
    }

    public void SetupModelAttributes(Optional<Integer> ano, Optional<Integer> universidade, Optional<Integer> exame) {

        Integer year = ano.hashCode()!=0 ? ano.get() : null;
        Integer exam = exame.hashCode()!=0 ? exame.get() : null;
        Integer university = universidade.hashCode()!=0 ? universidade.get() : null;

        List<ExamGroup> examYearList = getYearsCount(year, exam, university);
        List<ExamGroup> examCategoryList = getExamsCount(exam, year, university);
        List<ExamGroup> examUniversityList = getUniversitiesCount(university, year,exam);

        model.addObject("examYearList", examYearList);
        model.addObject("examCategoryList", examCategoryList);
        model.addObject("examUniversityList", examUniversityList);

        this.model.addObject("exams", exams);
    }

    public List<ExamGroup> getYearsCount(Integer ano, Integer exame, Integer university) {

        HashMap<String, Object> parameter = new HashMap<String, Object>(1);

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT COUNT(e.examId), e.examYear FROM Exam e");

        if (!isNull(university)) {
            sql.append(", University u ");
        }
        if (!isNull(exame)) {
            sql.append(", Category c ");
        }
        boolean control = false;

        if (!isNull(ano)) {
            sql.append(" WHERE e.examYear = :ano ");
            parameter.put("ano", ano);
            control = true;
        }
        if (!isNull(university)) {
            if (control) {
                sql.append(" AND ");
            } else {
                sql.append(" WHERE ");
            }
            sql.append(" e.university = u.id AND u.id = :university ");
            parameter.put("university", university);
            control = true;
        }
        if (!isNull(exame)) {
            if (control) {
                sql.append(" AND ");
            } else {
                sql.append(" WHERE ");
            }
            sql.append(" e.category = c.id AND c.id = :exam ");
            parameter.put("exam", exame);
            control = true;
        }
        if (!control) {
            parameter = null;
        }
        sql.append(" GROUP BY e.examYear");

        List listResult = crudService.findByJPQuery(sql.toString(), parameter);

        List<ExamGroup> examGroupList = new ArrayList<ExamGroup>();
        for (Object object : listResult) {
            Object[] result = (Object[]) object;
            examGroupList.add(new ExamGroup(result[0].hashCode(), result[1].hashCode()));
        }
        return examGroupList;
    }

    public List<ExamGroup> getExamsCount(Integer exam, Integer ano, Integer university) {

        HashMap<String, Object> parameter = new HashMap<String, Object>(1);
        List<ExamGroup> examGroupList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();

        String query = "SELECT COUNT(e.examId), c.name, c.id FROM Category c, Exam e WHERE e.category = c.id ";
        if (!isNull(university)) {
            query = "SELECT COUNT(e.examId), c.name, c.id FROM Category c, University u, Exam e WHERE e.category = c.id ";
        }
        sql.append(query);

        if (!isNull(exam)) {
            sql.append(" AND c.id = :exam ");
            parameter.put("exam", exam);
        }
        if (!isNull(ano)) {
            sql.append(" AND e.examYear = :ano ");
            parameter.put("ano", ano);
        }
        if (!isNull(university)) {
            sql.append(" AND u.id = e.university AND u.id = :university ");
            parameter.put("university", university);
        }

        sql.append(" GROUP BY c.name, c.id");
        examGroupList = sqlExamUniversities(sql, parameter);

        return examGroupList;

    }

    public List<ExamGroup> getUniversitiesCount(Integer university, Integer ano, Integer exame) {
        StringBuilder sql = new StringBuilder();
        HashMap<String, Object> parameter = new HashMap<String, Object>(1);
        List<ExamGroup> examGroupList;

        sql.append("SELECT COUNT(e.examId), u.shortname, u.id  FROM Exam e, University u " +
                "WHERE e.university = u.id ");

        if(!isNull(exame)){
            sql = new StringBuilder();
            sql.append("SELECT COUNT(e.examId), u.shortname, u.id  FROM Exam e, University u, Category c " +
                    "WHERE e.university = u.id ");
        }
        if (!isNull(ano)) {
            sql.append(" AND e.examYear = :ano ");
            parameter.put("ano", ano);
        }
        if(!isNull(university)){
            sql.append(" AND u.id = :university ");
            parameter.put("university", university);
        }
        if(!isNull(exame)){
            sql.append(" AND e.category = c.id AND c.id = :exame ");
            parameter.put("exame", exame);
        }
        sql.append(" GROUP BY u.id, u.shortname ");

        examGroupList = sqlExamUniversities(sql, parameter);

		return examGroupList;
    }

    public List<ExamGroup> sqlExamUniversities(StringBuilder sql, HashMap<String, Object> parameter) {

        List<ExamGroup> listResult;
        if (isNull(parameter)) {
            listResult = crudService.findByJPQuery(sql.toString(), null);
        } else {
            listResult = crudService.findByJPQuery(sql.toString(), parameter);
        }

        List<ExamGroup> examGroupList = new ArrayList<ExamGroup>();

        for (Object object : listResult) {
            Object[] result = (Object[]) object;
            examGroupList.add(new ExamGroup(result[0].hashCode(), result[1].toString(), result[2].hashCode()));
        }

        return examGroupList;
    }

    public List<Exam> filterExam(
            Optional<Integer> ano, Optional<Integer> universidade,
            Optional<Integer> exame, Optional<String> search) {

        HashMap<String, Object> param = new HashMap<String, Object>(1);
        HashMap<String, Object> paramAux = new HashMap<String, Object>(1);

        StringBuilder sql = new StringBuilder();
        StringBuilder query;

        boolean control = false;

        sql.append(sqlQuery("Exam"));

        if (universidade.hashCode() != 0 || ano.hashCode() != 0 || exame.hashCode() != 0
                || search.toString() != "Optional.empty") {
            sql.append("WHERE ");
        }

        if (universidade.hashCode() != 0) {

            query = new StringBuilder();
            query.append(sqlQuery("University") + " WHERE e.id = :id");

            paramAux.put("id", universidade.hashCode());

            University university = crudService.findEntByJPQuery(query.toString(), paramAux);

            sql.append("e.university = :university");
            param.put("university", university);
            model.addObject("universidade", universidade.get());
            control = true;

        }

        if (ano.hashCode() != 0) {

            if (control) {
                sql.append(" AND ");
            }

            sql.append("e.examYear = :ano");
            param.put("ano", ano.hashCode());
            model.addObject("ano", ano.get());
            control = true;
        }

        if (exame.hashCode() != 0) {

            if (control) {
                sql.append(" AND ");
            }

            query = new StringBuilder();
            query.append(sqlQuery("Category") + " WHERE e.id = :id");

            paramAux.put("id", exame.hashCode());
            Category category = crudService.findEntByJPQuery(query.toString(), paramAux);

            sql.append("e.category = :category");
            param.put("category", category);

            model.addObject("exame", exame.get());
            control = true;

        }
        if (search.toString() != "Optional.empty") {

            if (control) {
                sql.append(" AND ");
            }
            sql.append(" e.description like :search ");
            param.put("search", "%" + search.get() + "%");
        }

        List<Exam> exams = crudService.findByJPQuery(sql.toString(), param);
        return exams;
    }

    public String sqlQuery(String table) {
        return "SELECT e FROM " + table + " e ";
    }

    public void pagination(Optional<Integer> pg) {

        int length = 8;
        int min = 0;
        int max = length;
        if (pg.hashCode() > 1 && isValidPage(pg.get(), length)) {
            min = max * (pg.hashCode() - 1);
            max = min + length;

            if (exams.size() < min) {
                min = exams.size();
            }
            if (exams.size() < max) {
                max = exams.size();
            }
        }

        model.addObject("nPage", quantityPage(exams.size(), length));
        if ( (pg.hashCode() > 1) && isValidPage(pg.get(), length) ) {
            model.addObject("back", pg.hashCode() - 1);
        } else {
            model.addObject("back", 0);
        }

        if (pg.hashCode() <= quantityPage(exams.size(), length)) {
            int next = pg.hashCode() == 0 ? 2 : 1;
            model.addObject("next", pg.hashCode() + next);
        }else{
            model.addObject("next", 0);
        }

        if (exams.size() < max) {
            max = exams.size();
        }
        exams = exams.subList(min, max);

    }
    public void paginationUsers(Optional<Integer> pg) {

        int length = 2;
        int min = 0;
        int max = length;
        if (pg.hashCode() > 1 && isValidPage(pg.get(), length)) {
            min = max * (pg.hashCode() - 1);
            max = min + length;

            if (users.size() < min) {
                min = users.size();
            }
            if (users.size() < max) {
                max = users.size();
            }
        }

        model.addObject("t2nPage", quantityPage(users.size(), length));
        if ( (pg.hashCode() > 1) && isValidPage(pg.get(), length) ) {
            model.addObject("t2back", pg.hashCode() - 1);
        } else {
            model.addObject("t2back", 0);
        }

        if (pg.hashCode() <= quantityPage(users.size(), length)) {
            int next = pg.hashCode() == 0 ? 2 : 1;
            model.addObject("t2next", pg.hashCode() + next);
        }else{
            model.addObject("t2next", 0);
        }

        if (users.size() < max) {
            max = users.size();
        }
        users = users.subList(min, max);

    }


    public int quantityPage(int examsSize, int nExams) {
        return examsSize % nExams != 0 ? ((examsSize / nExams) + 1) : (examsSize / nExams);
    }

    public boolean isValidPage(Integer page, int length){
        return page.hashCode() <= quantityPage(exams.size(), length);
    }

    public boolean isNull(Object object) {
        return object == null;
    }

}