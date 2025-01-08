package com.demo.models;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.demo.entities.Role;

public class RoleModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory(); // Lấy đối tượng SessionFactory trong file "hibernate.cfg.xml"

	public List<Role> findAll(){
		List<Role> roles = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			roles = session.createQuery("from Role", Role.class).getResultList();
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			roles = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return roles;
	}
	
	public Role findById(int id){
		Role role = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			role = session.createQuery("from Role where id = :id", Role.class)
							.setParameter("id",id)
							.getSingleResult();
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			role = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return role;
	}
}
