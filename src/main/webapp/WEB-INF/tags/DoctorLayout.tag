<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ attribute name="title" required="true" rtexprvalue="true"
	type="java.lang.String"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<%@ attribute name="content" fragment="true"%>


<html>
<head>
<title>${title}</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<!-- Link -->
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/icon/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="assets/icon/icofont/css/icofont.css">
<link rel="stylesheet" type="text/css"
	href="assets/icon/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/plugins/chartist/dist/chartist.css"
	type="text/css" media="all">
<link href="assets/css/svg-weather.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

</head>

<body class="sidebar-mini fixed">
	<div class="wrapper">
		<header class="main-header-top hidden-print">
			<a href="${pageContext.request.contextPath}/doctor"
				class="logo d-flex align-items-center text-decoration-none"> <img
				src="assets/images/doctor.svg" width="45" height="50"
				style="margin-right: 8px;" /> <span
				style="font-size: 1 rem; font-weight: bold; color: white; font-family: Arial, sans-serif;">
					HealthCare </span>
			</a>

			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#!" data-toggle="offcanvas" class="sidebar-toggle"></a>
				<ul class="top-nav lft-nav">
					<li><a href="#!" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"
						class="dropdown-toggle drop icon-circle drop-image"> <i
							class="fas fa-users"> </i><span> About us</span>
					</a></li>
					<li
						class="dropdown pc-rheader-submenu message-notification search-toggle">
						<a href="#!" id="morphsearch-search"
						class="drop icon-circle txt-white"> <i class="ti-search"></i>
					</a>
					</li>
				</ul>
				<!-- Navbar Right Menu-->
				<div class="navbar-custom-menu f-right">
					<div class="upgrade-button">
						<a href="${pageContext.request.contextPath}/doctor"
							class="icon-circle txt-white btn btn-sm btn-primary upgrade-button">
							<span>Hospital Information</span>
						</a>
					</div>

					<ul class="top-nav">
						<!--Notification Menu-->

						<li class="dropdown notification-menu"><a href="#!"
							data-toggle="dropdown" aria-expanded="false"
							class="dropdown-toggle"> <i class="icon-bell"></i> <span
								class="badge badge-danger header-badge">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="not-head">You have <b class="text-primary">4</b>
									new notifications.
								</li>
								<li class="bell-notification"><a href="javascript:;"
									class="media"> <span class="media-left media-icon">
											<img class="img-circle" src="assets/images/avatar-1.png"
											alt="User Image">
									</span>
										<div class="media-body">
											<span class="block">Lisa sent you a mail</span><span
												class="text-muted block-time">2min ago</span>
										</div>
								</a></li>
								<li class="bell-notification"><a href="javascript:;"
									class="media"> <span class="media-left media-icon">
											<img class="img-circle" src="assets/images/avatar-2.png"
											alt="User Image">
									</span>
										<div class="media-body">
											<span class="block">Server Not Working</span><span
												class="text-muted block-time">20min ago</span>
										</div>
								</a></li>
								<li class="bell-notification"><a href="javascript:;"
									class="media"><span class="media-left media-icon"> <img
											class="img-circle" src="assets/images/avatar-3.png"
											alt="User Image">
									</span>
										<div class="media-body">
											<span class="block">Transaction xyz complete</span><span
												class="text-muted block-time">3 hours ago</span>
										</div></a></li>
								<li class="not-footer"><a href="#!">See all
										notifications.</a></li>
							</ul></li>
						<!-- chat dropdown -->
						<li class="pc-rheader-submenu "><a href="#!"
							class="drop icon-circle displayChatbox"> <i
								class="icon-bubbles"></i> <span
								class="badge badge-danger header-badge">5</span>
						</a></li>
						<!-- window screen -->
						<li class="pc-rheader-submenu"><a href="#!"
							class="drop icon-circle" onclick="javascript:toggleFullScreen()">
								<i class="icon-size-fullscreen"></i>
						</a></li>
						<!-- User Menu-->
						<li class="dropdown"><a href="#!" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false"
							class="dropdown-toggle drop icon-circle drop-image"> <span><img
									class="img-circle " src="assets/images/widget/${sessionScope.photo}"
									style="width: 40px;" alt="User Image"></span> 
							<span>
								${sessionScope.fullName }
								<i class=" icofont icofont-simple-down"></i>
							</span>

						</a>
							<ul class="dropdown-menu settings-menu">
								<li><a href="#!"><i class="icon-settings"></i> Settings</a></li>
								<li><a href="${pageContext.request.contextPath}/doctor?action=profile"><i class="icon-user"></i> Profile</a></li>
								<li><a href="#"><i class="icon-envelope-open"></i> My
										Messages</a></li>
								<li class="p-0">
									<div class="dropdown-divider m-0"></div>
								</li>
								<li><a href="#"><i class="icon-lock"></i> Lock Screen</a></li>
								<li><a href="${pageContext.request.contextPath}/auth?action=logout"><i class="icon-logout"></i>
										Logout</a></li>

							</ul></li>
					</ul>

					<!-- search -->
					<div id="morphsearch" class="morphsearch">
						<form class="morphsearch-form">

							<input class="morphsearch-input" type="search"
								placeholder="Search..." />

							<button class="morphsearch-submit" type="submit">Search</button>

						</form>
						<div class="morphsearch-content">
							<div class="dummy-column">
								<h2>People</h2>
								<a class="dummy-media-object" href="#!"> <img class="round"
									src="http://0.gravatar.com/avatar/81b58502541f9445253f30497e53c280?s=50&d=identicon&r=G"
									alt="Sara Soueidan" />
									<h3>Sara Soueidan</h3>
								</a> <a class="dummy-media-object" href="#!"> <img class="round"
									src="http://1.gravatar.com/avatar/9bc7250110c667cd35c0826059b81b75?s=50&d=identicon&r=G"
									alt="Shaun Dona" />
									<h3>Shaun Dona</h3>
								</a>
							</div>
							<div class="dummy-column">
								<h2>Popular</h2>
								<a class="dummy-media-object" href="#!"> <img
									src="assets/images/avatar-1.png" alt="PagePreloadingEffect" />
									<h3>Page Preloading Effect</h3>
								</a> <a class="dummy-media-object" href="#!"> <img
									src="assets/images/avatar-1.png"
									alt="DraggableDualViewSlideshow" />
									<h3>Draggable Dual-View Slideshow</h3>
								</a>
							</div>
							<div class="dummy-column">
								<h2>Recent</h2>
								<a class="dummy-media-object" href="#!"> <img
									src="assets/images/avatar-1.png" alt="TooltipStylesInspiration" />
									<h3>Tooltip Styles Inspiration</h3>
								</a> <a class="dummy-media-object" href="#!"> <img
									src="assets/images/avatar-1.png" alt="NotificationStyles" />
									<h3>Notification Styles Inspiration</h3>
								</a>
							</div>
						</div>
						<!-- /morphsearch-content -->
						<span class="morphsearch-close"><i
							class="icofont icofont-search-alt-1"></i></span>
					</div>
					<!-- search end -->
				</div>
			</nav>
		</header>

		<aside class="main-sidebar hidden-print">
			<section class="sidebar" id="sidebar-scroll">
				<!-- Sidebar Menu-->
				<ul class="sidebar-menu">
					<li
						style="margin-top: 5px; border-bottom: 1px solid #ddd; padding-bottom: 5px;"
						class="nav-level mb-3">--- Navigation</li>
					<li style="border-bottom: 1px solid #ddd; padding-bottom: 5px;"
						class="treeview"><a class="waves-effect waves-dark"
						href="${pageContext.request.contextPath}/doctor"> <i class="fas fa-file-medical"></i><span>Medical Appointment</span>
					</a></li>
					<li style="border-bottom: 1px solid #ddd; padding-bottom: 5px;"
						class="treeview"><a class="waves-effect waves-dark"
						href="${pageContext.request.contextPath}/doctor?action=profile"> <i class="fas fa-user"></i><span>Your Profile</span>
					</a></li>
					<li class="nav-level">--- Components</li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="#!"><i class="icon-book-open"></i><span> Forms</span><i
							class="icon-arrow-down"></i></a>
						<ul class="treeview-menu">
							<li><a class="waves-effect waves-dark"
								href="form-elements-bootstrap.html"><i
									class="icon-arrow-right"></i> Form Elements Bootstrap</a></li>

							<li><a class="waves-effect waves-dark"
								href="form-elements-advance.html"><i
									class="icon-arrow-right"></i> Form Elements Advance</a></li>
						</ul></li>
				</ul>
		</aside>

		<div class="content-wrapper" >
			<jsp:invoke fragment="content"></jsp:invoke>
			<!-- CONTENT -->
		</div>
	</div>

	<!-- SCRIPT -->
	<script src="assets/plugins/Jquery/dist/jquery.min.js"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/plugins/tether/dist/js/tether.min.js"></script>

	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

	<script src="assets/plugins/classie/classie.js"></script>

	<script src="assets/plugins/notification/js/bootstrap-growl.min.js"></script>

	<script src="assets/plugins/jquery-sparkline/dist/jquery.sparkline.js"></script>

	<script src="assets/plugins/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/plugins/countdown/js/jquery.counterup.js"></script>

	<script src="assets/plugins/charts/echarts/js/echarts-all.js"></script>

	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>

	<script type="text/javascript" src="assets/js/main.min.js"></script>
	<script type="text/javascript" src="assets/pages/dashboard.js"></script>
	<script type="text/javascript" src="assets/pages/elements.js"></script>
	<script src="assets/js/menu.min.js"></script>
	<script>
		var $window = $(window);
		var nav = $('.fixed-button');
		$window.scroll(function() {
			if ($window.scrollTop() >= 200) {
				nav.addClass('active');
			} else {
				nav.removeClass('active');
			}
		});
	</script>
</body>
</html>