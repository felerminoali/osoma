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

public class RoleTest {

    @Test
    public void getRoleId() {
        Role role = new Role();
        role.setRoleId(1);
        assertEquals(1,role.getRoleId());
    }

    @Test
    public void getRole() {
        Role role = new Role();
        role.setRole("accounting");
        assertEquals(role.getRole(),"accounting");
    }
}
