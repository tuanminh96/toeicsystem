<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/style.css'  />" />

<style>
#header-row {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 60px;
	margin-bottom: 15px;
	z-index: 999;
}

span.notification-badge {
	position: relative;
	top: -10px;
	right: 10px;
	border: white 1px solid;
}

.radio-inline {
	display: inline-flex;
	padding-left: 35px;
}

input[type=radio] {
	margin-right: 5px;
}

h3 {
	margin: 0;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var down = false;
		$('#box').css('display', 'none');
		$('#bell').click(function(e) {
			var color = $(this).text();
			if (down) {
				$('#box').css('height', '0px');
				$('#box').css('opacity', '0');
				$('#box').css('display', 'none');
				down = false;
			} else {
				$('#box').css('height', 'auto');
				$('#box').css('opacity', '1');
				$('#box').css('display', 'block');
				down = true;
			}
		});
	});
</script>
</head>

<body>
	<!--HEADER ROW-->
	<div id="header-row">
		<div class="container">
			<div class="row">
				<!--LOGO-->
				<div class="col-md-4">
					<a class="brand" href="/webtoeic"><img style="height: 40px;"
						src="/webtoeic/resources/file/images/logotest.png" /></a>
				</div>
				<!-- /LOGO -->

				<!-- MAIN NAVIGATION -->
				<div class="col-md-8" style="padding-left: 150px;">
					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link active"
							href="/webtoeic">Trang chủ</a></li>
						<c:if test="${pageContext.request.userPrincipal.name == null}">
							<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/signin">Đăng nhập</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/register">Đăng ký</a></li>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<c:if test="${pageContext.request.isUserInRole('MEMBER')}" >
								<li class="nav-item"><a class="nav-link"
														href="<%=request.getContextPath()%>/listExam">Thi thử</a></li>
								<li class="nav-item" style="background: gold;"><a
										class="nav-link"
										href="${pageContext.request.contextPath}/list_group"
										style="color: black;">Học nhóm</a></li>
							</c:if>
							<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>

							<div class="navbar-nav flex-row  d-none d-md-flex"
								style="margin-left: 20px;">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown"
									href="#">${nguoiDung.hoTen}</a>
									<div class="dropdown-menu">
										<c:if test="${pageContext.request.isUserInRole('MEMBER')}" >
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/profile">Tài khoản</a> <a
											class="dropdown-item"
											href="<%=request.getContextPath()%>/payment">Nâng cấp VIP</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/listnoti/1">Thông báo</a>
										</c:if>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/signout">Thoát</a>
									</div></li>
								<div class="nav-item" style="padding: 0 10px">
									<a class="nav-link" href="#" rel="noopener" aria-label="GitHub"
										id="bell"> <i class="fa fa-lg fa-bell"></i> <span
										class="notification-badge badge badge-danger">1</span>
									</a>
									<div class="notifications" id="box">
										<h2>
											Notifications - <span>2</span>
										</h2>
										<div class="notifications-item">
											<img src="https://i.imgur.com/uIgDDDd.jpg" alt="img">
											<div class="text">
												<h4>Samso aliao</h4>
												<p>Samso Nagaro Like your home work</p>
											</div>
										</div>
										<div class="notifications-item">
											<img
												src="https://img.icons8.com/flat_round/64/000000/vote-badge.png"
												alt="img">
											<div class="text">
												<h4>John Silvester</h4>
												<p>+20 vista badge earned</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</ul>
				</div>
				<!-- MAIN NAVIGATION -->
			</div>
		</div>
	</div>