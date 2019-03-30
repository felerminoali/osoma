package mz.co.osoma.controller;

import mz.co.osoma.model.Category;
import mz.co.osoma.model.Exam;
import mz.co.osoma.model.University;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.management.Query;
import java.util.*;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("CRUDServiceImpl")
	private CRUDService crudService;
	private HashMap<String, Object> paramentos;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(@RequestParam("ano") Optional<Integer> ano1, @RequestParam Optional<Integer> universidade,
							  @RequestParam ("exame") Optional<Integer>  exame1 ) {


		List<Exam> exams ;//=  crudService.getAll(Exam.class);
		paramentos = new HashMap<String, Object>(1);

		HashMap<String, Object> parametroAux = new HashMap<String, Object>(1);
		HashMap<String, Object> auxDisciplina = new HashMap<String, Object>(1);

		StringBuilder sql = new StringBuilder();

		sql.append("SELECT e FROM Exam e ");
		//disc.append(" ");

		// concatenacao
	/*	if(universidade.hashCode()!=0 && ano1.hashCode()!=0){



			//	if(exame1.hashCode()!=0){

			sql.append("WHERE e.university = :university");
			StringBuilder query = new StringBuilder();

			query.append("SELECT u FROM University u WHERE u.id = :id and e.examYear = :ano ");
			parametroAux.put("id", universidade.hashCode());
			University university = crudService.findEntByJPQuery(query.toString(), parametroAux);

			paramentos.put("university", university);

				//	sql.append("WHERE e.examYear = :ano");
					paramentos.put("ano", ano1.hashCode());

			//		sql.append("WHERE e.category = :category");

			//		StringBuilder disc = new StringBuilder();

			//		disc.append("SELECT c FROM Category c WHERE c.id = :id");
			//		auxDisciplina.put("id", exame1.hashCode());
			//		Category category = crudService.findEntByJPQuery(disc.toString(), auxDisciplina);

			//		paramentos.put("category", category);



		}*/










		// o if abaixo devolve os exames seleccionados pelo nome da universidade

		if(universidade.hashCode()!=0){
			sql.append("WHERE e.university = :university");

			StringBuilder query = new StringBuilder();

			query.append("SELECT u FROM University u WHERE u.id = :id");
			parametroAux.put("id", universidade.hashCode());
			University university = crudService.findEntByJPQuery(query.toString(), parametroAux);

			paramentos.put("university", university);


		}


		// o if abaixo devolve os exames seleccionados pelo ano de realizacao
		else if(ano1.hashCode()!=0){
			sql.append("WHERE e.examYear = :ano");
			paramentos.put("ano", ano1.hashCode());
		}
		//o if abaixo devolve os exames seleccionados pelo nome da disciplina

		else if(exame1.hashCode()!=0){
			sql.append("WHERE e.category = :category");

			StringBuilder disc = new StringBuilder();

			disc.append("SELECT c FROM Category c WHERE c.id = :id");
			auxDisciplina.put("id", exame1.hashCode());
			Category category = crudService.findEntByJPQuery(disc.toString(), auxDisciplina);

			paramentos.put("category", category);

		}



		exams = crudService.findByJPQuery(sql.toString(), paramentos);

		ModelAndView model = new ModelAndView("index");
		model.addObject("exams", exams);

		return model;
	}

}