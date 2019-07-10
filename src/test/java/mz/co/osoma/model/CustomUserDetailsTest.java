package mz.co.osoma.model;

import mz.co.osoma.config.HibernateConf;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)

public class CustomUserDetailsTest {

    User user = new User();
    CustomUserDetails customUserDetails = new CustomUserDetails(user);

  /*  @Test
    public void  getPassword() {

        String password = "1234";
        assertEquals(password, customUserDetails.getPassword());
    }

    @Test
    public void getUsername() {
        String name = "felermino";

        assertEquals(name, customUserDetails.getUsername());

       // assertEquals("felermino", customUserDetails.getUsername());
    }

    @Test
    public void getEmail(){
        String email = "felerminoali@gmail.com";
        assertEquals(email, customUserDetails.getEmail());
    }*/

    @Test
    public void isAccountNonExpired() {

        assertEquals(true, customUserDetails.isAccountNonExpired());
    }

    @Test
    public void isAccountNonLocked() {

        assertEquals(true, customUserDetails.isAccountNonLocked());
    }

    @Test
    public void isCredentialsNonExpired() {

        assertEquals(true, customUserDetails.isCredentialsNonExpired());
    }

    @Test
    public void isEnabled() {

        assertEquals(true, customUserDetails.isEnabled());
    }
}
