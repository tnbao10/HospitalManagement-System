package com.demo.models;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.demo.entities.Faculty;

public class FacultyModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	/* Find ALL */
	public List<Faculty> findAll() {

		List<Faculty> faculties = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			faculties = session.createQuery("from Faculty", Faculty.class).getResultList();

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			faculties = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return faculties;
	}
	
	/* Find by Id */
	public Faculty findById(int id) {

		Faculty faculty = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			faculty = session.createQuery("from Faculty where id = :id", Faculty.class)
							.setParameter("id", id)
							.getSingleResult();

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			faculty = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return faculty;
	}
	
	/* Find by Name */
	public Faculty findByName(String name) {

		Faculty faculty = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			faculty = session.createQuery("from Faculty where name = :name", Faculty.class)
							.setParameter("name", name)
							.getSingleResult();

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			faculty = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return faculty;
	}
	
	/* Search By Faculty Name */
	public List<Faculty> searchByFacultyName(String name) {

		List<Faculty> faculties = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			faculties = session.createQuery("from Faculty where name like :name", Faculty.class)
							.setParameter("name", "%"+name+"%")
							.getResultList();

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			faculties = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return faculties;
	}
	
	/* Count Faculty */
	public Long countFaculty() {

		Long  result = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			/* Long.class: thông báo kết quả trả về thuộc kiểu Long*/
			result = session.createQuery("select count(id) from Faculty", Long.class)
							.getSingleResult();	

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			result = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
	
	/* Count Doctor */
	public Long countDoctor() {

		Long  result = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			/* Long.class: thông báo kết quả trả về thuộc kiểu Long*/
			result = session.createQuery("select count(id) from Account where role.id = 2", Long.class)
							.getSingleResult();	

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			result = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
	
	/* Count Patient */
	public Long countPatient() {

		Long  result = null;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			/* Long.class: thông báo kết quả trả về thuộc kiểu Long*/
			result = session.createQuery("select count(id) from Account where role.id = 3", Long.class)
							.getSingleResult();	

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			result = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}


	/* Add */
	public boolean Create(Faculty faculty) {

		boolean result = true;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			session.persist(faculty);

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
	
	/* Remove */
	public boolean Delete(Faculty faculty) {

		boolean result = true;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			session.remove(faculty);

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
	
	/* Update */
	public boolean Update(Faculty faculty) {

		boolean result = true;

		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			session.merge(faculty);

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
			result = false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
}
