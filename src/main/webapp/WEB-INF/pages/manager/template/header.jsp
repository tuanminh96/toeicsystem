<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />


<style type="text/css">
/* -----------------------------------------
   Timeline
----------------------------------------- */
.timeline {
	list-style: none;
	padding-left: 0;
	position: relative;
}

.timeline:after {
	content: "";
	height: auto;
	width: 1px;
	background: #e3e3e3;
	position: absolute;
	top: 5px;
	left: 30px;
	bottom: 25px;
}

.timeline.timeline-sm:after {
	left: 12px;
}

.timeline li {
	position: relative;
	padding-left: 70px;
	margin-bottom: 20px;
}

.timeline li:after {
	content: "";
	width: 12px;
	height: 12px;
	border-radius: 50%;
	background: #e3e3e3;
	position: absolute;
	left: 24px;
	top: 5px;
}

.timeline li .timeline-date {
	display: inline-block;
	width: 100%;
	color: #a6a6a6;
	font-style: italic;
	font-size: 13px;
}

.timeline.timeline-icons li {
	padding-top: 7px;
}

.timeline.timeline-icons li:after {
	width: 32px;
	height: 32px;
	background: #fff;
	border: 1px solid #e3e3e3;
	left: 14px;
	top: 0;
	z-index: 11;
}

.timeline.timeline-icons li .timeline-icon {
	position: absolute;
	left: 23.5px;
	top: 7px;
	z-index: 12;
}

.timeline.timeline-icons li .timeline-icon [class*=glyphicon] {
	top: -1px !important;
}

.timeline.timeline-icons.timeline-sm li {
	padding-left: 40px;
	margin-bottom: 10px;
}

.timeline.timeline-icons.timeline-sm li:after {
	left: -5px;
}

.timeline.timeline-icons.timeline-sm li .timeline-icon {
	left: 4.5px;
}

.timeline.timeline-advanced li {
	padding-top: 0;
}

.timeline.timeline-advanced li:after {
	background: #fff;
	border: 1px solid #29b6d8;
}

.timeline.timeline-advanced li:before {
	content: "";
	width: 52px;
	height: 52px;
	border: 10px solid #fff;
	position: absolute;
	left: 4px;
	top: -10px;
	border-radius: 50%;
	z-index: 12;
}

.timeline.timeline-advanced li .timeline-icon {
	color: #29b6d8;
}

.timeline.timeline-advanced li .timeline-date {
	width: 75px;
	position: absolute;
	right: 5px;
	top: 3px;
	text-align: right;
}

.timeline.timeline-advanced li .timeline-title {
	font-size: 17px;
	margin-bottom: 0;
	padding-top: 5px;
	font-weight: bold;
}

.timeline.timeline-advanced li .timeline-subtitle {
	display: inline-block;
	width: 100%;
	color: #a6a6a6;
}

.timeline.timeline-advanced li .timeline-content {
	margin-top: 10px;
	margin-bottom: 10px;
	padding-right: 70px;
}

.timeline.timeline-advanced li .timeline-content p {
	margin-bottom: 3px;
}

.timeline.timeline-advanced li .timeline-content .divider-dashed {
	padding-top: 0px;
	margin-bottom: 7px;
	width: 200px;
}

.timeline.timeline-advanced li .timeline-user {
	display: inline-block;
	width: 100%;
	margin-bottom: 10px;
}

.timeline.timeline-advanced li .timeline-user:before, .timeline.timeline-advanced li .timeline-user:after
	{
	content: " ";
	display: table;
}

.timeline.timeline-advanced li .timeline-user:after {
	clear: both;
}

.timeline.timeline-advanced li .timeline-user .timeline-avatar {
	border-radius: 50%;
	width: 32px;
	height: 32px;
	float: left;
	margin-right: 10px;
}

.timeline.timeline-advanced li .timeline-user .timeline-user-name {
	font-weight: bold;
	margin-bottom: 0;
}

.timeline.timeline-advanced li .timeline-user .timeline-user-subtitle {
	color: #a6a6a6;
	margin-top: -4px;
	margin-bottom: 0;
}

.timeline.timeline-advanced li .timeline-link {
	margin-left: 5px;
	display: inline-block;
}

.timeline-load-more-btn {
	margin-left: 70px;
}

.timeline-load-more-btn i {
	margin-right: 5px;
}

/* -----------------------------------------
   Dropdown
----------------------------------------- */
.dropdown-menu {
	padding: 0 0 0 0;
}

a.dropdown-menu-header {
	background: #f7f9fe;
	font-weight: bold;
	border-bottom: 1px solid #e3e3e3;
}

.dropdown-menu>li a {
	padding: 10px 20px;
}

/* -----------------------------------------
   Badge
----------------------------------------- */
.badge {
	padding: 3px 5px 2px;
	position: absolute;
	top: 8px;
	right: 5px;
	display: inline-block;
	min-width: 10px;
	font-size: 12px;
	font-weight: bold;
	color: #ffffff;
	line-height: 1;
	vertical-align: baseline;
	white-space: nowrap;
	text-align: center;
	border-radius: 10px;
}

.badge-danger {
	background-color: #db5565;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="">
			<div class="row">
				<div class="navbar-header col-md-3">
					<a class="navbar-brand" href="<c:url value='/admin'/>">BK Toeic
						Admin</a>
				</div>
				<div class="collapse navbar-collapse col-md-9"
					style="float: right; margin-right: 100px;">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<c:url value='/admin/profile' />"> <span
								class="glyphicon glyphicon-user">&nbsp;</span>Xin chào:
								${loggedInUser.hoTen}
						</a></li>
						<li><a href="<c:url value='/signout' />"><span
								class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
						<li>
							<div class="dropdown" style="float: right; padding: 13px">
								<a href="#" onclick="return false;" role="button"
									data-toggle="dropdown" id="dropdownMenu1" data-target="#"
									style="float: left" aria-expanded="true"> <i
									class="fa fa-bell-o"
									style="font-size: 20px; float: left; color: black"> </i>
								</a> <span class="badge badge-danger">6</span>
								<ul class="dropdown-menu dropdown-menu-left pull-right"
									style="left: -100px;"  role="menu"
									aria-labelledby="dropdownMenu1">
									<li role="presentation"><a href="#"
										class="dropdown-menu-header">Notifications</a></li>
									<ul class="timeline timeline-icons timeline-sm"
										style="margin: 10px; width: 210px">
										<li>
											<p>
												Your “Volume Trendline” PDF is ready <a href="">here</a> <span
													class="timeline-icon"><i class="fa fa-file-pdf-o"
													style="color: red"></i></span> <span class="timeline-date">Dec
													10, 22:00</span>
											</p>
										</li>
										<li>
											<p>
												Your “Marketplace Report” PDF is ready <a href="">here</a> <span
													class="timeline-icon"><i class="fa fa-file-pdf-o"
													style="color: red"></i></span> <span class="timeline-date">Dec
													6, 10:17</span>
											</p>
										</li>
										<li>
											<p>
												Your “Top Words” spreadsheet is ready <a href="">here</a> <span
													class="timeline-icon"><i class="fa fa-file-excel-o"
													style="color: green"></i></span> <span class="timeline-date">Dec
													5, 04:36</span>
											</p>
										</li>
									</ul>
									<li role="presentation"><a href="#"
										class="dropdown-menu-header"></a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>