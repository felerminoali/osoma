package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.SavedAnswerResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
public class RestModules {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/mod/save_answer", method = RequestMethod.POST)
    public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        String qid = request.getParameter("qid");
        String answerid = request.getParameter("answerid");
        String label = request.getParameter("label");

        session.setAttribute(qid, answerid+"_"+label);
        return "Done";
    }

    @RequestMapping(
            value = "/districts/{id}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> getDitrictsByProvince(@PathVariable("id") int id) {
        try {
            Map<String, Object> par = new HashMap<String, Object>();
            par.put("p",id);
            List<District> districtList = crudService.findByJPQuery("SELECT d FROM District d WHERE d.province.id = :p", par);

            if(districtList == null){
                return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }
            return new  ResponseEntity<Object>(districtList, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/users/{type}/{value}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> findUserByEmail(@PathVariable("type") String type, @PathVariable("value") String value) {
        try {
            Map<String, Object> par = new HashMap<String, Object>();

            User user = new User();
            if(type.equals("email")){
                par.put("email",value);
                user = crudService.findEntByJPQuery("FROM User u WHERE u.email = :email", par);
            }
            if(type.equals("contact")){
                par.put("contact",value);
                user = crudService.findEntByJPQuery("FROM User u WHERE u.contact = :contact", par);
            }

            if(user == null){
                return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            return new  ResponseEntity<Object>(user, HttpStatus.OK);


        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/question/{examid}/{index}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> findExamQuestion(@PathVariable("examid") int examID, @PathVariable("index") int index) {
        try {

            List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + examID, null);

            if(questions == null){
                return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            Question question = questions.get(index);


            return new  ResponseEntity<Object>(question, HttpStatus.OK);


        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/exam/{examid}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> findExam(@PathVariable("examid") int examID) {
        try {
            Exam exam = crudService.findEntByJPQuery("SELECT e FROM Exam e where e.id = " + examID, null);

            if(exam == null){
                return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }
            return new  ResponseEntity<Object>(exam, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }



    @RequestMapping(
            value = "/mod/saved_answer/{question_id}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> getAnswerByQuestionId(@PathVariable("question_id") String key, HttpSession session) {

        Object value =  session.getAttribute(key);



        if(value == null){
            return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        String[] choosed = ((String) value).split("_");

        SavedAnswerResponse response = new SavedAnswerResponse(key, choosed[0], choosed[1]);

//        System.out.println(response);

        return new  ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @GetMapping("/test")
    public String testRest(){
        return null;
    }
}
