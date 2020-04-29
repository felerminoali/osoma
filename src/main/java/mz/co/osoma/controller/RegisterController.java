package mz.co.osoma.controller;

import mz.co.osoma.model.*;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.Email;
import mz.co.osoma.service.SuccessfulRegisted;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

@Controller
public class RegisterController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView registerGet(){


        ModelAndView model = new ModelAndView("user-register");

        List<Province> provinceList = crudService.getAll(Province.class);
        List<University> universities = crudService.getAll(University.class);

        model.addObject("provinceList", provinceList);
        model.addObject("universities", universities);

        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView registerPOST(HttpServletRequest request){


        ModelAndView model = new ModelAndView("user-register-success");

        User user = new User();

        user.setName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setEmail(request.getParameter("email"));

        String password = request.getParameter("password");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        user.setPassword(hashedPassword);


        user.setContact(request.getParameter("contact"));
        user.setDatecreated(Calendar.getInstance().getTime());
        user.setActive(true);
        Integer uniID = Integer.parseInt(request.getParameter("university"));
        University university = crudService.get(University.class, uniID);
        user.setUniversity(university);

        Integer distritID = Integer.parseInt(request.getParameter("distrito"));
        District district = crudService.get(District.class, distritID);
        user.setDistrict(district);

        String pin = generatePIN();
        user.setPin(pin);

        Role role_user = crudService.get(Role.class, 2);
        Set<Role> roles = new  HashSet<Role>();
        roles.add(role_user);

        user.setRoles(roles);

        crudService.Save(user);

        Email email = new Email();
        email.setTo(user.getEmail());
//        email.send(new SuccessfulRegisted(user));

        model.addObject("user",user);
        return model;
    }


    private String hashMD5(String password) {

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            md.update(password.getBytes());
            byte[] digest = md.digest();
            String myHash = DatatypeConverter
                    .printHexBinary(digest).toUpperCase();
            return myHash.toLowerCase();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);

        }
    }

    private String generatePIN(){

        String pin = "";
        for(int i=0; i<4;i++){
            pin += getRandomNumberInRange(0,9);
        }
        return pin;
    }

    private int getRandomNumberInRange(int min, int max){

        if(min>max){
           throw new IllegalArgumentException("max must be greater than min");
        }

        Random r = new Random();
        return r.nextInt((max-min)+1)+min;
    }
}
