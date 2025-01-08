<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<mt:AdminLayout title="admin">
	<jsp:attribute name="content">
		<div class="container-fluid">

			<div class="card-block">
				<h3>Edit Faculty</h3>
				<p class="text-success">${msgEditSuccess}</p>
				<p class="text-danger">${msgEditFailed}</p>

				<form method="POST" action="${pageContext.request.contextPath}/admin">
					<div class="form-group">
						<label class="form-control-label">Id </label> 
						<input type="text" class="form-control" name="facultyId" value="${faculty.id}" readonly> 
					</div>
					<div class="form-group">
						<label class="form-control-label">Name </label> 
						<input type="text" class="form-control" name="facultyName" value="${faculty.name}" > 
					</div>
					
					<button type="submit"
						class="btn btn-success waves-effect waves-light m-r-30">Submit
					</button>
					<input type="hidden" name="action" value="edit-faculty"/>
				</form>
			</div>
		</div>
	</jsp:attribute>
</mt:AdminLayout>