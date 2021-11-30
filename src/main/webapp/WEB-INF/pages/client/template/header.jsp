
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
<link rel="stylesheet" href="<c:url value='/css/style.css'  />" />


<style>
span.notification-badge {
	position: relative;
	top: -10px;
	right: 10px;
	border: $white 1px solid;
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

		$('#bell').click(function(e) {

			var color = $(this).text();
			if (down) {

				$('#box').css('height', '0px');
				$('#box').css('opacity', '0');
				down = false;
			} else {

				$('#box').css('height', 'auto');
				$('#box').css('opacity', '1');
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
				<div class="col-md-6">
					<a class="brand" href="/webtoeic"><img
						src="/webtoeic/resources/file/images/logotest.png" /></a>
				</div>
				<!-- /LOGO -->

				<!-- MAIN NAVIGATION -->
				<div class="col-md-6">
					<ul class="nav nav-pills">
						<li class="nav-item"><a class="nav-link active"
							href="/webtoeic">Trang chủ</a></li>
						<c:if test="${pageContext.request.userPrincipal.name == null}">
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/signin">Contact</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/signin">Đăng nhập</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/register">Đăng ký</a></li>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/listExam">Thi thử</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
						</c:if>

						<div class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">${nguoiDung.hoTen}</a>
								<div class="dropdown-menu">
									<a class="dropdown-item"
										href="<%=request.getContextPath()%>/profile">Tài khoản</a> <a
										class="dropdown-item" href="#">Nâng cấp VIP</a> <a
										class="dropdown-item"
										href="<%=request.getContextPath()%>/signout">Thoát</a>
								</div></li>
							<div class="nav-item">
								<a class="nav-link" href="#" rel="noopener"
									aria-label="GitHub" id="bell"> <i class="fa fa-lg fa-bell"></i> <span
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
					</ul>
				</div>

				<!-- MAIN NAVIGATION -->
			</div>
		</div>
	</div>