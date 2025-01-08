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
							<li class="breadcrumb-item"><a href="#">List of Patients</a></li>
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
							<h5 class="card-header-text">Patient</h5>
							<p>Patient List</p>
							<p class="text-Success">${msgRemoveSuccess}</p>
							<p class="text-Success">${msgRemoveFailed}</p>

							<p class="text-Success">${msgEditSuccess}</p>
							<p class="text-Success">${msgEditFailed}</p>

						</div>
						
						<!-- SEARCH BY NAME -->
						<form method="GET" action="${pageContext.request.contextPath}/admin">

							<div class="row" style="margin-left: 20px">
								<div class="col-md-4">
								<input type="text" class="form-control" name="patientName" />
								</div>

								<div
									class="col-md-4 d-flex align-items-end">
									<button type="submit" class="btn btn-outline-dark">Search</button>
								</div>
								<input type="hidden" name="action" value="search-by-patientName">
							</div>
						</form>
						<!-- SEARCH BY NAME -->
						
						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th class="text-center">FullName</th>
												<th class="text-center">Email</th>
												<th class="text-center">Birthday</th>
												<th class="text-center">Phone</th>
												<th class="text-center">Address</th>	
												<th class="text-center">Details</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="patient" items="${patients}">
												<tr>
													<td style="vertical-align: middle; text-align: center">${patient.fullName}</td>
													<td style="vertical-align: middle; text-align: center">${patient.email}</td>
													<td style="vertical-align: middle; text-align: center">
														<fmt:formatDate value="${patient.dob}" pattern="dd/MM/yyyy"/>
													</td>
													<td style="vertical-align: middle; text-align: center">${patient.phone}</td>	
													<td style="vertical-align: middle; text-align: center">${patient.address}</td>	
													<td>
														<a href="${pageContext.request.contextPath}/admin?action=patient-medical-appointment&patientId=${patient.id}&patientName=${patient.fullName}" 
														class="btn btn-outline-dark btn-sm text-dark">Medical Appointment</a>
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