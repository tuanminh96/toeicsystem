<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdn.materialdesignicons.com/3.7.95/css/materialdesignicons.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/admin/quanlyGroup.js'/>"></script>
</head>
<style>
body {
	color: #6c7293;
}

.profile-navbar .nav-item .nav-link {
	color: #6c7293;
}

.profile-navbar .nav-item .nav-link.active {
	color: #464dee;
}

.profile-navbar .nav-item .nav-link i {
	font-size: 1.25rem;
}

.profile-feed-item {
	padding: 1.5rem 0;
	border-bottom: 1px solid #e9e9e9;
}

.img-sm {
	width: 43px;
	height: 43px;
}
</style>
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

.nav.navbar-nav.navbar-right li a {
	color: white !important;
}

.navbar-brand {
	color: #9d9d9d !important;
}

.navbar-expand-sm {
	justify-content: space-between;
}

.leftbar {
	background-color: #343a40 !important
}

.comment-text {
	font-size: x-small;
	width: 90%;
}

.commentlist {
	display: flex;
	justify-content: space-between;
}
</style>
<body>
	<nav class="navbar navbar-light navbar-expand-sm sticky-top bg-dark">
		<a class="navbar-brand" href="<c:url value='/admin'/>">BK Toeic
			Admin</a>
		<div class="col-md-9 collapse navbar-collapse"
			style="float: right; margin-right: 30px;">
			<ul class="navbar-nav nav navbar-right ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/admin/profile' />"> <i
						class="fa fa-user-o" aria-hidden="true"></i> Xin chào:
						${loggedInUser.hoTen }
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/signout' />"><i class="fa fa-sign-out"
						aria-hidden="true"></i> Đăng xuất</a></li>
				<li class="nav-item">
					<div class="dropdown" style="float: right; padding: 13px">
						<a href="#" onclick="return false;" role="button"
							data-toggle="dropdown" id="dropdownMenu1" data-target="#"
							style="float: left" aria-expanded="true"> <i
							class="fa fa-bell-o"
							style="font-size: 20px; float: left; color: black"> </i>
						</a> <span class="badge badge-danger">6</span>
						<ul class="dropdown-menu dropdown-menu-left pull-right"
							style="left: -100px;" role="menu" aria-labelledby="dropdownMenu1">
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
	</nav>
	<div class="row">
		<div class="leftbar col-md-2">
			<a href="${pageContext.request.contextPath}/admin/group">Back</a>
		</div>
		<div class="col-md-10">
			<div class="card container">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="border-bottom text-center pb-4">
								<img style="width: 70%;"
									src="https://cla.hust.edu.vn/xmedia/2014/05/ky-nang-lam-phan-nghe-trong-bai-thi-toeic.png"
									alt="profile" class="img-lg rounded-circle mb-3">
								<div class="mb-3">
									<h3>${group.name}</h3>
									<input type="hidden" value="${group.idGroup}" id="idGroup">
									<input type="hidden" value="${pageContext.request.contextPath}"
										id="appContext">
									<div class="d-flex align-items-center justify-content-center">
										<div class="br-wrapper br-theme-css-stars">
											<select id="profile-rating" name="rating" autocomplete="off"
												style="display: none;">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
											<div class="br-widget">
												<a href="#" data-rating-value="1" data-rating-text="1"
													class="br-selected br-current"></a><a href="#"
													data-rating-value="2" data-rating-text="2"></a><a href="#"
													data-rating-value="3" data-rating-text="3"></a><a href="#"
													data-rating-value="4" data-rating-text="4"></a><a href="#"
													data-rating-value="5" data-rating-text="5"></a>
											</div>
										</div>
									</div>
								</div>
								<p class="w-75 mx-auto mb-3">${group.description}</p>
							</div>


							<div class="py-4">
								<p class="clearfix">
									<span class="float-left"> Chủ nhóm</span> <span
										class="float-right text-muted">
										${group.createAdmin.username} </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Email </span> <span
										class="float-right text-muted">
										${group.createAdmin.email} </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Ngày tạo </span> <span
										class="float-right text-muted"> ${group.createDate} </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Số thành viên </span> <span
										class="float-right text-muted"> ${group.totalMem} </span>
								</p>
							</div>
							<div class="card">
								<h5 class="card-header">Bài đăng được quan tâm</h5>
								<div class="card-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="share border bg-white">
								<div class="d-flex flex-row inputs p-2 py-4">
									<input type="text" class="border-0 form-control share-input"
										placeholder="Share your thoughts">
								</div>
								<div class="d-flex flex-row justify-content-between border-top">
									<div class="d-flex flex-row publish-options">
										<div class="align-items-center border-right p-2 share">
											<i class="fa fa-camera text-black-50"></i><span class="ml-1">Photo</span>
										</div>
										<div class="align-items-center border-right p-2 share">
											<i class="fa fa-file text-black-50"></i><span class="ml-1">Files</span>
										</div>
									</div>
									<div class="publish-button"
										style="background-color: aliceblue;">
										<div
											class="align-items-center border-left p-2 px-5 btn publish">
											<span class="ml-1">Đăng</span>
										</div>
									</div>
								</div>
							</div>
							<div class="mt-4 py-2 border-top border-bottom">
								<ul class="nav profile-navbar">
									<li class="nav-item"><a class="nav-link active" href="#">
											<i class="mdi mdi-newspaper"></i> Feed
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#"> <i
											class="mdi mdi-calendar"></i> Bài giao
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="memberlist"> <i class="mdi mdi-calendar"></i> Thành
											viên
									</a></li>
								</ul>
							</div>
							<div class="appendContent">
								<div class="profile-feed">
									<div class="d-flex align-items-start profile-feed-item">
										<img
											src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
											alt="profile" class="img-sm rounded-circle">
										<div class="ml-4">
											<h6>
												<a href="#"> tuanminh96 </a> <i style="color: blue;"
													class="fa fa-star" aria-hidden="true"></i><small
													class="ml-4 text-muted"><i
													class="mdi mdi-clock mr-1"></i>10 hours</small>
											</h6>
											<h4>Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</h4>
											<p>Mình gửi các bạn tham khảo nhé.</p>
											<a href="https://tienganhmoingay.com/meo-thi-toeic/">https://tienganhmoingay.com/meo-thi-toeic/</a>
											<p class="small text-muted mt-2 mb-0">
												</span> <span class="ml-2"> <i class="mdi mdi-comment mr-1"></i>11
												</span>
											<div class="bg-light p-2">
												<div class="d-flex flex-row align-items-start">
													<img class="rounded-circle"
														src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
														width="30">
													<textarea class="form-control ml-1 shadow-none textarea"></textarea>
												</div>
												<div class="mt-2 text-right">
													<button class="btn btn-primary btn-sm shadow-none"
														type="button">Post comment</button>
												</div>
											</div>
											<div class="box-footer box-comments"
												style="padding: 10px; background-color: #f8f9fa; border-top: outset;">
												<div class="box-comment">
													<div class="flex-row align-items-start commentlist">
														<img class="rounded-circle"
															src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
															width="30">
														<div class="comment-text">
															<span class="username"> <a href="#">tuanmino96</a>
																: <span class="ml-4 text-muted pull-right"
																style="font-size: 10px;">8:03 PM</span>
															</span>
															<p>Thank you so much</p>
														</div>
													</div>
												</div>
												<div class="box-comment">
													<div class="flex-row align-items-start commentlist">
														<img class="rounded-circle"
															src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
															width="30">
														<div class="comment-text">
															<span class="username"> <a href="#">chutuanthanh</a>
																: <span class="ml-4 text-muted pull-right"
																style="font-size: 10px;">8:03 PM</span>
															</span>
															<p>Bai viet that huu ich</p>
														</div>
													</div>
												</div>
											</div>
											<!-- Card -->

											</p>

										</div>
									</div>

									<div class="d-flex align-items-start profile-feed-item">
										<img class="rounded-circle"
											src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
											width="30">
										<div class="ml-4">
											<h6>
												<a href="#">phanhai99</a> <small class="ml-4 text-muted"><i
													class="mdi mdi-clock mr-1"></i>10 hours</small>
											</h6>
											<h3></h3>
											<p>
												Cho mình hỏi câu này chọn đáp án nào nhỉ:<br></br>The ode
												was original (A) a ceremonial (B) poem written to (C)
												celebrate public occasions or (D) exalted subjects.
											</p>
											<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
												alt="sample" class="rounded mw-100">
											<p class="small text-muted mt-2 mb-0">
												<span> <i class="mdi mdi-star mr-1"></i>4
												</span> <span class="ml-2"> <i class="mdi mdi-comment mr-1"></i>11
												</span> <span class="ml-2"> <i class="mdi mdi-reply"></i>
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>