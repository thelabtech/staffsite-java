package org.alt60m.fsk2.manager;

import org.alt60m.fsk2.model.Persistent;
import org.alt60m.fsk2.model.Product;
import org.hibernate.SessionFactory;

public class Fsk2Manager {
	private SessionFactory sessionFactory;
	
	public void initialize(){
		Persistent.setSessionFactory(sessionFactory);
	}

	public Product getProduct(int id)
	{
		Product product = new Product(id);
		product.load();
		return product;
	}
	
	
	
	
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
}
