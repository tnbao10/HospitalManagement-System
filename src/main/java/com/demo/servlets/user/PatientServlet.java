package com.demo.servlets.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.demo.entities.Account;
import com.demo.entities.Appointment;
import com.demo.entities.Faculty;
import com.demo.helpers.UploadHelper;
import com.demo.models.AccountModel;
import com.demo.models.AppointmentModel;
import com.demo.models.FacultyModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;

/* Cấu hình để Upload File*/
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5, // 5MB
		maxRequestSize = 1024 * 1024 * 10, // 10MB
		fileSizeThreshold = 1024 * 1024 * 10 // 10MB
)
@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public PatientServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_FacultyList(request, response);
		}else if(action.equalsIgnoreCase("faculty-doctor-list")) {
			doGet_FacultyDoctorList(request, response);			
		}else if(action.equalsIgnoreCase("profile")) {
			doGet_Profile(request,response);
		}else if(action.equalsIgnoreCase("edit-profile")) {
			doGet_EditProfile(request,response);
		}else if(action.equalsIgnoreCase("make-appointment")) {
			doGet_MakeAppointment(request, response);
		}else if(action.equalsIgnoreCase("medical-history")) {
			doGet_MedicalHistory(request, response);
		}
	}
	
	protected void doGet_FacultyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculties", facultyModel.findAll());
		
		request.getRequestDispatcher("WEB-INF/views/user/patient/facultyList.jsp").forward(request, response);
	}

	protected void doGet_FacultyDoctorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		String facultyName = request.getParameter("facultyName");
		AccountModel accountModel = new AccountModel();
		request.setAttribute("doctors", accountModel.findDoctorByFacultyId(facultyId));
		request.setAttribute("facultyName", facultyName);

		
		request.getRequestDispatcher("WEB-INF/views/user/patient/facultyDoctorList.jsp").forward(request, response);

	}
	
	protected void doGet_Profile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getSession().getAttribute("email").toString();
		
		AccountModel accountModel = new AccountModel();
		request.setAttribute("account", accountModel.findByEmail(email));
		
		/* Từ doPost_EditProfile*/
		String msgEditSuccess = request.getParameter("msgEditSuccess");
		String msgEditFailed = request.getParameter("msgEditFailed");
		request.setAttribute("msgEditSuccess", msgEditSuccess);
		request.setAttribute("msgEditFailed", msgEditFailed);
		
		request.getRequestDispatcher("WEB-INF/views/user/patient/profile.jsp").forward(request, response);
	}
	
	protected void doGet_MakeAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculties", facultyModel.findAll());

		AccountModel accountModel = new AccountModel();
		request.setAttribute("doctors", accountModel.findAllDoctor());
		
		/* Từ doPost_MakeAppointment*/
		String msgCreateSuccess = request.getParameter("msgCreateSuccess");
		String msgCteateFailed = request.getParameter("msgCteateFailed");
		request.setAttribute("msgCreateSuccess", msgCreateSuccess);
		request.setAttribute("msgCteateFailed", msgCteateFailed);
		
		request.getRequestDispatcher("WEB-INF/views/user/patient/makeAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_EditProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getSession().getAttribute("email").toString();
		
		AccountModel accountModel = new AccountModel();
		request.setAttribute("account", accountModel.findByEmail(email));
		
		request.getRequestDispatcher("WEB-INF/views/user/patient/profileEdit.jsp").forward(request, response);
	}
	
	protected void doGet_MedicalHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getSession().getAttribute("email").toString();
		AccountModel accountModel = new AccountModel();
		Account account = accountModel.findByEmail(email);
		
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.findByPatientId(account.getId()));
		
		request.getRequestDispatcher("WEB-INF/views/user/patient/medicalHistory.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("edit-profile")) {
			doPost_EditProfile(request, response);
		}else if(action.equalsIgnoreCase("make-appointment")) {
			doPost_MakeAppointment(request, response);

		}
	}
	
	protected void doPost_EditProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String email = request.getParameter("email");
		
			String fullName = request.getParameter("fullName");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String dob = request.getParameter("dob");
			String description = request.getParameter("description");
			
			AccountModel accountModel = new AccountModel();
			Account account = accountModel.findById(id);
			if(email != null && !email.trim().isEmpty()) {
				account.setEmail(email);
			}
			
			if(fullName != null && !fullName.trim().isEmpty()) {
				account.setFullName(fullName);
			}
			
			if(phone != null && !phone.trim().isEmpty()) {
				account.setPhone(phone);
			}
			
			if(address != null && !address.trim().isEmpty()) {
				account.setAddress(address);
			}
			
			if(dob != null && !dob.trim().isEmpty()) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				account.setDob(simpleDateFormat.parse(dob));
			}
			
			if(description != null && !description.trim().isEmpty()) {
				account.setDescription(description);
			}
			
			Part file = request.getPart("file");
			if(file != null && file.getSize() > 0) {
				String filename = UploadHelper.uploadFile("assets/images/widget", request, file);
				account.setPhoto(filename);
				request.getSession().setAttribute("photo", filename);
			}
			
			/* Update */
			boolean result = accountModel.Update(account);
			
			if(result) {
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("fullName", fullName);
					
				response.sendRedirect("patient?action=profile&msgEditSuccess=Update Profile Successfully");
			}else {
				response.sendRedirect("patient?action=profile&msgEditFailed=Update Profile Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost_MakeAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getSession().getAttribute("email").toString();
			String doctorId = request.getParameter("doctorId");
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String content = request.getParameter("content");

			if(doctorId == null || doctorId.trim().isEmpty()) {
				response.sendRedirect("patient?action=make-appointment&msgDoctorNull=Please choose a doctor");
				return;
			}
			if(date == null || date.isEmpty()) {
				response.sendRedirect("patient?action=make-appointment&msgDateNull=Please choose date");
				return;
			}
			if(time == null || time.isEmpty()) {
				response.sendRedirect("patient?action=make-appointment&msgTimeNull=Please choose time");
				return;
			}
			
			/* Lấy ra đối tượng Patient */
			AccountModel accountModel = new AccountModel();
			Account patient = accountModel.findByEmail(email);
			
			/* Lấy ra đối tượng Doctor */
			int doctor_Id = Integer.parseInt(doctorId);
			AccountModel acocuntModel = new AccountModel();
			Account doctor = acocuntModel.findById(doctor_Id);
			
			/* Date vs Time */
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");
			Date dateFormat = dateFormatter.parse(date);
			Date timeFormat = timeFormatter.parse(time);
			
			
			/* Khởi tạo đối tượng appointment*/
			Appointment appointment = new Appointment();
			appointment.setAccountByDoctorId(doctor);
			appointment.setAccountByPatientId(patient);
			appointment.setDate(dateFormat);
			appointment.setTime(timeFormat);
			appointment.setContent(content);
			
			/* Create Appoint */
			AppointmentModel appointModel = new AppointmentModel();
			boolean result = appointModel.Create(appointment);
			
			if(result) {
				response.sendRedirect("patient?action=make-appointment&msgCreateSuccess=Make An Appointment Successfully");
			}else {
				response.sendRedirect("patient?action=make-appointment&msgCreateFailed=Make An Appointment Failed");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
