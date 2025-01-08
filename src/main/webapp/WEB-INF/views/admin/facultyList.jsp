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
							<li class="breadcrumb-item"><a href="#">List of faculty</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- Header end -->

			<!-- FORM CREATE -->
			<div style="text-align: center; margin-top: 50px;">
				<h2>Add New Faculty</h2>
				<p class="text-danger">${msgAddFailed }</p>
				<p class="text-success">${msgAddSuccess }</p>

				<form action="${pageContext.request.contextPath}/admin"
					method="post"
					style="display: inline-block; text-align: left; padding: 20px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
					<label class="block form-control-label">Faculty Name</label> <input
						type="text" class="form-control" name="facultyName"> <br>
					<button type="submit" class="btn btn-success">Add New
						Faculty</button>
					<input type="hidden" name="action" value="create-faculty">
				</form>
			</div>

			<!-- FORM CREATE -->

			

			<!-- Tables start -->
			<div class="row">
				<div class="col-sm-12">
					<!-- Basic Table starts -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-header-text">Faculty</h5>
							<p>Faculty List</p>
							<p class="text-success">${msgRemoveSuccess}</p>
							<p class="text-danger">${msgRemoveFailed}</p>
							
							<p class="text-success">${msgEditSuccess}</p>
							<p class="text-danger">${msgEditFailed}</p>

						</div>

						<!-- SEARCH BY NAME -->
						<form method="GET" action="${pageContext.request.contextPath}/admin">

							<div class="row" style="margin-left: 20px">
								<div class="col-md-4">
								<input type="text" class="form-control" name="facultyName" />
								</div>

								<div
									class="col-md-4 d-flex align-items-end">
									<button type="submit" class="btn btn-outline-dark">Search</button>
								</div>
								<input type="hidden" name="action" value="search-by-facultyName">
							</div>
						</form>
						<!-- SEARCH BY NAME -->
						
						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th>Name</th>
												<th>Details</th>
												<th>Update</th>
												<th>Delete</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="faculty" items="${faculties}">
												<tr>
													<td style="vertical-align: middle;">${faculty.name}</td>
													<td>
														<a href="${pageContext.request.contextPath}/admin?action=faculty-medical-appointment&facultyId=${faculty.id}&facultyName=${faculty.name}" 
														 class="btn btn-outline-dark text-dark">Faculty's Medical Appointment</a>
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/admin?action=edit-faculty&facultyId=${faculty.id}" 
														class="btn btn-primary text-white">Update</a>
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/admin?action=delete-faculty&facultyId=${faculty.id}"
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