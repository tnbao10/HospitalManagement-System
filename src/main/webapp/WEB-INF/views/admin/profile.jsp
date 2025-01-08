<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<!-- Import Thư viện Format thời gian (Tag List) -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<mt:AdminLayout title="admin">
	<jsp:attribute name="content">
		<section style="background-color: #eee; font-size: 70px; " >
			<div class="container py-5" style="margin: 10px auto">
			<br>
				<h2>Admin's Profile</h2>
				<div class="row" style="margin-top: 13px; font-size: 25px !important">
					<div class="col-lg-4">
						<div style="padding: 15px" class="card mb-4">
							<div class="card-body text-center">
								<img
									src="assets/images/widget/${account.photo}"
									alt="avatar" class="img-fluid"
									style="width: 150px; height: 150px; border-radius: 50%; margin: 0 auto;">
								

		
								<h5 class="my-3 fs-2"></h5>
								<p class="text-muted mb-1 fs-2" style="font-size: 15px">${account.fullName}</p>
								<div class="d-flex justify-content-center mb-2">
									<a href="${pageContext.request.contextPath}/admin?action=edit-profile"  class="btn btn-outline-dark" style="margin: 10px auto; color: #222222">
										Edit Profile <i class="fas fa-edit"></i>
									</a>
									<h6 class="text-success">${msgEditSuccess}</h6>
									<h6 class="text-danger">${msgEditFailed}</h6>
									
								</div>
							</div>
						</div>
						
						<!-- Slogan -->
						<div style="padding: 15px" class="card mb-4 mb-lg-0">
							<div class="card-body p-0">
									<!-- Slogan  -->
									<p class="lead mt-2text-center"
										style="font-size: 15px; font-style: italic; margin-bottom: 5px">
										${account.description}
									</p>
								<div>
									<!-- Slogan chính -->
									<p class="display-4 mb-3" style="font-size: 14px; font-weight: bold;">
										-${account.fullName}</p>
								</div>

							</div>
						</div>

					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div style="padding: 15px" class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0"style="font-size: 16px">Full Name</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0" style="font-size: 20px">${account.fullName}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0" style="font-size: 16px">Email</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0" style="font-size: 16px">${account.email}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0" style="font-size: 16px">Phone number:</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0" style="font-size: 16px">(+84) ${account.phone}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0" style="font-size: 16px">Address</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0" style="font-size: 16px">${account.address}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0" style="font-size: 16px">Date Of Birthday</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0" style="font-size: 16px">
											<fmt:formatDate value="${account.dob}" pattern="dd/MM/yyyy"/>
										</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0" style="font-size: 16px">Role</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0" style="font-size: 16px">${account.role.name}</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="card mb-4 mb-md-0">
									<div class="card-body" style="padding: 15px; text-align:center; margin: 0 auto">
										<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin?action=faculty-list"
											style="margin: 10px auto; color: #555555; width: 220px;"> Faculty Management <i
											class="fas fa-hospital"></i>
										</a> 
										<br> 
										<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin?action=doctor-list"
											style="margin: 10px auto; color: #555555; width: 220px;"> Doctor Management <i
											class="fas fa-user-md"></i>
										</a> 
										<br> 
										<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin?action=patient-list"
											style="margin: 10px auto; color: #555555; width: 220px;"> Patient Management <i
											class="fas fa-file-medical"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card mb-4 mb-md-0">
									<div class="card-body" style="padding: 15px">
										<p class="mb-4">
											<span class="text-primary font-italic me-1">Hospital Project</span>
											Project Status
										</p>
										<p class="mb-1" style="font-size: .77rem;">Web Design</p>
										<div class="progress rounded" style="height: 5px;">
											<div class="progress-bar" role="progressbar"
												style="width: 80%" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<p class="mt-4 mb-1" style="font-size: .77rem;">Website
											Markup</p>
										<div class="progress rounded" style="height: 5px;">
											<div class="progress-bar" role="progressbar"
												style="width: 72%" aria-valuenow="72" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
										<div class="progress rounded" style="height: 5px;">
											<div class="progress-bar" role="progressbar"
												style="width: 89%" aria-valuenow="89" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<p class="mt-4 mb-1" style="font-size: .77rem;">Mobile
											Template</p>
										<div class="progress rounded" style="height: 5px;">
											<div class="progress-bar" role="progressbar"
												style="width: 55%" aria-valuenow="55" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<p class="mt-4 mb-1" style="font-size: .77rem;">Backend
											API</p>
										<div class="progress rounded mb-2" style="height: 5px;">
											<div class="progress-bar" role="progressbar"
												style="width: 66%" aria-valuenow="66" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</jsp:attribute>
</mt:AdminLayout>