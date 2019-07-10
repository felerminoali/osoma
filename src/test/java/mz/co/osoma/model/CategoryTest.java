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
    public void Category(){
        Integer id = 12;
        Category c = new Category((Integer)id);
        assertEquals((long)c.getId(),(long)id);
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
    public void category(){
        Integer id = 12;
        Category category = new Category(id);

        assertFalse(category.equals(new Category()));
        assertTrue(category.equals(new Category(id)));
        assertFalse(category.equals(new Admin()));
        category.setId(null);
        assertFalse(category.equals(new Category(id)));

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
    public void getExamList() {
        Category category = new Category();
        category.setExamList(null);
        assertNull(category.getExamList());
    }

    @Test
    public void toString1(){
        Category category = new Category();
        assertTrue(category.toString().length() > 0 );
    }

    @Test
    public void hashcode(){
        Category category = new Category();
        assertTrue(category.hashCode() == 0);
    }
}
