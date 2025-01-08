package com.demo.servlets.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.demo.entities.Account;
import com.demo.helpers.UploadHelper;
import com.demo.models.AccountModel;
import com.demo.models.AppointmentModel;

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
@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DoctorServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_DoctorMedicalAppointment(request, response);
		}else if(action.equalsIgnoreCase("profile")) {
			doGet_Profile(request, response);
		}else if(action.equalsIgnoreCase("edit-profile")) {
			doGet_EditProfile(request, response);
		}else if(action.equalsIgnoreCase("sort-by-newest-doctor-appointment")) {
			doGet_SortByNewestDoctorAppointment(request, response);
		}else if(action.equalsIgnoreCase("search-by-dates-doctor-appointment")) {
			doGet_SearchByRangeDatesDoctorAppointment(request, response);
		}	
	}
	
	protected void doGet_DoctorMedicalAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getSession().getAttribute("email").toString();
		AccountModel accountModel = new AccountModel();
		Account doctor = accountModel.findByEmail(email);
		
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.findByDoctorId(doctor.getId()));
		request.setAttribute("doctorName", doctor.getFullName());
		request.setAttribute("doctorId", doctor.getId());

		
		request.getRequestDispatcher("WEB-INF/views/user/doctor/doctorMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_SortByNewestDoctorAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.sortByNewestDate_DoctorAppointment(doctorId));
		request.setAttribute("doctorId", doctorId);

		request.getRequestDispatcher("WEB-INF/views/user/doctor/doctorMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByRangeDatesDoctorAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int doctorId = Integer.parseInt(request.getParameter("doctorId"));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			if(startDate == null || endDate == null || startDate.isEmpty() || endDate.isEmpty()) {
				response.sendRedirect("doctor?doctorId=" + doctorId);
				return;
			}
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date from = simpleDateFormat.parse(startDate);
			Date to = simpleDateFormat.parse(endDate);
			
			AppointmentModel appointModel = new AppointmentModel();
			request.setAttribute("appointments", appointModel.searchByRangeDate_DoctorAppointment(from,to,doctorId));
			request.setAttribute("doctorId", doctorId);

			request.getRequestDispatcher("WEB-INF/views/user/doctor/doctorMedicalAppointment.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}	
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
		
		request.getRequestDispatcher("WEB-INF/views/user/doctor/profile.jsp").forward(request, response);
	}
	
	protected void doGet_EditProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getSession().getAttribute("email").toString();
		
		AccountModel accountModel = new AccountModel();
		request.setAttribute("account", accountModel.findByEmail(email));
		
		request.getRequestDispatcher("WEB-INF/views/user/doctor/profileEdit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("edit-profile")) {
			doPost_EditProfile(request, response);
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
			if (email != null && !email.trim().isEmpty()) {
				account.setEmail(email);
			}

			if (fullName != null && !fullName.trim().isEmpty()) {
				account.setFullName(fullName);
			}

			if (phone != null && !phone.trim().isEmpty()) {
				account.setPhone(phone);
			}

			if (address != null && !address.trim().isEmpty()) {
				account.setAddress(address);
			}

			if (dob != null && !dob.trim().isEmpty()) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				account.setDob(simpleDateFormat.parse(dob));
			}

			if (description != null && !description.trim().isEmpty()) {
				account.setDescription(description);
			}

			Part file = request.getPart("file");
			if (file != null && file.getSize() > 0) {
				String filename = UploadHelper.uploadFile("assets/images/widget", request, file);
				account.setPhoto(filename);
				request.getSession().setAttribute("photo", filename);

			}

			/* Update */
			boolean result = accountModel.Update(account);

			if (result) {
				request.getSession().setAttribute("email", email);
				request.getSession().setAttribute("fullName", fullName);

				response.sendRedirect("doctor?action=profile&msgEditSuccess=Update Profile Successfully");
			} else {
				response.sendRedirect("doctor?action=profile&msgEditFailed=Update Profile Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
