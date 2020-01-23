package mz.co.osoma.controller;

import mz.co.osoma.model.CustomUserDetails;
import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.CustomUserDetailsService;
import mz.co.osoma.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.security.util.Password;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
public class LoginController {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CustomUserDetailsService userDetailsService;


    @Resource(name = "authenticationManager")
    private AuthenticationManager authManager;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGet() {
        return "login";

    }


    @RequestMapping(value = "/codelogin", method = RequestMethod.POST)
    public ModelAndView loginPost(@RequestParam("pin") final String pin, final HttpServletRequest request) {


        Map<String, Object> par = new HashMap<String, Object>();
        par.put("preRegistationCode", pin);
        User user = crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.preRegistationCode = :preRegistationCode ", par);

        if (user == null) {
            return new ModelAndView("redirect:" + "/login?error=true");
        }

        final Authentication auth = new UsernamePasswordAuthenticationToken(userDetailsService.loadUserByUsername(user.getEmail()), null, new CustomUserDetails(user).getAuthorities());
        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(auth);

        HttpSession session = request.getSession(true);
        session.setAttribute("SPRING_SECURITY_CONTEXT", sc);

        return new ModelAndView("redirect:" + "/ubs/");
    }


    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public ModelAndView forgotGET() {
        ModelAndView model = new ModelAndView("forgotPassword");
        return model;
    }

    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public ModelAndView forgotPOST(ModelAndView modelAndView, @RequestParam("email") String email, HttpServletRequest request) {


        // Lookup user in database by e-mail
        Map<String, Object> par = new HashMap<String, Object>();
        par.put("email", email);
        Optional<User> optional = Optional.ofNullable(crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = :email", par));

        if (!optional.isPresent()) {
            modelAndView.addObject("errorMessage", "Não encontramos nenhuma conta com o email fornecido.");
        } else {

            // Generate random 36-character string token for reset password
            User user = optional.get();
            user.setResetToken(UUID.randomUUID().toString());

            // Save token to database
            crudService.update(user);

//            String appUrl = request.getScheme() + "://" + request.getServerName();
            String appUrl = request.getScheme() + "://" + "www.osoma.edu.mz";

            // Email message
            SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
            passwordResetEmail.setFrom("osoma.mz@gmail.com");
            passwordResetEmail.setTo(user.getEmail());
//            passwordResetEmail.setTo("felerminoali@gmail.com");
            passwordResetEmail.setSubject("Requisição de redifinição de senha");
            passwordResetEmail.setText("Clique o link abaixo para poder redifinir sua senha:\n" + appUrl
                    + "/reset?token=" + user.getResetToken());

            emailService.sendEmail(passwordResetEmail);

            System.out.println("URL: " + appUrl);
            // Add success message to view
            modelAndView.addObject("successMessage", "Um link para resetar o sua palavra-passe foi enviada para o email: " + user.getEmail());

        }

        modelAndView.setViewName("forgotPassword");
        return modelAndView;
    }

    @RequestMapping(value = "/reset", method = RequestMethod.GET)
    public ModelAndView resetGET(ModelAndView modelAndView, @RequestParam("token") String token) {
//        ModelAndView model = new ModelAndView("resetPassword");

        Map<String, Object> par = new HashMap<String, Object>();
        par.put("token", token);
        Optional<User> user = Optional.ofNullable(crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.resetToken = :token", par));

        if (user.isPresent()) { // Token found in DB
            modelAndView.addObject("resetToken", token);
        } else { // Token not found in DB
            modelAndView.addObject("errorMessage", "Oops!  Este é um link inválido para redifinir password.");
        }

        modelAndView.setViewName("resetPassword");
        return modelAndView;
    }


    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public ModelAndView resetPOST(ModelAndView modelAndView, @RequestParam Map<String, String> requestParams, RedirectAttributes redir) {


        // Find the user associated with the reset token
        Map<String, Object> par = new HashMap<String, Object>();
        par.put("token", requestParams.get("token"));
        Optional<User> user = Optional.ofNullable(crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.resetToken = :token", par));


        // This should always be non-null but we check just in case
        if (user.isPresent()) {

            User resetUser = user.get();

            // Set new password
            resetUser.setPassword(passwordEncoder.encode(requestParams.get("password")));

            // Set the reset token to null so it cannot be used again
            resetUser.setResetToken(null);

            // Save user
            crudService.update(resetUser);

            // In order to set a model attribute on a redirect, we must use
            // RedirectAttributes
            redir.addFlashAttribute("successMessage", "Modificou a sua senha com sucesso.  Agora pode entrar no sistema.");

            modelAndView.setViewName("redirect:login");
            return modelAndView;

        } else {
            modelAndView.addObject("errorMessage", "Oops!  Este é um link inválido para redifinir senha.");
            modelAndView.setViewName("resetPassword");
        }

        return modelAndView;

    }


}
