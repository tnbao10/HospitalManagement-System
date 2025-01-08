<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<!-- Import Thư viện Format thời gian (Tag List) -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<mt:PatientLayout title="patient">
	<jsp:attribute name="content">
		<section style="background-color: #eee; font-size: 70px; " >
			<div class="container py-5" style="margin: 10px auto">
			<br>
				<h2>Edit Profile</h2>
				<!-- FORM -->
				<form action="${pageContext.request.contextPath}/patient?action=edit-profile"
					method="POST" enctype="multipart/form-data">
					<div class="row"
						style="margin-top: 13px; font-size: 25px !important">
						<div class="col-lg-4">
							<div style="padding: 15px" class="card mb-4">
								<div class="card-body text-center">
									<img src="assets/images/widget/${account.photo}" alt="avatar"
										class="img-fluid"
										style="width: 150px; height: 150px; border-radius: 50%; margin: 0 auto;">
									
									    <!-- File Input -->
									<div class="mb-3 w-100 text-center">
										<label for="avatarFile" class="form-label" style="font-size: 20px">Choose a new avatar</label> 
										<input type="file" id="avatarFile" name="file"class="form-control">
									</div>

									<!-- Update Button -->
									<button type="submit" class="btn btn-success" style="margin-top: 8px">Upload Avatar</button>

								</div>
							</div>

							<!-- Slogan -->
							<div style="padding: 30px 28px 50px 25px " class="card mb-4 mb-lg-0">
								<div class="card-body p-0">
									<textarea
										style="font-size: 15px; font-style: italic; margin-bottom: 5px"
										rows="4" cols="36" name="description">${account.description}</textarea>

									<div>
										<p class="display-4 mb-3"
											style="font-size: 14px; font-weight: bold;">-
											${account.fullName}</p>
									</div>
								</div>
								<!-- BUTTON Slogan -->
								<button type="submit" class="btn btn-success"
									style="font-size: 12px; float: right">Update Slogan</button>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="card mb-4">
								<div style="padding: 20px" class="card-body">
									<!-- Full Name -->
									<div class="row mb-3">
										<div class="col-sm-3">
											<label class="form-label" style="font-size: 18px">Full
												Name</label>
										</div>
										<div class="col-sm-9">
											<input type="text" name="fullName" class="form-control"
												value="${account.fullName}">
										</div>
									</div>
									<hr>

									<!-- Email -->
									<div class="row mb-3">
										<div class="col-sm-3">
											<label class="form-label" style="font-size: 18px">Email</label>
										</div>
										<div class="col-sm-9">
											<input type="email" name="email" class="form-control"
												value="${account.email}">
										</div>
									</div>
									<hr>

									<!-- Phone -->
									<div class="row mb-3">
										<div class="col-sm-3">
											<label class="form-label" style="font-size: 18px">Phone</label>
										</div>
										<div class="col-sm-9">
											<input type="text" name="phone" class="form-control"
												value="${account.phone}">
										</div>
									</div>
									<hr>

									<!-- Address -->
									<div class="row mb-3">
										<div class="col-sm-3">
											<label class="form-label" style="font-size: 18px">Address</label>
										</div>
										<div class="col-sm-9">
											<input type="text" name="address" class="form-control"
												value="${account.address}">
										</div>
									</div>
									<hr>

									<!-- Date of Birth -->
									<div class="row mb-3">
										<div class="col-sm-3">
											<label class="form-label" style="font-size: 18px">Date
												Of Birthday</label>
										</div>
										<div class="col-sm-9">
											<fmt:formatDate value="${account.dob}" pattern="dd/MM/yyyy"
												var="_dob" />
											<input type="date" name="dob" class="form-control"
												value="${account.dob}">
										</div>
									</div>
									<hr>

									<!-- Role -->
									<div class="row mb-3">
										<div class="col-sm-3">
											<label class="form-label" style="font-size: 18px">Role</label>
										</div>
										<div class="col-sm-9">
											<p class="text-muted mb-0" style="font-size: 18px">${account.role.name}</p>
											<input type="hidden" name="roleId" value="${account.role.id}">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-12"
											style="display: flex !important; justify-content: space-between !important;">
											<!-- Back to Profile Button -->
											<a
												href="${pageContext.request.contextPath}/admin?action=profile"
												class="btn btn-outline-dark" style="font-size: 15px; margin-left: 20px; color: #444444">
												Back to Profile <i class="fas fa-user"></i>
											</a>

											<!-- Edit Profile Button -->
											<button type="submit" class="btn btn-success"
												style="font-size: 17px; margin-right: 16px">Edit Profile <i class="fas fa-edit"></i> </button>
											<input type="hidden" name="id" value="${account.id}">
										</div>
									</div>




								</div>

							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</jsp:attribute>
</mt:PatientLayout>