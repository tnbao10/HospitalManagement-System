package com.demo.models;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Account;
import com.demo.entities.Role;

public class AccountModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory(); // Lấy đối tượng SessionFactory trong file "hibernate.cfg.xml"

	/* Login */
	public boolean login(String email, String password){
		boolean isAuthenticated = false;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			Account account = session.createQuery("from Account where email = :email", Account.class)
									.setParameter("email", email)
									.getSingleResult();
			
			if(account != null) {
				if(BCrypt.checkpw(password, account.getPassword())) {
					isAuthenticated = true;
				}
			}
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			isAuthenticated = false;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return isAuthenticated;
	}
	
	/* Find All*/
	public List<Account> findAll(){
		List<Account> accounts = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			accounts = session.createQuery("from Account", Account.class)
								.getResultList();
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			accounts = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return accounts;
	}
	
	/* Find by Id*/
	public Account findById(int id){
		Account account = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			account = session.createQuery("from Account where id = :id", Account.class)
								.setParameter("id", id)
								.getSingleResult();
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			account = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return account;
	}
	
	/* Find By Email */
	public Account findByEmail(String email){
		Account account = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			account = session.createQuery("from Account where email = :email", Account.class)
									.setParameter("email", email)
									.getSingleResult();
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			account = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return account;
	}
	
	/* Find All Doctor*/
	public List<Account> findAllDoctor(){
		List<Account> accounts = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			accounts = session.createQuery("from Account where role.id = 2", Account.class)
									.getResultList();
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			accounts = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return accounts;
	}
	
	/* Find All patient*/
	public List<Account> findAllPatient(){
		List<Account> accounts = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			accounts = session.createQuery("from Account where role.id = 3", Account.class)
									.getResultList();
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			accounts = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return accounts;
	}
	
	/* Search By Doctor Name*/
	public List<Account> searchByDoctorName(String doctorName){
		List<Account> accounts = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			accounts = session.createQuery("from Account where fullName like :doctorName and role.id = 2", Account.class)
									.setParameter("doctorName", "%"+doctorName+"%")
									.getResultList();
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			accounts = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return accounts;
	}
	
	/* Search By Patient Name*/
	public List<Account> searchByPatientName(String patientName){
		List<Account> accounts = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			accounts = session.createQuery("from Account where fullName like :patientName and role.id = 3", Account.class)
									.setParameter("patientName", "%"+patientName+"%")
									.getResultList();
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			accounts = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return accounts;
	}
	
	
	
	/* Create */
	public boolean Create(Account account){
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.persist(account);
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			result = false;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return result;
	}
	
	/* Find All patient*/
	public List<Account> findDoctorByFacultyId(int facultyId){
		List<Account> accounts = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			accounts = session.createQuery("from Account where role.id = 2 and faculty.id = :facultyId", Account.class)
								.setParameter("facultyId", facultyId)	
								.getResultList();
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			accounts = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return accounts;
	}
	
	
	/* Delete */
	public boolean Delete(Account account){
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.remove(account);
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			result = false;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return result;
	}
	
	/* Update */
	public boolean Update(Account account){
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.merge(account);
			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			result = false;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return result;
	}
}
