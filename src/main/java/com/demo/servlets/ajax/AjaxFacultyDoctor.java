package com.demo.servlets.ajax;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.demo.models.AccountModel;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class AjaxFacultyDoctor
 */
@WebServlet("/ajaxFacultyDoctor")
public class AjaxFacultyDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFacultyDoctor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Lấy facultyId từ request
            int facultyId = Integer.parseInt(request.getParameter("facultyId"));

            // Lấy danh sách bác sĩ từ AccountModel
            AccountModel accountModel = new AccountModel();
            Object doctors = accountModel.findDoctorByFacultyId(facultyId);

            // Sử dụng Jackson với Hibernate Module
            ObjectMapper mapper = new ObjectMapper();
            mapper.registerModule(new Hibernate5Module()); // Đăng ký module Hibernate

            // Serialize danh sách bác sĩ thành JSON và gửi về client
            String json = mapper.writeValueAsString(doctors);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"An error occurred while processing the request.\"}");
        }
    }
}
