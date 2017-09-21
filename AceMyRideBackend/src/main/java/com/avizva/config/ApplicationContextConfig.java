package com.avizva.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 
 * Application configuration for creating system beans
 * 
 * @author Pratyaksh Kumar
 *
 */

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages = "com.avizva")
public class ApplicationContextConfig {

	/**
	 * Method to create dataSource bean
	 * 
	 * @return DataSource return the dataSource bean
	 */

	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/AceMyRide");
		dataSource.setUsername("root");
		dataSource.setPassword("12345678");

		return dataSource;
	}

	/**
	 * Method to get properties required for creating SessionFactory bean
	 * 
	 * @return Properties returns properties required for creating
	 *         SessionFactory bean
	 */
	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;

	}

	/**
	 * Method to create sessionFactory bean
	 * 
	 * @param dataSource
	 *            the dataSource bean
	 * @return SessionFactory returns sessionFactory bean
	 */
	@Autowired
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource) {

		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.scanPackages("com.avizva.model");
		return sessionBuilder.buildSessionFactory();
	}

	/**
	 * Method to create transactionManager bean
	 * 
	 * @param sessionFactory
	 *            the sessionFactory bean
	 * @return HibernateTransactionManager returns sessionFactory bean
	 */
	@Autowired
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}

	/**
	 * Method to create the MailSender bean
	 * 
	 * @return JavaMailSender the mailSender bean
	 */
	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("contact.acemyride@gmail.com");
		mailSender.setPassword("#acemyride2017");
		Properties properties = mailSender.getJavaMailProperties();
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.debug", "false");
		return mailSender;
	}
	
	

}
