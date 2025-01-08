<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:AdminLayout title="admin">
	<jsp:attribute name="content">
		<div class="container-fluid">

			<div class="card-block">
				<h3>Edit Doctor</h3>
				<p class="text-success">${msgEditSuccess}</p>
				<p class="text-danger">${msgEditFailed}</p>

				<form method="POST" action="${pageContext.request.contextPath}/admin">
					<div class="form-group">
						<label class="form-control-label">Id </label> 
						<input type="text" class="form-control" name="id" value="${doctor.id}" readonly> 
					</div>
					<div class="form-group">
						<label class="form-control-label">Email </label> 
						<input type="email" class="form-control" name="email" value="${doctor.email}" > 
					</div>
					<div class="form-group">
						<label class="form-control-label">Password </label> 
						<input type="password" class="form-control" name="password" > 
					</div>
					<div class="form-group">
						<label class="form-control-label">FullName </label> 
						<input type="text" class="form-control" name="fullName" value="${doctor.fullName}" > 
					</div>
					<div class="row">
						<div class="col-md-6">
						<!-- yyyy-MM-dd -->
							<label class="block form-control-label">Date of Birth</label> <p class="text-danger">
							<input type="date" class="form-control" name="dob" value="${doctor.dob}"> 
						</div>

						<div class="col-md-6">
							<label class="block form-control-label">Faculty: ${doctor.faculty.name}</label> 
							<select name="facultyId" class="form-control">
									<option value="-1">Choose Faculty</option>
								<c:forEach var="faculty" items="${faculties}">
									<option value="${faculty.id}">${faculty.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<button type="submit"
						class="btn btn-success waves-effect waves-light m-r-30">Submit
					</button>
					<input type="hidden" name="action" value="edit-doctor"/>
					<input type="hidden" name="roleId" value="2"/>
					
				</form>
			</div>
		</div>
	</jsp:attribute>
</mt:AdminLayout>