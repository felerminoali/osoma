package mz.co.osoma.controller;

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
	public ModelAndView index(@RequestParam("ano") Optional<Integer> ano, @RequestParam Optional<Integer> universidade ) {

		List<Exam> exams ;//=  crudService.getAll(Exam.class);
		paramentos = new HashMap<String, Object>(1);

		HashMap<String, Object> parametroAux = new HashMap<String, Object>(1);
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT e FROM Exam e ");

		if(universidade.hashCode()!=0){
			sql.append("WHERE e.university = :university");

			StringBuilder query = new StringBuilder();

			query.append("SELECT u FROM University u WHERE u.id = :id");
			parametroAux.put("id", universidade.hashCode());
			University university = crudService.findEntByJPQuery(query.toString(),
					parametroAux);

			paramentos.put("university", university);


		}else if(ano.hashCode()!=0){
			sql.append("WHERE e.examYear = :ano");
			paramentos.put("ano", ano.hashCode());
		}



		exams = crudService.findByJPQuery(sql.toString(), paramentos);

		ModelAndView model = new ModelAndView("index");
		model.addObject("exams", exams);

		return model;
	}

}