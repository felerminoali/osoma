package mz.co.osoma.config;


import mz.co.osoma.repository.UsersRepository;
import mz.co.osoma.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/")
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@EnableJpaRepositories(basePackageClasses = UsersRepository.class)
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
        .passwordEncoder(getPasswordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http.csrf().disable().authorizeRequests()
                    .antMatchers("**/emprestar/**").authenticated()
                .antMatchers("/js/**").permitAll() // permit JS resources
                .antMatchers("/fonts/**").permitAll() // permit fonts resources
                .antMatchers("/images/**").permitAll() // permit images resources
                .antMatchers("/vendor/**").permitAll() // permit JS resources
                .antMatchers("/css/**").permitAll() // permit CSS resources
                .antMatchers("/assets/**").permitAll() // permit Assets resources
                    .anyRequest().permitAll()
                    .and()
                .formLogin()
                       .loginPage("/login")
                       //  .successForwardUrl("/")
//                        .defaultSuccessUrl("/")
                        .failureUrl("/login?error=true")
//                        .usernameParameter("username")
                .usernameParameter("email")
                        .passwordParameter("password")
                        .permitAll()
                        .and()
                .logout()
                    .permitAll();

    }

    private PasswordEncoder getPasswordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence charSequence) {
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
                return true;
            }
        };
    }
}
