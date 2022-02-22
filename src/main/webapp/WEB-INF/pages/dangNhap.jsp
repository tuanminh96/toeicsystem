<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<style>
body {
	margin-top: 20px;
	background: #f6f9fc;
}

.account-block {
	padding: 0;
	background-image:
		url(https://www.testcenter.vn/blog/wp-content/uploads/2020/11/Banner-002.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
	position: relative;
	background-position: center;
	background-size: 80%;
}

.account-block .overlay {
	-webkit-box-flex: 1;
	-ms-flex: 1;
	flex: 1;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.4);
}

.account-block .account-testimonial {
	text-align: center;
	color: #fff;
	position: absolute;
	margin: 0 auto;
	padding: 0 1.75rem;
	bottom: 3rem;
	left: 0;
	right: 0;
}

.text-theme {
	color: #5369f8 !important;
}

.btn-theme {
	background-color: #5369f8;
	border-color: #5369f8;
	color: #fff;
}
</style>
<body>
	<div id="main-wrapper" class="container">
		<div class="row justify-content-center">
			<div class="col-xl-10">
				<div class="card border-0">
					<div class="card-body p-0">
						<div class="row no-gutters">
							<div class="col-lg-6">
								<div class="p-5">
									<div class="mb-5">
										<h3 class="h4 font-weight-bold text-theme">TRANG ĐĂNG NHẬP</h3>
									</div>
									<c:if test="${param.error != null}">
										<div class="alert alert-danger">
											<p>Tên đăng nhập hoặc mật khẩu không đúng.</p>
										</div>
									</c:if>
									<c:if test="${param.logout != null}">
										<div class="alert alert-success">
											<p>Bạn đã đăng xuất thành công.</p>
										</div>
									</c:if>
									<c:if test="${param.accessDenied != null}">
										<div class="alert alert-danger">
											<p>Bạn không có quyền truy cập vào trang này</p>
										</div>
									</c:if>
									<c:if test="${param.invalidSession != null}">
										<div class="alert alert-danger">
											<p>Phiên đăng nhập đã kết thúc. Vui lòng đăng nhập lại</p>
										</div>
									</c:if>
									<h6 class="h5 mb-0">Chào mừng bạn đến với trang đăng nhập của BK-TOEIC</h6>
									<p class="text-muted mt-2 mb-5">Hãy nhập email và mật khẩu
										của bạn để truy cập hệ thống</p>
									<c:set var="contextPath"
										value="${pageContext.request.contextPath}" />
									<form lass="login-form" method="POST" action="${contextPath}/login">
										<div class="form-group">
											<label for="exampleInputEmail1">Địa chỉ Email</label> <input
												type="email" class="form-control" id="exampleInputEmail1" placeholder="Email" name="email" required="required">
										</div>
										<div class="form-group mb-5">
											<label for="exampleInputPassword1">Mật khẩu</label> <input
												type="password" class="form-control"
												id="exampleInputPassword1" placeholder="Mật khẩu" name="password" required="required">
										</div>
										<button type="submit" class="btn btn-theme">Đăng nhập</button>
									</form>
								</div>
							</div>

							<div class="col-lg-6 d-none d-lg-inline-block">
								<div class="account-block rounded-right">
									<div class="overlay rounded-right"></div>
									<div class="account-testimonial">
										<p class="lead text-white">"It does not matter where you
											go and what you study, what matters most is what you share
											with yourself and the world."</p>
										<p>- Santosh Kalwar</p>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- end card-body -->
				</div>
				<!-- end card -->
				<p class="text-muted text-center mt-3 mb-0">
					Bạn không có tài khoản? <a href="<c:url value='/register'/>"
						class="text-primary ml-1">Đăng ký ngay</a>
				</p>
				<!-- end row -->
			</div>
			<!-- end col -->
		</div>
		<!-- Row -->
	</div>
</body>
</html>