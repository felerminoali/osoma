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

public class CountriesTest {

    @Test
    public void getId() {
        Countries countries = new Countries();
        Integer id = 12;
        countries.setId(id);
        assertEquals(countries.getId(),id);
    }


    @Test
    public void getName() {
        String name = "South Africa";
        Countries countries = new Countries();
        countries.setName(name);
        assertEquals(countries.getName(),name);
    }


    @Test
    public void getCode() {
        String code = "SA";
        Countries countries = new Countries();
        countries.setCode(code);
        assertEquals(countries.getCode(),code);
    }


    @Test
    public void hashCode1(){
        Integer id = 1;
        String name = "South Africa";
        Countries countries = new Countries(id,name);
        assertNotEquals(countries.hashCode(),0);
    }

    @Test
    public void equals1() {
        Integer id = 12;
        Countries countries = new Countries(id);

        assertFalse(countries.equals(new Countries()));
        assertTrue(countries.equals(new Countries(id)));
        assertFalse(countries.equals(new Admin()));
        countries.setId(null);
        assertFalse(countries.equals(new Countries(id)));

    }

    @Test
    public void toString1() {
        Integer id = 12;
        Countries countries = new Countries(id);
        assertNotEquals(countries.toString(),"");
        assertNotEquals(countries.toString(),null);
        assertEquals(countries.toString(),"mz.co.osoma.model.Countries[ id=" + countries.getId() + " ]");

    }
}
