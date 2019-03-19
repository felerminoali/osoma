package mz.co.osoma.controller;

import mz.co.osoma.model.Exam;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("CRUDServiceImpl")
	private CRUDService crudService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {

		List<Exam> exams =  crudService.getAll(Exam.class);
		ModelAndView model = new ModelAndView("index");
		model.addObject("exams", exams);

		return model;
	}

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String index(@PathVariable(value = "year") int year, Model model) {
//		List<Exam> exams =  crudService.getAll(Exam.class);
//		model.addAttribute("exams",exams);
//		return "index";
//	}

}