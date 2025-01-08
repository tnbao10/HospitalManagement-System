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
							<li class="breadcrumb-item"><a href="#">Your Medical Appointment History</a></li>
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
							<h5 class="card-header-text">History</h5>
							<p>You can see your medical history here</p>
							<p class="text-Success">${msgCreateSuccess}</p>
							<p class="text-danger">${msgCreateFailed}</p>

						</div>
						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th class="text-center">Doctor's Avatar</th>
												<th class="text-center">Doctor's Name</th>
												<th class="text-center">Date</th>
												<th class="text-center">Time</th>
												<th class="text-center">Content</th>	
											</tr>
										</thead>
										<tbody>
											<c:forEach var="appointment" items="${appointments}">
												<tr>
													<td>
														<img src="${pageContext.request.contextPath}/assets/images/widget/${appointment.accountByDoctorId.photo}" 
														width="50" height="50" style="border-radius: 50%;">
													</td>
													<td style="vertical-align: middle; text-align: center">${appointment.accountByDoctorId.fullName}</td>
													<td style="vertical-align: middle; text-align: center">
														<fmt:formatDate value="${appointment.date}" pattern="dd/MM/yyyy"/>
													</td>
													<td style="vertical-align: middle; text-align: center">
														<fmt:formatDate value="${appointment.time}" pattern="HH:mm"/>
													</td>	
													<td>${appointment.content}</td>																																		
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