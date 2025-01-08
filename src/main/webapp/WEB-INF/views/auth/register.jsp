<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="codedthemes">
<meta name="keywords"
	content=", Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="codedthemes">

<!-- Favicon icon -->
<link rel="shortcut icon" href="assets/images/doctor.svg"
	type="image/x-icon">
<link rel="icon" href="assets/images/doctor.svg" type="image/x-icon">

<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700"
	rel="stylesheet">

<!-- Font Awesome -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!--ico Fonts-->
<link rel="stylesheet" type="text/css"
	href="assets/icon/icofont/css/icofont.css">

<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">

<!-- waves css -->
<link rel="stylesheet" type="text/css"
	href="assets/plugins/Waves/waves.min.css">

<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<!-- Responsive.css-->
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">

<!--color css-->
<link rel="stylesheet" type="text/css"
	href="assets/css/color/color-1.min.css" id="color" />
</head>
<body>
	<section
		class="login p-fixed d-flex text-center bg-primary common-img-bg">
		<!-- Container-fluid starts -->
		<div class="container-fluid">
			<div class="row">

				<div class="col-sm-12">
					<div class="login-card card-block">
						<form method="POST" action="${pageContext.request.contextPath}/auth">
							<div class="text-center">
								<img src="assets/images/doctor.svg" width="80" height="85"
									alt="logo">
							</div>
							<h3 class="text-center txt-primary">REGISTER TO YOUR ACCOUNT
							</h3>
							<p class="text-danger">${messageFail}</p>
							<div class="row">
								<div class="col-md-12" style="margin-bottom: 15px;">
									<div>
										<label>Email</label> <span class="text-danger">${msgNullEmail} ${msgErrorEmail}</span>
										<input type="email" class="md-form-control" name="email" required="required" />
									</div>
								</div>
								<div class="col-md-12" style="margin-bottom: 15px;">
									<div>
										<label>Password</label> <span class="text-danger">${msgNullPassword} ${msgErrorPassword}</span>
										<input type="password" class="md-form-control" name="password" required="required" />
									</div>
								</div>
								<div class="col-md-12" style="margin-bottom: 15px;">
									<div>
										<label>Confirm Password</label> <span class="text-danger">${msgNullConfirmPassword}</span>
										<input type="password" class="md-form-control" name="confirmPassword" required="required" />
									</div>
								</div>
								<div class="col-md-12" style="margin-bottom: 15px;">
									<div>
										<label>FullName</label> <span class="text-danger">${msgNullFullName}</span>
										<input type="text" class="md-form-control" name="fullName" required="required" />
									</div>
								</div>
								<div class="col-md-12" style="margin-bottom: 15px;">
									<div>
										<label for="dob">Dob</label> <span class="text-danger">${msgNullDob}</span>
										<input type="date" class="form-control" id="dob" name="dob" required />
									</div>
								</div>


								<div class="col-sm-6 col-xs-12" style="margin-bottom: 15px;">
									<div
										class="rkmd-checkbox checkbox-rotate checkbox-ripple m-b-25">
										<label class="input-checkbox checkbox-primary"> 
											<input type="checkbox" id="checkbox"> <span class="checkbox"></span>
										</label>
										<div class="captions">Remember Me</div>

									</div>
								</div>
								<div class="col-sm-6 col-xs-12 forgot-phone text-right">
									<a href="forgot-password.html" class="text-right f-w-600">
										Forget Password?</a>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-10 offset-xs-1">
									<button type="submit"
										class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
									<input type="hidden" name="action" value="register"> 
									<input type="hidden" name="roleId" value="3">
								</div>
							</div>


						</form>
						<!-- end of form -->
					</div>
					<!-- end of login-card -->
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>

	<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/plugins/tether/dist/js/tether.min.js"></script>

	<!-- Required Fremwork -->
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- waves effects.js -->
	<script src="assets/plugins/Waves/waves.min.js"></script>
	<!-- Custom js -->
	<script type="text/javascript" src="assets/pages/elements.js"></script>

</body>
</html>