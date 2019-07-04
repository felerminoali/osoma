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
public class CategoryTest {

    @Test
    public void getId() {
        Category category = new Category();

        category.setId(12);
        assertEquals(12,(long)category.getId());
    }

    @Test
    public void setId() {
        Category category = new Category();

        //  Assert.assertEquals(category.setId(12);
    }

    @Test
    public void getName() {
        Category category = new Category();
        category.setName("elton");
        assertEquals("elton",category.getName());
    }

    @Test
    public void setName() {
    }

    @Test
    public void getCover() {
        Category category = new Category();

        category.setCover("cover");
        assertEquals("cover",category.getCover());
    }

    @Test
    public void setCover() {
    }

    @Test
    public void getImage() {

        Category category = new Category();
        category.setImage("imagem1");

        assertEquals(category.getImage(),"imagem1");

    }

    @Test
    public void setImage() {

    }

    @Test
    public void getExamList() {
        Category category = new Category();
        category.setExamList(null);
        assertNull(category.getExamList());
    }

    @Test
    public void setExamList() {
    }
}