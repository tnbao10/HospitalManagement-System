<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:PatientLayout title="admin">
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

			<!-- Tables start -->
			<div class="row">
				<div class="col-sm-12">
					<!-- Basic Table starts -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-header-text">Faculty</h5>
							<p>Click faculty to to see doctors</p>

						</div>
						<div class="card-block">
							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table class="table table-bordered table-border-dark" style="border-width: 3px;">
										<thead>
											<tr>
												<th>Faculty List</th>
												<th>Choose Faculty you want</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="faculty" items="${faculties}">
												<tr>
													<td style="vertical-align: middle">${faculty.name}</td>
													<td>
													<a href="${pageContext.request.contextPath}/patient?action=faculty-doctor-list&facultyId=${faculty.id}&facultyName=${faculty.name}"
														class="btn btn-primary text-white">More Details !
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
</mt:PatientLayout>