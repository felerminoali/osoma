package mz.co.osoma.service;

import mz.co.osoma.config.HibernateConf;
import mz.co.osoma.model.Exam;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;


@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)
public class CRUDServiceImplTest {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Test
    public void getAll() {
        CRUDServiceImpl crudService=new CRUDServiceImpl();
       // crudService.getAll(Exam.class);

    }

    @Test
    public void getAllQuery() {
    }

    @Test
    public void save() {
    }

    @Test
    public void refresh() {
    }

    @Test
    public void saves() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void deletes() {
    }

    @Test
    public void lock() {
    }
}