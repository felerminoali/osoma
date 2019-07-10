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

public class AdminTest {

    @Test
    public void getId() {
        Admin admin = new Admin();

        admin.setId(1);

        Integer id = 1;
        Integer idd = admin.getId();

        assertEquals(id,idd);
    }

    @Test
    public void admin(){
        Integer id = 12;
        Admin admin = new Admin(id);
        assertFalse(admin.equals(new Admin()));
    }

    @Test
    public void admin1(){
        String firstName = "joao";
        String lastName = "jose";
        String email = "jj@gmail.com";
        String password = "****++++123";

        Integer id = 12;

        Admin admin = new Admin(id,firstName,lastName,email,password);

        assertFalse(admin.equals(new Admin()));
    }


    @Test
    public void setId() {
        long id = 2;
        Admin admin = new Admin();
        admin.setId((int)id);

        assertEquals((long)admin.getId(),id);
    }

    @Test
    public void getFirstName() {
        Admin admin = new Admin();
        admin.setFirstName("joel");
        assertEquals("joel",admin.getFirstName().toLowerCase());
    }

    @Test
    public void setFirstName() {
        Admin admin = new Admin();
        admin.setFirstName("joel");
        assertEquals("joel",admin.getFirstName());
    }


    @Test
    public void getLastName() {
        Admin admin = new Admin();
        admin.setLastName("joel");
        assertEquals("joel",admin.getLastName());
    }

    @Test
    public void setLastName() {
        Admin admin = new Admin();
        admin.setLastName("joel");
        assertEquals("joel",admin.getLastName());
    }

    @Test
    public void getEmail() {
        Admin admin = new Admin();
        admin.setEmail("egimo@unilurio.ac.mz");
        assertEquals("egimo@unilurio.ac.mz",admin.getEmail());
    }

    @Test
    public void setEmail() {
        Admin admin = new Admin();
        admin.setEmail("egimo@unilurio.ac.mz");
        assertEquals(admin.getEmail(),"egimo@unilurio.ac.mz");
    }

    @Test
    public void getPassword() {
        Admin admin = new Admin();
        admin.setPassword("eltongimo");

        assertEquals("eltongimo",admin.getPassword());
    }

    @Test
    public void setPassword() {
        Admin admin = new Admin();

        admin.setPassword("eltongimo");
        assertEquals("eltongimo",admin.getPassword());
    }

    @Test
    public void equals1() {
        Integer id = 12;
        Admin admin = new Admin(id);
        assertFalse(admin.equals(new Countries()));
        assertTrue(admin.equals(new Admin(id)));
        assertFalse(admin.equals(new Countries()));
        admin.setId(null);
        assertFalse(admin.equals(new Countries(id)));
    }

    @Test
    public void hashCode1() {
        Integer id = 1;
        String name = "South Africa";
        Admin admin = new Admin(id);
        assertNotEquals(admin.hashCode(),0);
    }

    @Test
    public void toString1() {
        Integer id = 12;
        Admin admin = new Admin(id);
        assertNotEquals(admin.toString(),"");
        assertNotEquals(admin.toString(),null);
        assertEquals(admin.toString(),"model.Admin[ id=" + admin.getId() + " ]");

    }
}
