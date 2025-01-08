package com.demo.models;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.demo.entities.Account;
import com.demo.entities.Appointment;

public class AppointmentModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory(); // Lấy đối tượng SessionFactory trong file "hibernate.cfg.xml"
	
	/* Create Appointment */
	public boolean Create(Appointment appointment){
		boolean result = true;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.merge(appointment);
			
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
	
	/* Find By Patient id */
	public List<Appointment> findByPatientId(int patientId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByPatientId.id = :patientId", Appointment.class)
									.setParameter("patientId", patientId)
									.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Find By Faculty id */
	public List<Appointment> findByFacultyId(int facultyId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByDoctorId.faculty.id = :facultyId", Appointment.class)
									.setParameter("facultyId", facultyId)
									.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Find By Doctor id */
	public List<Appointment> findByDoctorId(int doctorId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByDoctorId.id = :doctorId", Appointment.class)
									.setParameter("doctorId", doctorId)
									.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Sort By Newest Date faculty Appointment */
	public List<Appointment> sortByNewestDate_FacultyAppointment(int facultyId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByDoctorId.faculty.id = :facultyId order by date asc ", Appointment.class)
								.setParameter("facultyId", facultyId)	
								.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Sort By Newest Date Doctor Appointment */
	public List<Appointment> sortByNewestDate_DoctorAppointment(int doctorId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByDoctorId.id = :doctorId order by date asc ", Appointment.class)
								.setParameter("doctorId", doctorId)	
								.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Sort By Newest Date Patient Appointment */
	public List<Appointment> sortByNewestDate_PatientAppointment(int patientId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByPatientId.id = :patientId order by date asc ", Appointment.class)
								.setParameter("patientId", patientId)	
								.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Search By Range Date Faculty Appointment */
	public List<Appointment> searchByRangeDate_FacultyAppointment(Date startDate, Date endDate, int facultyId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByDoctorId.faculty.id = :facultyId and date >= :startDate and date <= :endDate ", Appointment.class)
								.setParameter("facultyId", facultyId)	
								.setParameter("startDate", startDate)
								.setParameter("endDate", endDate)
								.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	/* Search By Range Date Doctor Appointment */
	public List<Appointment> searchByRangeDate_DoctorAppointment(Date startDate, Date endDate, int doctorId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByDoctorId.id = :doctorId and date >= :startDate and date <= :endDate ", Appointment.class)
								.setParameter("doctorId", doctorId)	
								.setParameter("startDate", startDate)
								.setParameter("endDate", endDate)
								.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
	
	
	
	/* Search By Range Date Patient Appointment */
	public List<Appointment> searchByRangeDate_PatientAppointment(Date startDate, Date endDate, int patientId){
		List<Appointment> appointments = null;
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			appointments = session.createQuery("from Appointment where accountByPatientId.id = :patientId and date >= :startDate and date <= :endDate ", Appointment.class)
								.setParameter("patientId", patientId)	
								.setParameter("startDate", startDate)
								.setParameter("endDate", endDate)
								.getResultList();			
			
			transaction.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			if(transaction != null) { 
				transaction.rollback();
			}
			appointments = null;
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return appointments;
	}
}
