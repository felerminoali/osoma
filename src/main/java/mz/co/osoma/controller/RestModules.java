package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.MimeTypeUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;

@RestController
public class RestModules {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/mod/save_answer", method = RequestMethod.POST)
    public @ResponseBody
    String add(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        String qid = request.getParameter("qid");
        String answerid = request.getParameter("answerid");
        String label = request.getParameter("label");

        session.setAttribute(qid, answerid + "_" + label);
        return "Done";
    }

    @RequestMapping(
            value = "/districts/{id}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> getDitrictsByProvince(@PathVariable("id") int id) {
        try {
            Map<String, Object> par = new HashMap<String, Object>();
            par.put("p", id);
            List<District> districtList = crudService.findByJPQuery("SELECT d FROM District d WHERE d.province.id = :p", par);

            if (districtList == null) {
                return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }
            return new ResponseEntity<Object>(districtList, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }



    @GetMapping(value = "/exams/all")
    public List<Exam> exams(){
        return crudService.getAll(Exam.class);
    }
    @RequestMapping(
            value = "/results-list/{exam}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> resultList(@PathVariable("exam") int exam) {
        try {


            String sqlSufix = (exam!=-1)? " and e.exam.id = "+exam: " ";
            List<ExamAttempts> examAttempts = crudService.findByJPQuery("SELECT e from ExamAttempts e WHERE e.start = (SELECT MAX(y.start) from ExamAttempts y WHERE y.user.id = e.user.id and y.exam.id = e.exam.id)"+sqlSufix, null);


            if (examAttempts == null) {
                return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            List<Object> list = new ArrayList<>();
            for (int i = 0; i < examAttempts.size(); i++) {

                ExamAttempts eA = examAttempts.get(i);
                Results results = new Results();

                results.setCount(i + 1);
                results.setCode(eA.getUser().getPreRegistationCode());
                results.setFullname(eA.getUser().getName()+" "+eA.getUser().getLastName());
                results.setContact(eA.getUser().getContact());
                results.setScore(eA.getScore());
                results.setExam(eA.getExam().getDescription());

                list.add(results);
            }



            Map<String, Object> result = new HashMap<String, Object>();
            result.put("data", list);
            result.put("recordsTotal", examAttempts.size());
            result.put("draw", 1);
            result.put("recordsFiltered", examAttempts.size());

            return new ResponseEntity<Object>(result, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/users/preregisted/{course}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> preregistedList(@PathVariable("course") int course) {
        try {
            Map<String, Object> par = new HashMap<String, Object>();
            par.put("preregisted", Short.parseShort("1"));
            List<User> users = crudService.findByJPQuery("SELECT u FROM User u Where u.preregisted = :preregisted", par);

            if (users == null) {
                return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            List<PreregistedUser> list = new ArrayList<>();
            for (int i = 0; i < users.size(); i++) {

                User user = users.get(i);

                UserCourse userCourse = null;
                if(course!=-1) {
                    userCourse = crudService.findEntByJPQuery("FROM UserCourse u Where u.course.id = " + course + " and u.user.id= " + user.getId(), null);
                }

                if(userCourse!=null || course==-1){
                    PreregistedUser pregUser = new PreregistedUser();

                    pregUser.setCount(i + 1);
                    pregUser.setName(user.getName() + " " + user.getLastName());
                    pregUser.setEmail(user.getEmail());
                    pregUser.setContact(user.getContact());
                    pregUser.setAge(Helper.getDiffYears(user.getDob()));
                    pregUser.setCode(user.getPreRegistationCode());
                    pregUser.setProvince(user.getDistrict().getProvince().getProvince());



                    String html = "<a href=\"#\" rel=\"" + user.getId() + "\" class=\"view btn btn-default\" title=\"View\" data-toggle=\"tooltip\">Gerir cursos</a>";
                    html += "&nbsp;&nbsp;<a href=\"#\" rel=\"" + user.getId() + "\" class=\"edit\" title=\"Edit\" data-toggle=\"tooltip\"><i class=\"fa fa-edit\"></i></a>";
                    html += "&nbsp;&nbsp;<a href=\"#\" rel=\"" + user.getId() + "\" class=\"delete\" title=\"Delete\" data-toggle=\"tooltip\"><i class=\"fa fa-minus-circle\"></i></a>";
                    pregUser.setAction(html);
                    list.add(pregUser);
                }

            }

            Map<String, Object> result = new HashMap<String, Object>();
            result.put("data", list);
            result.put("recordsTotal", users.size());
            result.put("draw", 1);
            result.put("recordsFiltered", list.size());

            return new ResponseEntity<Object>(result, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }



    @RequestMapping(
            value = "/users/{type}/{value}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> findUserByEmail(@PathVariable("type") String type, @PathVariable("value") String value) {
        try {
            Map<String, Object> par = new HashMap<String, Object>();

            User user = new User();
            if (type.equals("email")) {
                par.put("email", value);
                user = crudService.findEntByJPQuery("FROM User u WHERE u.email = :email", par);
            }
            if (type.equals("contact")) {
                par.put("contact", value);
                user = crudService.findEntByJPQuery("FROM User u WHERE u.contact = :contact", par);
            }

            if (user == null) {
                return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            return new ResponseEntity<Object>(user, HttpStatus.OK);


        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/question/{examid}/{index}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> findExamQuestion(@PathVariable("examid") int examID, @PathVariable("index") int index) {
        try {

            List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + examID, null);

            if (questions == null) {
                return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }

            Question question = questions.get(index);


            return new ResponseEntity<Object>(question, HttpStatus.OK);


        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/exam/{examid}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> findExam(@PathVariable("examid") int examID) {
        try {
            Exam exam = crudService.findEntByJPQuery("SELECT e FROM Exam e where e.id = " + examID, null);

            if (exam == null) {
                return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
            }
            return new ResponseEntity<Object>(exam, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(
            value = "/user/{id}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> getUser(@PathVariable("id") int id) {

        User user = crudService.findEntByJPQuery("SELECT u FROM User u where u.id = " + id, null);

        if (user == null) {
            return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        return new ResponseEntity<Object>(user, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/mod/saved_answer/{question_id}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> getAnswerByQuestionId(@PathVariable("question_id") String key, HttpSession session) {

        Object value = session.getAttribute(key);


        if (value == null) {
            return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        String[] choosed = ((String) value).split("_");

        SavedAnswer response = new SavedAnswer(key, choosed[0], choosed[1]);

        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/mod/saved_answers/{examid}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<?> getAnswersByExam(@PathVariable("examid") String examid, HttpSession session) {

        List<Question> questions = crudService.findByJPQuery("SELECT e FROM Question e where e.exam = " + examid, null);

        if (questions == null) {
            return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        for (Question question : questions) {
            Object value = session.getAttribute(question.getId() + "");
            if (value != null) {
                String[] choosed = ((String) value).split("_");
                SavedAnswer response = new SavedAnswer(question.getId() + "", choosed[0], choosed[1]);
                map.put(question.getId() + "", new SavedAnswer(question.getId() + "", choosed[0], choosed[1]));
            }
        }

        if (map.isEmpty()) {
            return new ResponseEntity<Object>(new EmptyJsonResponse(), HttpStatus.OK);
        }

        return ResponseEntity.ok(map);
    }


    @PostMapping(value = "/user/add")
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<Object> addUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", true);
        if (bindingResult.hasErrors()) {
            List<FieldError> errors = bindingResult.getFieldErrors();
            map.put("inputerror", errors);
            map.put("status", false);
            return new ResponseEntity<Object>(map, HttpStatus.OK);
        }

        user.setUniversity(crudService.get(University.class, 33));
        String password = new BCryptPasswordEncoder().encode("password").toString();
        user.setPassword(password);
        user.setDatecreated(Calendar.getInstance().getTime());
        user.setActive(true);
        user.setPreregisted(Short.parseShort("1"));

        Role role_user = crudService.get(Role.class, 4);
        Set<Role> roles = new HashSet<Role>();
        roles.add(role_user);

        user.setRoles(roles);

        crudService.Save(user);
        user.setPreRegistationCode(user.getId() + 1000 + "");
        crudService.update(user);

        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/user/update",
            method = RequestMethod.POST,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> updateUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {

        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        List<FieldError> errors = new ArrayList<>();
        if (bindingResult.hasErrors()) {
            for (FieldError fieldError : fieldErrors) {
                if (!(fieldError.getField().equals("email") || fieldError.getField().equals("contact"))) {
                    errors.add(fieldError);
                }
            }
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", true);
        if (errors.size() > 0) {
            map.put("inputerror", errors);
            map.put("status", false);
            return new ResponseEntity<Object>(map, HttpStatus.OK);
        }

        User userUpdate = crudService.get(User.class, user.getId());

        user.setUniversity(userUpdate.getUniversity());
        user.setPassword(userUpdate.getPassword());
        user.setDatecreated(userUpdate.getDatecreated());
        user.setActive(userUpdate.getActive());
        user.setPreregisted(userUpdate.getPreregisted());
        user.setPreRegistationCode(userUpdate.getPreRegistationCode());

        crudService.update(user);

        map.put("status", true);
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/user/delete/{id}",
            method = RequestMethod.POST,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> deleteUser(@PathVariable("id") int id) {

        User user = crudService.get(User.class, id);
        Map<String, Object> map = new HashMap<String, Object>();

        if (user == null) {
            map.put("status", false);
        }
        crudService.delete(user);

        map.put("status", true);
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/course/add/{user}/{course}",
            method = RequestMethod.POST,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> addCourse(@PathVariable("user") int user, @PathVariable("course") int course) {

        UserCourse userCourse = new UserCourse();

        userCourse.setUser(crudService.get(User.class, user));
        userCourse.setCourse(crudService.get(Course.class, course));

        UserCoursePK userCoursePK = new UserCoursePK();

        userCoursePK.setUserId(user);
        userCoursePK.setCourseId(course);
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(Calendar.getInstance().getTime());
        userCoursePK.setYear(calendar.get(Calendar.YEAR));
        userCourse.setUserCoursePK(userCoursePK);

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            crudService.Save(userCourse);
        } catch (Exception exception) {
            map.put("status", false);
            return new ResponseEntity<Object>(map, HttpStatus.OK);
        }

        map.put("status", true);

        List<UserCourse> userCourses = crudService.getAll(UserCourse.class);
        map.put("courses", userCourses);
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }


    @RequestMapping(
            value = "/course/{user}",
            method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> courseByUser(@PathVariable("user") int user) {
        Map<String, Object> map = new HashMap<String, Object>();


        List<UserCourse> userCourses = crudService.findByJPQuery("SELECT u FROM UserCourse u where u.userCoursePK.userId = " + user, null);
        map.put("status", true);
        if (userCourses == null || user ==-1) {
            map.put("status", false);
        }
        //map.put("courses", userCourses);

        List<CourseTableDisplay> list = new ArrayList<>();
        for (UserCourse uc: userCourses) {
            CourseTableDisplay row = new CourseTableDisplay();
            row.setCourse(uc.getCourse().getName()+" "+uc.getCourse().getPeriod().getDescription());
            row.setAction("<a\n" +
                    "class=\"btn btn-sm btn-danger remove-course\" href=\"#\"\n" +
                    "rel=\""+uc.getUser().getId()+"_"+uc.getCourse().getId()+"_2020"+"\"\n" +
                    "title=\"Remover\"><i\n" +
                    "class=\"glyphicon glyphicon-remove\"></i> Remover</a>");
            list.add(row);

        }



        map.put("data", list);
        map.put("recordsTotal", userCourses.size());
        map.put("draw", 1);
        map.put("recordsFiltered", userCourses.size());


        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

    @RequestMapping(
            value = "/course_user/delete/{user}/{course}/{year}",
            method = RequestMethod.POST,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE},
            headers = "Accept=application/json"
    )
    public ResponseEntity<Object> deleteCourseUser(@PathVariable("user") int user, @PathVariable("course") int course, @PathVariable("year") int year) {

        Map<String, Object> par = new HashMap<String, Object>();
        par.put("user", user);
        par.put("course", course);
        par.put("year", year);

        UserCourse userCourse = crudService.findEntByJPQuery("SELECT u FROM UserCourse u where u.userCoursePK.userId = :user AND u.userCoursePK.courseId = :course AND u.userCoursePK.year = :year", par);
        Map<String, Object> map = new HashMap<String, Object>();

        if (userCourse == null) {
            map.put("status", false);
        }
        crudService.delete(userCourse);

        List<UserCourse> userCourses = crudService.getAll(UserCourse.class);
        map.put("courses", userCourses);

        map.put("status", true);
        return new ResponseEntity<Object>(map, HttpStatus.OK);
    }

}
