<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:DoctorLayout title="doctor">
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
							<li class="breadcrumb-item"><a href="#">Medical Appointment</a></li>
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
							<h5 class="card-header-text">Doctor: ${doctorName}</h5>
							<p>You can see your Appointment with your patient here</p>
						</div>

						<!-- Find By Range Date -->
						<div class="row mb-3" style="margin-left: 20px">
							<div class="col-md-12">
								<form method="GET"
									action="${pageContext.request.contextPath}/doctor">

									<div class="row">
										<div class="col-md-4">
											<label class="form-label">Start Date</label> <input
												type="date" class="form-control" name="startDate" />
										</div>
										<div class="col-md-4">
											<label class="form-label">End Date</label> <input type="date"
												class="form-control" name="endDate" />
										</div>

										<div style="margin-top: 31px"
											class="col-md-4 d-flex align-items-end">
											<button type="submit" class="btn btn-outline-dark">Search
												By Range Date</button>
										</div>
										<input type="hidden" name="doctorId" value="${doctorId}">
										<input type="hidden" name="action"
											value="search-by-dates-doctor-appointment">
									</div>
								</form>
							</div>
						</div>

						<!-- Sort By Newest Date -->
						<form method="GET" action="${pageContext.request.contextPath}/doctor">
							<button type="submit" class="btn btn-outline-dark"
								style="margin-left: 30px; margin-top: 30px">Sort By
								Newest</button>
							<input type="hidden" name="doctorId" value="${doctorId}">
							<input type="hidden" name="action" value="sort-by-newest-doctor-appointment">
						</form>

						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th class="text-center">Patient's Name</th>
												<th class="text-center">Date</th>
												<th class="text-center">Time</th>
												<th class="text-center">Content</th>	
											</tr>
										</thead>
										<tbody>
											<c:forEach var="appointment" items="${appointments}">
												<tr>
													<td style="vertical-align: middle; text-align: center">${appointment.accountByPatientId.fullName}</td>
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
</mt:DoctorLayout>