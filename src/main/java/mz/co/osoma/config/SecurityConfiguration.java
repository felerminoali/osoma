package mz.co.osoma.config;


import mz.co.osoma.repository.UsersRepository;
import mz.co.osoma.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thymeleaf.extras.springsecurity5.dialect.SpringSecurityDialect;


@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@EnableJpaRepositories(basePackageClasses = UsersRepository.class)
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Autowired
    private AccessDeniedHandler accessDeniedHandler;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(getPasswordEncoder());
    }


    @Bean
    public PasswordEncoder getPasswordEncoder() {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
        .csrf().disable()
                .authorizeRequests()
                .antMatchers( "/admin","/", "/mod/save_answer", "/districts/*", "/users/**", "/", "/register/**", "/ubs/*").permitAll()
                .antMatchers("/js/**").permitAll() // permit JS resources
                .antMatchers("/fonts/**").permitAll() // permit fonts resources
                .antMatchers("/images/**").permitAll() // permit images resources
                .antMatchers("/vendor/**").permitAll() // permit JS resources
                .antMatchers("/css/**").permitAll() // permit CSS resources
                .antMatchers("/assets/**").permitAll() // permit Assets resources
                .antMatchers("/resources/**").permitAll() // permit Assets resources
                .anyRequest().fullyAuthenticated()
                .and()
                .httpBasic()
                .and()
                .formLogin()
                    .successHandler(new MySimpleUrlAuthenticationSuccessHandler())
                    .loginPage("/login")
                        .defaultSuccessUrl("/ubs/")
                    .failureUrl("/login?error=true")
                        .usernameParameter("username")
                    .passwordParameter("password")
                .permitAll()
                .and()
                    .logout().permitAll()
                    .and()

                .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
    }


    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }

    @Bean("authenticationManager")
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher(){
        return new HttpSessionEventPublisher();
    }

}
