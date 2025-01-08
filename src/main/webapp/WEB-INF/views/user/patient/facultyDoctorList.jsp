<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:PatientLayout title="patient">
	<jsp:attribute name="content">
		<div class="container-fluid">

			<!-- Header Starts -->
			<div class="row">
				<div class="col-sm-12 p-0">
					<div class="main-header">
						<h4>Table</h4>
						<ol class="breadcrumb breadcrumb-title breadcrumb-arrow">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/patient"> <i
									class="icofont icofont-home"></i>
							</a></li>
							<li class="breadcrumb-item"><a href="#">Doctor list</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- Header end -->

			<!-- Tables start -->
			<div class="row">
				<div class="col-sm-12">
					<!-- Basic Table starts -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-header-text">Doctor List - Faculty: ${facultyName}</h5>

						</div>
						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th class="text-center">Photo</th>
												<th class="text-center">FullName</th>
												<th class="text-center">Email</th>
												<th class="text-center">Date of Birth</th>
												<th class="text-center">Role</th>
												<th class="text-center">Faculty</th>
												<th class="text-center">Phone Number</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="doctor" items="${doctors}">
												<tr>
													<td>
														<img src="${pageContext.request.contextPath}/assets/images/widget/${doctor.photo}" 
														width="50px" height="50px" style="border-radius: 50%;">
													</td>
													<td style="vertical-align: middle;">${doctor.fullName}</td>
													<td style="vertical-align: middle;">${doctor.email}</td>
													<td style="vertical-align: middle;">${doctor.dob}</td>
													<td style="vertical-align: middle;">${doctor.role.name}</td>
													<td style="vertical-align: middle;">${doctor.faculty.name}</td>
													<td style="vertical-align: middle;">${doctor.phone}</td>
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
</mt:PatientLayout>