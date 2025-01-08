<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:AdminLayout title="admin">
	<jsp:attribute name="content">
		<div class="container-fluid">

			<!-- Header Starts -->
			<div class="row">
				<div class="col-sm-12 p-0">
					<div class="main-header">
						<h4>Table</h4>
						<ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/admin"> <i
									class="icofont icofont-home"></i>
							</a></li>
							<li class="breadcrumb-item"><a href="#">List of Doctors</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- Header end -->

			<!-- FORM START -->
			<div style="text-align: center; margin-top: 50px;">
				<h2>Add New Doctor</h2>
				<h4 class="text-danger">${msgCreateFailed}</h4>
				<h4 class="text-success">${msgCreateSuccess}</h4>

				<form action="${pageContext.request.contextPath}/admin"
					method="post" style="display: inline-block; text-align: left; padding: 50px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 60%; max-width: 800px;">
					<label class="block form-control-label">Email</label> <p class="text-danger">${msgNullEmail}</p>
					<input type="email" class="form-control" name="email">
					<br>
					<label class="block form-control-label">Password</label> <p class="text-danger" >${msgNullPassword}</p>
					<input type="password" class="form-control" name="password"> 
					<br>
					<label class="block form-control-label">FullName</label> <p class="text-danger">${msgNullFullName}</p>
					<input type="text" class="form-control" name="fullname"> 
					<br>
					<div class="row">
						<div class="col-md-6">
						<!-- yyyy-MM-dd -->
							<label class="block form-control-label">Date of Birth</label> <p class="text-danger">${msgNullDob}</p>
							<input type="date" class="form-control" name="dob"> 
						</div>

						<div class="col-md-6">
							<label class="block form-control-label">Faculty</label> 
							<select name="facultyId" class="form-control">
							<c:forEach var="faculty" items="${faculties}">
								<option value="${faculty.id}">${faculty.name}</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<br>

					<button type="submit" class="btn btn-success">Add Doctor</button>
					<input type="hidden" name="action" value="create-doctor">
					<input type="hidden" name="roleId" value="2"> 
				</form>

			</div>

			<!-- FORM START -->

			<!-- Tables start -->
			<div class="row">
				<div class="col-sm-12">
					<!-- Basic Table starts -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-header-text">Doctor</h5>
							<p>Doctor List</p>
							<p class="text-success">${msgRemoveSuccess}</p>
							<p class="text-danger">${msgRemoveFailed}</p>

							<p class="text-success">${msgEditSuccess}</p>
							<p class="text-danger">${msgEditFailed}</p>
						</div>
						
						<!-- SEARCH BY NAME -->
						<form method="GET" action="${pageContext.request.contextPath}/admin">

							<div class="row" style="margin-left: 20px">
								<div class="col-md-4">
								<input type="text" class="form-control" name="doctorName" />
								</div>

								<div
									class="col-md-4 d-flex align-items-end">
									<button type="submit" class="btn btn-outline-dark">Search</button>
								</div>
								<input type="hidden" name="action" value="search-by-DoctorName">
							</div>
						</form>
						<!-- SEARCH BY NAME -->
						
						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th class="text-center">Photo</th>
												<th class="text-center">FullName</th>
												<th class="text-center">Email</th>
												<th class="text-center">Birthday</th>
												<th class="text-center">Faculty</th>
												<th class="text-center">Details</th>
												<th>Update</th>
												<th>Delete</th>			
											</tr>
										</thead>
										<tbody>
											<c:forEach var="doctor" items="${doctors}">
												<tr >
													<td>
														<img src="${pageContext.request.contextPath}/assets/images/widget/${doctor.photo}" 
														width="60" height="60" style="border-radius: 50%;">
													</td>
													<td style="vertical-align: middle; text-align: center">${doctor.fullName}</td>
													<td style="vertical-align: middle; text-align: center">${doctor.email}</td>
													<td style="vertical-align: middle; text-align: center">
														<fmt:formatDate value="${doctor.dob}" pattern="dd/MM/yyyy"/>
													</td>
													<td style="vertical-align: middle; text-align: center">${doctor.faculty.name}</td>
													<td style="vertical-align: middle;">
														<a href="${pageContext.request.contextPath}/admin?action=doctor-medical-appointment&doctorId=${doctor.id}&doctorName=${doctor.fullName}" 
														class="btn btn-outline-dark btn-sm text-dark" >Medical Appointment</a>
													</td>
													<td style="vertical-align: middle;">
														<a href="${pageContext.request.contextPath}/admin?action=edit-doctor&doctorId=${doctor.id}" 
														class="btn btn-primary btn-sm text-white" >Update</a>
													</td>
													<td style="vertical-align: middle;">
														<a href="${pageContext.request.contextPath}/admin?action=delete-doctor&doctorId=${doctor.id}"
														class="btn btn-danger"> <i class="fas fa-trash"></i> </a><!-- Biểu tượng thùng rác -->
														</a>
													</td>													
												</tr>
											</c:forEach>


										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--  Table ends -->

				</div>
			</div>
		</div>
	</jsp:attribute>
</mt:AdminLayout>