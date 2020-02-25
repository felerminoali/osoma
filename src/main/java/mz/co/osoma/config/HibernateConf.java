package mz.co.osoma.config;

import mz.co.osoma.service.CRUDService;
import mz.co.osoma.service.CRUDServiceImpl;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

@Configuration
@EnableTransactionManagement
@ComponentScan("mz.co.osoma")
@EnableAutoConfiguration(exclude = HibernateJpaAutoConfiguration.class)
public class HibernateConf {

    @Bean(name = "entityManagerFactory")
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan("mz.co.osoma.model");
        sessionFactory.setHibernateProperties(hibernateProperties());

        return sessionFactory;
    }

    @Bean
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

       dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

        dataSource.setUrl("jdbc:mysql://localhost:3306/osoma");
        dataSource.setUsername("root");
        dataSource.setPassword("root");

//        dataSource.setUrl("jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_9a0deeafda252b2");
//        dataSource.setUsername("bfaa4dbfc34090");
//        dataSource.setPassword("637b79e7");

        // heroku: felermino@outlook.com
//        dataSource.setUrl("jdbc:mysql://us-mm-dca-b7add399344a.g5.cleardb.net:3306/heroku_c7035568cd423c2");
//        dataSource.setUsername("b8b80c31776c4a");
//        dataSource.setPassword("28db730f");

//        dataSource.setUrl("jdbc:mysql://us-cdbr-iron-east-04.cleardb.net:3306/heroku_ad4ebfd03e7bde2");
//        dataSource.setUsername("b4dde9c8e245fd");
//        dataSource.setPassword("bea87dec");
//

        return dataSource;
    }

    @Bean(name = "transactionManager")
    public PlatformTransactionManager hibernateTransactionManager() {
        HibernateTransactionManager transactionManager
                = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory().getObject());
        return transactionManager;
    }

    private final Properties hibernateProperties() {
        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hibernateProperties.setProperty("hibernate.show_sql", "true");
        hibernateProperties.setProperty("hibernate.jdbc.lob.non_contextual_creation", "true");
        hibernateProperties.setProperty("hibernate.format_sql", "true");
        hibernateProperties.setProperty("hibernate.enable_lazy_load_no_trans", "true");
        hibernateProperties.setProperty("hibernate.use_sql_comments", "true");
        hibernateProperties.setProperty("hibernate.zeroDateTimeBehavior", "convertToNull");

        return hibernateProperties;
    }

    @Bean
    public CRUDService CRUDService() {
        return new CRUDServiceImpl();
    }

}
