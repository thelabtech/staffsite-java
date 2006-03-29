package org.alt60m.fsk2.model;

import java.io.Serializable;
import java.sql.SQLException;

import javax.persistence.*;

import org.hibernate.CallbackException;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Lifecycle;
import org.hibernate.classic.Validatable;
import org.hibernate.classic.ValidationFailure;

@MappedSuperclass
public abstract class Persistent implements Lifecycle, Validatable, Serializable {

	private static SessionFactory sessionFactory;
	
	private Integer id;
	private Integer version;

	@Id
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Version
	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Integer persist() throws HibernateException {
		sessionFactory.getCurrentSession().saveOrUpdate(this);
		return id;
	}

	public void delete() throws HibernateException {
		sessionFactory.getCurrentSession().delete(this);
	}

	public void load() throws HibernateException {
		sessionFactory.getCurrentSession().load(this, id);
	}

	public boolean onSave(Session s) throws CallbackException {
		return NO_VETO;
	}

	public boolean onDelete(Session s) throws CallbackException {
		return NO_VETO;
	}

	public boolean onUpdate(Session s) throws CallbackException {
		return NO_VETO;
	}

	public void onLoad(Session s, Serializable id) {
	}
	
	public void validate() throws ValidationFailure {
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void setSessionFactory(SessionFactory sessionFactory) {
		Persistent.sessionFactory = sessionFactory;
	}
}