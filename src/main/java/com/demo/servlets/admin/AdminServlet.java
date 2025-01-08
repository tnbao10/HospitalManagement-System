package com.demo.servlets.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Account;
import com.demo.entities.Faculty;
import com.demo.entities.Role;
import com.demo.helpers.UploadHelper;
import com.demo.models.AccountModel;
import com.demo.models.AppointmentModel;
import com.demo.models.FacultyModel;
import com.demo.models.RoleModel;

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

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public AdminServlet() {
    	
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		}else if(action.equalsIgnoreCase("faculty-list")) {
			doGet_FacultyList(request, response);
		}else if(action.equalsIgnoreCase("delete-faculty")) {
			doGet_DeleteFaculty(request, response);
		}else if(action.equalsIgnoreCase("edit-faculty")) {
			doGet_EditFaculty(request, response);
		}else if(action.equalsIgnoreCase("faculty-medical-appointment")) {
			doGet_FacultyMedicalAppointment(request, response);
		}else if(action.equalsIgnoreCase("doctor-list")) {
			doGet_DoctorList(request, response);
		}else if(action.equalsIgnoreCase("delete-doctor")) {
			doGet_DeleteDoctor(request, response);
		}else if(action.equalsIgnoreCase("edit-doctor")) {
			doGet_EditDoctor(request, response);
		}else if(action.equalsIgnoreCase("doctor-medical-appointment")) {
			doGet_DoctorFacultyMedicalAppointment(request, response);
		}else if(action.equalsIgnoreCase("patient-list")) {
			doGet_PatientList(request, response);
		}else if(action.equalsIgnoreCase("patient-medical-appointment")) {
			doGet_PatientMedicalAppointment(request, response);
		}else if(action.equalsIgnoreCase("profile")) {
			doGet_Profile(request, response);
		}else if(action.equalsIgnoreCase("edit-profile")) {
			doGet_EditProfile(request, response);
		}else if(action.equalsIgnoreCase("sort-by-newest-faculty-appointment")) {
			doGet_SortByNewestFacultyAppointment(request, response);
		}else if(action.equalsIgnoreCase("search-by-dates-faculty-appointment")) {
			doGet_SearchByRangeDatesFacultyAppointment(request, response);
		}else if(action.equalsIgnoreCase("sort-by-newest-doctor-appointment")) {
			doGet_SortByNewestDoctorAppointment(request, response);
		}else if(action.equalsIgnoreCase("search-by-dates-doctor-appointment")) {
			doGet_SearchByRangeDatesDoctorAppointment(request, response);
		}else if(action.equalsIgnoreCase("sort-by-newest-patient-appointment")) {
			doGet_SortByNewestPatientAppointment(request, response);
		}else if(action.equalsIgnoreCase("search-by-dates-patient-appointment")) {
			doGet_SearchByRangeDatesPatientAppointment(request, response);
		}else if(action.equalsIgnoreCase("search-by-facultyName")) {
			doGet_SearchByFacultyName(request, response);
		}else if(action.equalsIgnoreCase("search-by-doctorName")) {
			doGet_SearchByDoctorName(request, response);
		}else if(action.equalsIgnoreCase("search-by-patientName")) {
			doGet_SearchByPatientName(request, response);
		}
	}
	
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("countFaculty", facultyModel.countFaculty());
		
		AccountModel accountModel = new AccountModel();
		request.setAttribute("countDoctor", facultyModel.countDoctor());
		request.setAttribute("countPatient", facultyModel.countPatient());
		
		request.setAttribute("account2", accountModel.findById(2));
		request.setAttribute("account3", accountModel.findById(3));
		request.getRequestDispatcher("WEB-INF/views/admin/home.jsp").forward(request, response);
	}
	
	protected void doGet_FacultyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculties", facultyModel.findAll());
		
		/* Từ doPost_CreateList*/
		String msgAddFailed = request.getParameter("msgAddFailed");
		String msgAddSuccess = request.getParameter("msgAddSuccess");
		request.setAttribute("msgAddFailed", msgAddFailed);
		request.setAttribute("msgAddSuccess", msgAddSuccess);

		
		/* Từ goGet_DeleteFaculty*/
		String msgRemoveSuccess = request.getParameter("msgRemoveSuccess");
		String msgRemoveFailed = request.getParameter("msgRemoveFailed");
		request.setAttribute("msgRemoveSuccess", msgRemoveSuccess);
		request.setAttribute("msgRemoveFailed", msgRemoveFailed);
		
		/* Từ doPost_EditFaculty*/
		String msgEditSuccess = request.getParameter("msgEditSuccess");
		String msgEditFailed = request.getParameter("msgEditFailed");
		request.setAttribute("msgEditSuccess", msgEditSuccess);
		request.setAttribute("msgEditFailed", msgEditFailed);

		request.getRequestDispatcher("WEB-INF/views/admin/facultyList.jsp").forward(request, response);
	}
	
	protected void doGet_DeleteFaculty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		
		FacultyModel facultyModel = new FacultyModel();
		Faculty faculty = facultyModel.findById(facultyId);
		
		boolean result = facultyModel.Delete(faculty);
		
		if(result) {
			response.sendRedirect("admin?action=faculty-list&msgRemoveSuccess=Remove Successfully!");
		}else {
			response.sendRedirect("admin?action=faculty-list&msgRemoveFailed=Remove Failed!");
		}	
	}
	
	protected void doGet_EditFaculty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculty", facultyModel.findById(facultyId));
		

		request.getRequestDispatcher("WEB-INF/views/admin/facultyEdit.jsp").forward(request, response);
	}
	
	protected void doGet_FacultyMedicalAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		String facultyName = request.getParameter("facultyName");
		
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.findByFacultyId(facultyId));
		request.setAttribute("facultyName", facultyName);
		request.setAttribute("facultyId", facultyId);

		request.getRequestDispatcher("WEB-INF/views/admin/facultyMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_DoctorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AccountModel accountModel = new AccountModel();
		request.setAttribute("doctors", accountModel.findAllDoctor());
		
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculties", facultyModel.findAll());

		
		/* Từ goPost_CreateDoctor*/
		String msgNullEmail = request.getParameter("msgNullEmail");
		String msgNullFullName = request.getParameter("msgNullFullName");
		String msgNullDob = request.getParameter("msgNullDob");
		String msgNullPassword = request.getParameter("msgNullPassword");
		String msgCreateSuccess = request.getParameter("msgCreateSuccess");
		String msgCreateFailed = request.getParameter("msgCreateFailed");

		request.setAttribute("msgNullEmail", msgNullEmail);
		request.setAttribute("msgNullFullName", msgNullFullName);
		request.setAttribute("msgNullDob", msgNullDob);
		request.setAttribute("msgNullPassword", msgNullPassword);
		request.setAttribute("msgCreateSuccess", msgCreateSuccess);
		request.setAttribute("msgCreateFailed", msgCreateFailed);
		
		/* Từ goGet_DeleteDoctor*/
		String msgRemoveSuccess = request.getParameter("msgRemoveSuccess");
		String msgRemoveFailed = request.getParameter("msgRemoveFailed");
		request.setAttribute("msgRemoveSuccess", msgRemoveSuccess);
		request.setAttribute("msgRemoveFailed", msgRemoveFailed);
		
		/* Từ goPost_EditDoctor*/
		String msgEditSuccess = request.getParameter("msgEditSuccess");
		String msgEditFailed = request.getParameter("msgEditFailed");
		request.setAttribute("msgEditSuccess", msgEditSuccess);
		request.setAttribute("msgEditFailed", msgEditFailed);

		request.getRequestDispatcher("WEB-INF/views/admin/doctorList.jsp").forward(request, response);
	}
	
	protected void doGet_DeleteDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		
		AccountModel accountModel = new AccountModel();
		Account account = accountModel.findById(doctorId);
		
		boolean result = accountModel.Delete(account);
		
		if(result) {
			response.sendRedirect("admin?action=doctor-list&msgRemoveSuccess=Remove Successfully!");
		}else {
			response.sendRedirect("admin?action=doctor-list&msgRemoveFailed=Remove Failed!");
		}	
	}
	
	protected void doGet_EditDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		
		AccountModel accountModel = new AccountModel();	
		Account doctor = accountModel.findById(doctorId);
		request.setAttribute("doctor", doctor);
		
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculties", facultyModel.findAll());

		request.getRequestDispatcher("WEB-INF/views/admin/doctorEdit.jsp").forward(request, response);
	}
	
	protected void doGet_DoctorFacultyMedicalAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		String doctorName = request.getParameter("doctorName");
		
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.findByDoctorId(doctorId));
		request.setAttribute("doctorName", doctorName);
		request.setAttribute("doctorId", doctorId);

		request.getRequestDispatcher("WEB-INF/views/admin/doctorMedicalAppointment.jsp").forward(request, response);
	}	
	
	protected void doGet_PatientList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AccountModel accountModel = new AccountModel();
		request.setAttribute("patients", accountModel.findAllPatient());

		request.getRequestDispatcher("WEB-INF/views/admin/patientList.jsp").forward(request, response);
	}
	
	protected void doGet_PatientMedicalAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		String patientName = request.getParameter("patientName");
		
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.findByPatientId(patientId));
		request.setAttribute("patientName", patientName);
		request.setAttribute("patientId", patientId);


		request.getRequestDispatcher("WEB-INF/views/admin/patientMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_Profile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = (String) request.getSession().getAttribute("email");
		AccountModel accountModel = new AccountModel();
		request.setAttribute("account", accountModel.findByEmail(email));
		
		/* Từ doPost_EditProfile*/
		String msgEditSuccess = request.getParameter("msgEditSuccess");
		String msgEditFailed = request.getParameter("msgEditFailed");
		request.setAttribute("msgEditSuccess", msgEditSuccess);
		request.setAttribute("msgEditFailed", msgEditFailed);

		request.getRequestDispatcher("WEB-INF/views/admin/profile.jsp").forward(request, response);
	}
	
	protected void doGet_EditProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = (String) request.getSession().getAttribute("email");
		AccountModel accountModel = new AccountModel();
		request.setAttribute("account", accountModel.findByEmail(email));

		request.getRequestDispatcher("WEB-INF/views/admin/profileEdit.jsp").forward(request, response);
	}
	
	protected void doGet_SortByNewestFacultyAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.sortByNewestDate_FacultyAppointment(facultyId));
		request.setAttribute("facultyId", facultyId);

		request.getRequestDispatcher("WEB-INF/views/admin/facultyMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByRangeDatesFacultyAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int facultyId = Integer.parseInt(request.getParameter("facultyId"));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			System.out.println(facultyId +" " + startDate +" " + endDate);
			
			if(startDate == null || endDate == null || startDate.isEmpty() || endDate.isEmpty()) {
				response.sendRedirect("admin?action=faculty-medical-appointment&facultyId=" + facultyId);
				return;
			}
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date from = simpleDateFormat.parse(startDate);
			Date to = simpleDateFormat.parse(endDate);
			
			AppointmentModel appointModel = new AppointmentModel();
			request.setAttribute("appointments", appointModel.searchByRangeDate_FacultyAppointment(from,to,facultyId));
			request.setAttribute("facultyId", facultyId);

			request.getRequestDispatcher("WEB-INF/views/admin/facultyMedicalAppointment.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doGet_SortByNewestDoctorAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.sortByNewestDate_DoctorAppointment(doctorId));
		request.setAttribute("doctorId", doctorId);

		request.getRequestDispatcher("WEB-INF/views/admin/doctorMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByRangeDatesDoctorAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int doctorId = Integer.parseInt(request.getParameter("doctorId"));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			if(startDate == null || endDate == null || startDate.isEmpty() || endDate.isEmpty()) {
				response.sendRedirect("admin?action=doctor-medical-appointment&doctorId=" + doctorId);
				return;
			}
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date from = simpleDateFormat.parse(startDate);
			Date to = simpleDateFormat.parse(endDate);
			
			AppointmentModel appointModel = new AppointmentModel();
			request.setAttribute("appointments", appointModel.searchByRangeDate_DoctorAppointment(from,to,doctorId));
			request.setAttribute("doctorId", doctorId);

			request.getRequestDispatcher("WEB-INF/views/admin/doctorMedicalAppointment.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	protected void doGet_SortByNewestPatientAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		AppointmentModel appointModel = new AppointmentModel();
		request.setAttribute("appointments", appointModel.sortByNewestDate_PatientAppointment(patientId));
		request.setAttribute("patientId", patientId);

		request.getRequestDispatcher("WEB-INF/views/admin/patientMedicalAppointment.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByRangeDatesPatientAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int patientId = Integer.parseInt(request.getParameter("patientId"));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			if(startDate == null || endDate == null || startDate.isEmpty() || endDate.isEmpty()) {
				response.sendRedirect("admin?action=patient-medical-appointment&patientId=" + patientId);
				return;
			}
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date from = simpleDateFormat.parse(startDate);
			Date to = simpleDateFormat.parse(endDate);
			
			AppointmentModel appointModel = new AppointmentModel();
			request.setAttribute("appointments", appointModel.searchByRangeDate_PatientAppointment(from, to, patientId));
			request.setAttribute("patientId", patientId);
			
			request.getRequestDispatcher("WEB-INF/views/admin/patientMedicalAppointment.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet_SearchByFacultyName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String facultyName = request.getParameter("facultyName");
		
		if(facultyName == null) {
			response.sendRedirect("admin?action=faculty-list");
			return;
		}
		FacultyModel facultyModel = new FacultyModel();
		request.setAttribute("faculties", facultyModel.searchByFacultyName(facultyName));	
		
		request.getRequestDispatcher("WEB-INF/views/admin/facultyList.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByDoctorName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String doctorName = request.getParameter("doctorName");
		
		if(doctorName == null) {
			response.sendRedirect("admin?action=doctor-list");
			return;
		}
		AccountModel accountModel = new AccountModel();
		request.setAttribute("doctors", accountModel.searchByDoctorName(doctorName));	
		
		request.getRequestDispatcher("WEB-INF/views/admin/doctorList.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByPatientName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String patientName = request.getParameter("patientName");
		
		if(patientName == null) {
			response.sendRedirect("admin?action=patient-list");
			return;
		}
		AccountModel accountModel = new AccountModel();
		request.setAttribute("patients", accountModel.searchByPatientName(patientName));	
		
		request.getRequestDispatcher("WEB-INF/views/admin/patientList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("create-faculty")) {
			doPost_CreateFaculty(request, response);
		}else if(action.equalsIgnoreCase("edit-faculty")) {
			doPost_EditFaculty(request, response);
		}else if(action.equalsIgnoreCase("create-doctor")) {
			doPost_CreateDoctor(request, response);
		}else if(action.equalsIgnoreCase("edit-doctor")) {
			doPost_EditDoctor(request, response);
		}else if(action.equalsIgnoreCase("edit-profile")) {
			doPost_EditProfile(request, response);
		}
	}
	
	protected void doPost_CreateFaculty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String facultyName = request.getParameter("facultyName");

			/* Kiểm tra nếu name có bằng null không (ko nhập) */
			if(facultyName == null || facultyName.trim().isEmpty()) {
			    response.sendRedirect("admin?action=faculty-list&msgFailed=Faculty Name mustn't be null or empty!");
			    return;
			}
			
			/* Kiểm tra faculty name nhập có trùng không */			
			FacultyModel facultyModel = new FacultyModel();
			Faculty faculty = facultyModel.findByName(facultyName);
			if(faculty != null) {
			    // Nếu đã tìm thấy khoa, tức là tên khoa đã tồn tại
			    response.sendRedirect("admin?action=faculty-list&msgFailed=Faculty Name existed!");
			    return;
			}


			Faculty facultyNew = new Faculty();
			facultyNew.setName(facultyName);
			
			boolean result = facultyModel.Create(facultyNew);
			
			if(result) {
				response.sendRedirect("admin?action=faculty-list&msgAddSuccess=Add Faculty Successfully!");
			}else {
			    response.sendRedirect("admin?action=faculty-list&msgAddFailed=Add Faculty Failed!");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost_EditFaculty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			int facultyId = Integer.parseInt(request.getParameter("facultyId"));
			String facultyName = request.getParameter("facultyName");
			
			System.out.println("Info: " + facultyId + facultyName);
			if(facultyName == null) {
				response.sendRedirect("admin?action=edit-faculty");
				return;
			}
			
			FacultyModel facultyModel = new FacultyModel();
			Faculty faculty = facultyModel.findById(facultyId);
			faculty.setName(facultyName);
		
			
			boolean result = facultyModel.Update(faculty);
			if(result) {
				response.sendRedirect("admin?action=faculty-list&msgEditSuccess=Edit Faculty Successfully!");	
			}else {
				response.sendRedirect("admin?action=faculty-list&msgEditFailed=Edit Faculty Failed!");	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	protected void doPost_CreateDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String fullName = request.getParameter("fullname");
			String dob = request.getParameter("dob");
			int roleId = Integer.parseInt(request.getParameter("roleId"));
			int facultyId = Integer.parseInt(request.getParameter("facultyId"));
			
			
			if(email == null || email.trim().isEmpty()) {
				response.sendRedirect("admin?action=doctor-list&msgNullEmail=Email mustn't null!");
				return;
			}
			if(fullName == null || fullName.trim().isEmpty()) {
				response.sendRedirect("admin?action=doctor-list&msgNullFullName=FullName mustn't null!");
				return;
			}
			if(password == null || password.trim().isEmpty()) {
				response.sendRedirect("admin?action=doctor-list&msgNullPassword=Password mustn't null!");
				return;
			}
			if(dob == null || dob.trim().isEmpty()) {
				response.sendRedirect("admin?action=doctor-list&msgNullDob=Dob mustn't null!");
				return;
			}
			
			Account account = new Account();
			account.setEmail(email);
			account.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
			account.setFullName(fullName);
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			account.setDob(simpleDateFormat.parse(dob));
			
			RoleModel roleModel = new RoleModel();
			Role role = roleModel.findById(roleId);
			account.setRole(role);
			
			FacultyModel facultyModel = new FacultyModel();
			Faculty faculty = facultyModel.findById(facultyId);
			account.setFaculty(faculty);
			
			
			AccountModel accountModel = new AccountModel();
			boolean result = accountModel.Create(account);
			
			if(result) {
				response.sendRedirect("admin?action=doctor-list&msgCreateSuccess=Create Doctor Successfully!");
			}else {
				response.sendRedirect("admin?action=doctor-list&msgCreateFailed=Create Doctor Failed!");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost_EditDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String fullName = request.getParameter("fullName");
			String dob = request.getParameter("dob");
			int roleId = Integer.parseInt(request.getParameter("roleId"));
			int facultyId = Integer.parseInt(request.getParameter("facultyId"));
			
			AccountModel accountModel = new AccountModel();
			Account doctor = accountModel.findById(id);
			
			if(email != null && !email.trim().isEmpty()) {
				doctor.setEmail(email);
			}
			if(password != null && !password.trim().isEmpty()) {
				doctor.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
			}
			if(fullName != null && !fullName.trim().isEmpty()){
				doctor.setFullName(fullName);
			}
			if(dob != null && !dob.trim().isEmpty()) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				doctor.setDob(simpleDateFormat.parse(dob));
			}
			if(facultyId != -1) {
				FacultyModel facultyModel = new FacultyModel();
				Faculty faculty = facultyModel.findById(facultyId);
				doctor.setFaculty(faculty);
			}
			boolean result = accountModel.Update(doctor);
			if(result) {
				response.sendRedirect("admin?action=doctor-list&msgEditSuccess=Edit Doctor Successfully!");	
			}else {
				response.sendRedirect("admin?action=doctor-list&msgEditFailed=Edit Doctor Successfully!");	
			}	
		} catch (Exception e) {
			e.printStackTrace();
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

				response.sendRedirect("admin?action=profile&msgEditSuccess=Update Profile Successfully");
			}else {
				response.sendRedirect("admin?action=profile&msgEditFailed=Update Profile Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
