package mz.co.osoma.model;

import mz.co.osoma.config.HibernateConf;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import javax.jws.soap.SOAPBinding;

import java.sql.Date;

import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)

public class UserTest {
    @Test
    public void getId() {
        User user = new User();
        user.setId(12);
        assertEquals(user.getId(),12);

        assertNotNull(new User(new User()));
    }

    @Test
    public void getEmail() {
        User user = new User();
        user.setEmail("egimo@gmail.com");
        assertEquals("egimo@gmail.com",user.getEmail());
    }


    @Test
    public void getPassword() {
        User user = new User();
        String password = "egimo+++";
        user.setPassword(password);
        assertEquals(password,user.getPassword());
    }


    @Test
    public void getActive() {
        User user  = new User();
        user.setActive(true);
        assertEquals(1,user.getActive());
    }

    @Test
    public void getRoles() {
        User user = new User();
        user.setRoles(null);
        assertNull(user.getRoles());
    }

    @Test
    public void getName() {
        User user = new User();
        user.setName("elton");
        assertEquals("elton",user.getName());
    }

    @Test
    public void getLastName() {
        User user = new User();
        user.setLastName("langa");
        assertEquals("langa",user.getLastName());
    }


    @Test
    public void getHash() {
        User user = new User();
        user.setHash("******+++++");
        assertEquals(user.getHash(),"******+++++");
    }

}
