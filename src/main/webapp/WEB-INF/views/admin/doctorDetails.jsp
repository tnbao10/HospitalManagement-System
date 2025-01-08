<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<mt:AdminLayout title="admin">
	<jsp:attribute name="content">
		<c:forEach var="role" items="${roles}">
			<tr>
				<th>Id</th>
				<th>Name</th>
			</tr>
			<tr>
				<td>${role.id}</td>
				<td>${role.name}</td>
			</tr>
		</c:forEach>
	</jsp:attribute>
</mt:AdminLayout>