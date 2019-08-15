package mz.co.osoma.controller;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
public class RestModules {


    @RequestMapping(value = "/mod/save_answer", method = RequestMethod.POST)
    public @ResponseBody String add(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

        String qid = request.getParameter("qid");
        String answerid = request.getParameter("answerid");

        session.setAttribute(qid, answerid);

        return "Done";
    }
}
