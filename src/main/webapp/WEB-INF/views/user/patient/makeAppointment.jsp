<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<mt:PatientLayout title="patient">
	<jsp:attribute name="content">
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
	<script>
	$(document).ready(function(){
		
		$('#faculty').change(function(){
			var facultyId = $(this).val(); //$(this) là cái combobox đang chọn, .val(): lấy giá trị ra
			if(facultyId == -1){
				$('#doctor').empty();
			}else{
				$.ajax({
					type: 'GET',
					url: '${pageContext.request.contextPath}/ajaxFacultyDoctor',
					data: {
						facultyId: facultyId // Gửi QueryString qua cho Servlet Ajax xử lý
					},
					success: function(doctors){ // Servlet trả về dữ liệu json cities
						var s = '';
						for(var i=0; i<doctors.length; i++){
							s += '<option value="'+ doctors[i].id +'">' + doctors[i].fullName + '</option>';
						}
						$('#doctor').html(s);		
					}
				})
			}	
		})
	});
</script>

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
							<li class="breadcrumb-item"><a href="#">Make An Appointment</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- Header end -->

			<!-- FORM START -->
			<div style="text-align: center; margin-top: 50px;">
				<h2 style="margin-bottom: 15px">Make An Appointment With Doctor</h2>
				<h6 class="text-success">${msgCreateSuccess}</h6>
				<h6 class="text-danger">${msgCreateFailed}</h6>

				<form action="${pageContext.request.contextPath}/patient?action=make-appointment"
					method="post" style="display: inline-block; text-align: left; padding: 50px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 60%; max-width: 800px;">
					<label class="block form-control-label">Choose Faculty you want</label> 
					<select id="faculty" name="facultyId" class="form-control">
						<option value="-1">Select Faculty</option>
						<c:forEach var="faculty" items="${faculties}">
							<option value="${faculty.id}">${faculty.name}</option>
						</c:forEach>
					</select> <br>
					
					<label class="block form-control-label">Choose Doctor you want:</label> 
						<select id="doctor" name="doctorId" class="form-control">
							<!-- LOAD DỮ LIỆU TỪ AJAX -->	
						</select>
					<br>
					
					<label class="block form-control-label">Date</label> 
					<input type="date" class="form-control" name="date"> 
					<br>
					
					<label class="block form-control-label">Time</label> 
					<input type="time" class="form-control" name="time"> 
					<br>
					<label class="block form-control-label">Content</label> 
					<textarea
						rows="4" cols="36" class="form-control" name="content"></textarea>

					<br>

					<button type="submit" class="btn btn-success">Make An Appointment</button>
					<input type="hidden" name="action" value="make-appointment">
				</form>

			</div>

			<!-- FORM START -->

				</div>
			</div>
		</div>
	</jsp:attribute>
</mt:PatientLayout>