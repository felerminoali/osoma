package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.PreregistedUser;
import mz.co.osoma.service.SavedAnswer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import sun.security.util.Password;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
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
            value = "/users/preregisted",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> preregistedList() {
        try {
            Map<String, Object> par = new HashMap<String, Object>();
            par.put("preregisted",Short.parseShort("1"));
            List<User> users = crudService.findByJPQuery("SELECT u FROM User u Where u.preregisted = :preregisted", par);

            if(users == null){
                return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            List<PreregistedUser> list = new ArrayList<>();
            for (int i = 0; i<users.size(); i++) {

                User user = users.get(i);

                PreregistedUser pregUser = new PreregistedUser();

                pregUser.setCount(i+1);
                pregUser.setName(user.getName()+" "+user.getLastName());
                pregUser.setEmail(user.getEmail());
                pregUser.setContact(user.getContact());
                pregUser.setAge(20);
                pregUser.setCode(user.getPreRegistationCode());
                pregUser.setProvince(user.getDistrict().getProvince().getProvince());

                String html = "<a href=\"#\" class=\"view\" title=\"View\" data-toggle=\"tooltip\"><i class=\"fa fa-eye\"></i></a>";
                html+="&nbsp;&nbsp;<a href=\"#\" rel=\""+user.getId()+"\"class=\"edit\" title=\"Edit\" data-toggle=\"tooltip\"><i class=\"fa fa-edit\"></i></a>";
                html+="&nbsp;&nbsp;<a href=\"#\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class=\"fa fa-minus-circle\"></i></a>";

                pregUser.setAction(html);

                list.add(pregUser);
            }

            Map<String, Object> result = new HashMap<String, Object>();
            result.put("data", list);
            result.put("recordsTotal", users.size());
            result.put("draw", 1);
            result.put("recordsFiltered", users.size());

            return new  ResponseEntity<Object>(result, HttpStatus.OK);
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
            value = "/user/{id}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> getUser(@PathVariable("id") int id) {

        User user = crudService.findEntByJPQuery("SELECT u FROM User u where u.id = " + id, null);

        if(user == null){
            return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        return new  ResponseEntity<Object>(user, HttpStatus.OK);
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

        SavedAnswer response = new SavedAnswer(key, choosed[0], choosed[1]);

        return new  ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/mod/saved_answers/{examid}",
            method = RequestMethod.GET,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<?> getAnswersByExam(@PathVariable("examid") String examid, HttpSession session) {

        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + examid, null);

        if(questions == null){
            return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        for (Question question: questions){
            Object value =  session.getAttribute(question.getId()+"");
            if(value!=null){
                String[] choosed = ((String) value).split("_");
                SavedAnswer response = new SavedAnswer(question.getId()+"", choosed[0], choosed[1]);
                map.put(question.getId()+"",  new SavedAnswer(question.getId()+"", choosed[0], choosed[1]));
            }
        }

        if(map.isEmpty()){
            return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        return ResponseEntity.ok(map);
    }


    @RequestMapping(
            value = "/user/add",
            method = RequestMethod.POST,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> addUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");


        String gpa = request.getParameter("gpa");
        String instituion = request.getParameter("instituion");
        String ms = request.getParameter("ms");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String dob = request.getParameter("dob");

        User user = new User();

        user.setName(fname);
        user.setLastName(lname);
        user.setEmail(email);
        user.setContact(contact);
        user.setGender(crudService.get(Gender.class, Integer.parseInt(gender)));
        user.setGpa(Integer.parseInt(gpa));
        user.setHighSchoolName(instituion);
        user.setMaritalStatus(crudService.get(MaritalStatus.class, Integer.parseInt(ms)));
        user.setDistrict(crudService.get(District.class, Integer.parseInt(district)));
        user.setUniversity(crudService.get(University.class,33));
        user.setPreregisted(Short.parseShort("1"));

        try {
            user.setDob(new SimpleDateFormat("dd/MM/yyyy").parse(dob));
        }catch (ParseException ex){
            ex.printStackTrace();
        }

        String password = new BCryptPasswordEncoder().encode("password").toString();
        user.setPassword(password);

        user.setDatecreated(Calendar.getInstance().getTime());
        user.setActive(true);

        crudService.Save(user);
        user.setPreRegistationCode(user.getId()+1000+"");
        crudService.update(user);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status",true);
        return new  ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/user/update",
            method = RequestMethod.POST,
            produces = { MimeTypeUtils.APPLICATION_JSON_VALUE },
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> updateUser() {

//        User user = crudService.findEntByJPQuery("SELECT u FROM User u where u.id = " + id, null);
//
//        if(user == null){
//            return  new  ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
//        }

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("status",true);
        return new  ResponseEntity<Object>(map, HttpStatus.OK);
    }
}
