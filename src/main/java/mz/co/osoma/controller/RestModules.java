package mz.co.osoma.controller;

import mz.co.osoma.model.District;
import mz.co.osoma.model.Province;
import mz.co.osoma.model.Question;
import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@RestController
public class RestModules {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/mod/save_answer", method = RequestMethod.POST)
    public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {


        String qid = request.getParameter("qid");
        String answerid = request.getParameter("answerid");

        session.setAttribute(qid, answerid);

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


            return new  ResponseEntity<Object>(user, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}
