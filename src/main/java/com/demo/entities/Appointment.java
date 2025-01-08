package com.demo.entities;
// Generated Jan 1, 2025, 10:28:01 PM by Hibernate Tools 4.3.6.Final

import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import static jakarta.persistence.GenerationType.IDENTITY;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/**
 * Appointment generated by hbm2java
 */
@Entity
@Table(name = "appointment")
public class Appointment implements java.io.Serializable {

	private Integer id;
	private Account accountByDoctorId;
	private Account accountByPatientId;
	private Date date;
	private Date time;
	private String content;

	public Appointment() {
	}

	public Appointment(Account accountByDoctorId, Account accountByPatientId, Date date, Date time, String content) {
		this.accountByDoctorId = accountByDoctorId;
		this.accountByPatientId = accountByPatientId;
		this.date = date;
		this.time = time;
		this.content = content;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "Id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DoctorId", nullable = false)
	public Account getAccountByDoctorId() {
		return this.accountByDoctorId;
	}

	public void setAccountByDoctorId(Account accountByDoctorId) {
		this.accountByDoctorId = accountByDoctorId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PatientId", nullable = false)
	public Account getAccountByPatientId() {
		return this.accountByPatientId;
	}

	public void setAccountByPatientId(Account accountByPatientId) {
		this.accountByPatientId = accountByPatientId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "Date", nullable = false, length = 10)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Time", nullable = false, length = 26)
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "Content", nullable = false, length = 500)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}