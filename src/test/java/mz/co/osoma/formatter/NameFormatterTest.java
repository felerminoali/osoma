package mz.co.osoma.formatter;

import mz.co.osoma.config.HibernateConf;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.ParseException;
import java.util.Locale;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@ContextConfiguration(classes = HibernateConf.class)
public class NameFormatterTest {

    @Test
    public void print() {
        Locale locale=null;
        String input="salama cara";

        NameFormatter nameFormatter=new NameFormatter();

        Assert.assertNotNull(nameFormatter.print(input,locale));
    }

    @Test
    public void parse() throws ParseException {
        Locale locale=null;
        String input="salama cara";

        NameFormatter nameFormatter=new NameFormatter();
        Assert.assertNotNull(nameFormatter.parse(input,locale));
    }
}