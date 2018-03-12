/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class hbnUtil {

	private static SessionFactory sessionFactory;
	public static SessionFactory getSessionFactory() {
		try {
			Configuration configuration = new Configuration();
			configuration.configure("util/hibernate.cfg.xml");
			org.hibernate.service.ServiceRegistry registry = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties()).build();
			sessionFactory = configuration.buildSessionFactory(registry);
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		return sessionFactory;
	}	
	public static Session openSession() {	
		return sessionFactory.openSession();
	}
}
