package com.demo.servlets.auth;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Account;
import com.demo.entities.Role;
import com.demo.models.AccountModel;
import com.demo.models.RoleModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;


@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public AuthServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Login(request, response);
		}else if(action.equalsIgnoreCase("logout")) {
			doGet_Logout(request, response);
		}else if(action.equalsIgnoreCase("register")) {
			doGet_Register(request, response);
		}
	}
	
	protected void doGet_Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Từ doPost_Register
		String msgRegisterSuccess = request.getParameter("msgRegisterSuccess");
		request.setAttribute("msgRegisterSuccess", msgRegisterSuccess);
		
		request.getRequestDispatcher("WEB-INF/views/auth/login.jsp").forward(request, response);
		
	}
	
	protected void doGet_Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("email");
		
		response.sendRedirect("auth");
	}
	
	protected void doGet_Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Từ doPost_Register
		String msgNullEmail = request.getParameter("msgNullEmail");
		String msgNullFullName = request.getParameter("msgNullFullName");
		String msgNullPassword = request.getParameter("msgNullPassword");
		String msgNullConfirmPassword = request.getParameter("msgNullConfirmPassword");
		String msgNullDob = request.getParameter("msgNullDob");
		String msgErrorEmail = request.getParameter("msgErrorEmail");
		String msgErrorPassword = request.getParameter("msgErrorPassword");

		request.setAttribute("msgNullEmail", msgNullEmail);
		request.setAttribute("msgNullFullName", msgNullFullName);
		request.setAttribute("msgNullPassword", msgNullPassword);
		request.setAttribute("msgNullConfirmPassword", msgNullConfirmPassword);
		request.setAttribute("msgNullDob", msgNullDob);
		request.setAttribute("msgErrorEmail", msgErrorEmail);
		request.setAttribute("msgErrorPassword", msgErrorPassword);

		
		request.getRequestDispatcher("WEB-INF/views/auth/register.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("login")) {
			doPost_Login(request, response);
		}else if(action.equalsIgnoreCase("register")) {
			doPost_Register(request, response);
		}
	}

	protected void doPost_Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		AccountModel accountModel = new AccountModel();
		if(accountModel.login(email, password)) {
			
			request.getSession().setAttribute("email", email);
			Account account = accountModel.findByEmail(email);
			request.getSession().setAttribute("fullName", account.getFullName());
			request.getSession().setAttribute("photo", account.getPhoto());

			if(account.getRole().getId() == 1) {
			    response.sendRedirect(request.getContextPath() + "/admin");
			}else if(account.getRole().getId() == 2) {
			    response.sendRedirect(request.getContextPath() + "/doctor");
			}else if(account.getRole().getId() == 3) {
			    response.sendRedirect(request.getContextPath() + "/patient");
			}	
		}else {
			request.setAttribute("messageFail", "Incorrect Username or Password");
			request.getRequestDispatcher("WEB-INF/views/auth/login.jsp").forward(request, response);		
		}	
	}
	
	protected void doPost_Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			String fullName = request.getParameter("fullName");
			String dob = request.getParameter("dob");
			int roleId = Integer.parseInt(request.getParameter("roleId"));
			
			System.out.println("dob: " + dob);
			AccountModel accountModel = new AccountModel();
			

			if(email == null || email.trim().isEmpty()) {
				response.sendRedirect("auth?action=register&msgNullEmail=You must enter your Email!");
				return;
			}
			if(fullName == null || fullName.trim().isEmpty()) {
				response.sendRedirect("auth?action=register&msgNullFullName=You must enter your FullName!");
				return;
			}
			if(password == null || password.trim().isEmpty()) {
				response.sendRedirect("auth?action=register&msgNullPassword=You must enter your password!");
				return;
			}
			if(confirmPassword == null || confirmPassword.trim().isEmpty()) {
				response.sendRedirect("auth?action=register&msgNullConfirmPassword=You must enter your confirm Password!");
				return;
			}
			if(dob == null || dob.trim().isEmpty()) {
				response.sendRedirect("auth?action=register&msgNullDob=You must enter your Birthday!");
				return;
			}
				
			Account account = new Account();
			// Email
			if(accountModel.findByEmail(email) == null) {
				account.setEmail(email);
			}else {
				response.sendRedirect("auth?action=register&msgErrorEmail=Email has existed!");
				return;
			}
			
			// FullName
			account.setFullName(fullName);
			
			// Password
			if(password.equalsIgnoreCase(confirmPassword)) {
				account.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
			}else {
				response.sendRedirect("auth?action=register&msgErrorPassword=Your password and confirm password are not same!");
				return;
			}
			
			// Dob
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			account.setDob(simpleDateFormat.parse(dob));
			
			// Role
			RoleModel roleModel = new RoleModel();
			Role role = roleModel.findById(roleId);
			account.setRole(role);
			
			boolean result = accountModel.Create(account);
			if(result) {
				response.sendRedirect("auth?msgRegisterSuccess=Register successfully!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
