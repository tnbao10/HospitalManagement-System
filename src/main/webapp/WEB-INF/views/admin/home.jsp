<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:AdminLayout title="admin">
	<jsp:attribute name="content">
		<!-- Content -->
		<div class="container-fluid"
			style="text-align: center; margin: 0 auto; background-image: url('assets/images/doctorss.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
			<div class="row">
				<div class="main-header">
					<h4>Hospital Dashboard</h4>
				</div>
			</div>
			<!-- 4-blocks row start -->
			<div class="row dashboard-header"
				style="display: flex; justify-content: center;">
				<div class="col-lg-3 col-md-6" style="text-align: center;">
					<div class="card dashboard-product">
						<span>List of Faculties</span>
						<h2 class="dashboard-total-products">${countFaculty}</h2>
						<a href="${pageContext.request.contextPath}/admin?action=faculty-list" class="btn btn-primary text-white">Details</a>
						<div class="side-box">
							<i class="fas fa-hospital text-primary-color"></i>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6" style="text-align: center;">
					<div class="card dashboard-product">
						<span>List of Patients</span>
						<h2 class="dashboard-total-products">${countPatient}</h2>
						<a href="${pageContext.request.contextPath}/admin?action=patient-list" class="btn btn-primary text-white">Details</a>
						<div class="side-box">
							<i class="ti-wheelchair text-warning-color"></i>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6" style="text-align: center;">
					<div class="card dashboard-product">
						<span>Doctors</span>
						<h2 class="dashboard-total-products">${countDoctor}</h2>
						<a href="${pageContext.request.contextPath}/admin?action=doctor-list" class="btn btn-primary text-white">Details</a>
						<div class="side-box">
							<i class="fas fa-user-md text-success-color"></i>
						</div>
					</div>
				</div>

			</div>
			<!-- 4-blocks row end -->

			<div class="row" style="display: flex; justify-content: center;">
				<div class="col-lg-4" style="text-align: center;">
					<div class="card">
						<div
							style="background-color: #39444e; text-align: center; color: white; display: flex; flex-direction: column; justify-content: center; align-items: center; padding: 20px;">
							<img class="img-fluid" src="assets/images/widget/doctors-1.jpg"
								width="50" height="50" alt="user-header" style="border-radius: 50%; margin-bottom=10px">
							<h5>${account2.fullName}</h5>
							<h6>Head Doctor</h6>
						</div>

						<div class="card-block">
							<div class="user-block-2-activities">
								<div class="user-block-2-active">
									<i class="icofont icofont-clock-time"></i> Faculty: ${account2.faculty.name }
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 1-3-block row end -->

			<!-- 2-1 block start -->
			<div class="container-fluid"
				style="display: flex; justify-content: center;">
				<div class="col-12" style="text-align: center;">
					<div class="card">
						<div class="card-block">
							<div class="table-responsive">
								<table class="table m-b-0 photo-table" style="margin: 0 auto;">
									<thead>
										<tr class="text-uppercase">
											<th>Photo</th>
											<th>Position</th>
											<th>Phone Number</th>
											<th>Email</th>
											<th>Role</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>
												<img class="img-fluid img-circle"
												src="assets/images/widget/${account2.photo}">
											</th>
											<td>Head Doctor
												<p>
													<i class="icofont icofont-clock-time"></i>Join at
													4.1.2025
												</p>
											</td>
											<td>${account2.phone}</td>	
											<td>${account2.email}</td>
											<td>${account2.role.name}</td>
										</tr>
										<tr>
											<th><img class="img-fluid img-circle"
												src="assets/images/widget/${account3.photo}" width="60" height="60""></th>
											<td>Assistant Doctor
												<p>
													<i class="icofont icofont-clock-time"></i>Join at
													5.1.2025
												</p>
											</td>
											<td>${account3.phone}</td>
											<td>${account3.email}</td>
											<td>${account3.role.name}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 2-1 block end -->

		</div>

	</jsp:attribute>
</mt:AdminLayout>
