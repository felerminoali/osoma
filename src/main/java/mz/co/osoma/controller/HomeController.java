package mz.co.osoma.controller;

import mz.co.osoma.model.Category;
import mz.co.osoma.model.Exam;
import mz.co.osoma.model.University;
import mz.co.osoma.service.CRUDService;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import java.util.*;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("CRUDServiceImpl")
	public CRUDService crudService;
	private HashMap<String, Object> parametros;

	ModelAndView model ;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(@RequestParam("ano") Optional<Integer> ano, @RequestParam Optional<Integer> universidade,
							  @RequestParam("pg") Optional<Integer> pg, Optional<Integer> exame, Optional<String> search) {

//		model.clear();
		model = new ModelAndView("index");

		List<Exam> exams = filterExam(ano, universidade, pg, exame, search);

		SetupModelAtributes(exams);

		return model;
	}


	public List<Exam> filterExam(Optional<Integer> ano, Optional<Integer> universidade,
								 Optional<Integer> pg, Optional<Integer> exame, Optional<String> search) {

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
			model.addObject("universidade",universidade.get());
			control = true;

		}

		if (ano.hashCode() != 0) {

			if(control){
				sql.append(" AND ");
			}

			sql.append("e.examYear = :ano");
			param.put("ano", ano.hashCode());
			model.addObject("ano",ano.get());
			control = true;
		}

		if (exame.hashCode() != 0) {

			if(control){
				sql.append(" AND ");
			}

			query = new StringBuilder();
			query.append(sqlQuery("Category") + " WHERE e.id = :id");

			paramAux.put("id", exame.hashCode());
			Category category = crudService.findEntByJPQuery(query.toString(), paramAux);

			sql.append("e.category = :category");
			param.put("category", category);

			model.addObject("exame",exame.get());
			control = true;

		}
		if (search.toString() != "Optional.empty") {

			if(control){
				sql.append(" AND ");
			}
			sql.append("e.description like :search");
			param.put("search", "%" + search.get() + "%");
		}

		List<Exam> exams = crudService.findByJPQuery(sql.toString(), param);
		return exams;
	}

	private void SetupModelAtributes(List<Exam> exams){

		Integer []years = getNonRepeatedYears(crudService.getAll(Exam.class));
		Integer []examsCount = countExams(years);
		Integer []universityExamsCount = getUniversityExamsCount();
		Integer []examsCategoriesCount = getExamCategoriesCount();

		List <University> u = crudService.getAll(University.class) ;
		List<Category> c = crudService.getAll(Category.class);

		model.addObject("exams", exams);
		model.addObject("subjects",c);
		model.addObject("universities",u);
		model.addObject("years",years);
		model.addObject("examsCount",examsCount);
		model.addObject("universityExamsCount",universityExamsCount);
		model.addObject("examsCategoriesCount",examsCategoriesCount);
        model.addObject("universityExamsCount",universityExamsCount);

	}

	private String sqlQuery(String table) {
		return "SELECT e FROM " + table + " e ";
	}

	Integer []countExams(Integer []years){

		List<Exam> exams = crudService.getAll(Exam.class);

		Integer []examsCount = new Integer[years.length];

		for (int i = 0; i < years.length  ;i++){

			int counter = 0;

			for (int j = 0 ; j < exams.size() ;j++){

				if ( exams.get(j).getExamYear() == years[i]){
					counter++;
				}

			}

			examsCount[i] = counter + years[i];
		}

		return examsCount;
	}


	Integer [] getNonRepeatedYears(List<Exam> exams){

		Integer []years = new Integer[exams.size()];

		years[0] = exams.get(0).getExamYear();

		int j = 0;

		for (int i = 0 ; i < exams.size() ;i++){
			boolean t = false;

			for (int k = 0; k <= j ; k++ ){

				if (exams.get(i).getExamYear() == years[k]) {
					t = true;
					break;
				}

			}

			if (!t){
				j++;
				years[j] = exams.get(i).getExamYear();
			}

		}

		Integer []a = new Integer[j+1];

		for (int i = 0 ; i <= j;i++)
			a[i] = years[i];

		return a;
	}

	Integer []getUniversityExamsCount(){

		List<University> u =  crudService.getAll(University.class);

		Integer[] universityIDs;
		Integer[] universitiesExamsCount;

		List <Exam> exams = crudService.getAll(Exam.class);


		universityIDs = u.stream().map(University::getId).toArray(Integer[]::new);
		universitiesExamsCount = new Integer[universityIDs.length];


		for ( int i = 0 ; i < universityIDs.length ;i++){

			int counter = 0;

			for (int j = 0 ; j < exams.size() ;j++){

				if (exams.get(j).getUniversity().getId() == universityIDs[i]){
					counter++;
				}
			}
			universitiesExamsCount[i] = counter;
		}

		return universitiesExamsCount;

	}

	Integer []getExamCategoriesCount(){

		List<Category> c = crudService.getAll(Category.class);

		List<Exam> exams = crudService.getAll(Exam.class);

		Integer[] examsCategoriesCount = new Integer[c.size()];

		for (int i = 0 ; i < c.size() ;i++){

			Integer counter = 0;

			for (int j = 0 ; j < exams.size() ;j++){

				if (c.get(i).getId() == exams.get(j).getCategory().getId()){
					counter++;
				}

			}
			examsCategoriesCount[i] = counter;

		}

		return examsCategoriesCount;

	}


}