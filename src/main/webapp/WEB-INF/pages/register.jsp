<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
.error {
	color: red;
}
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
										<h3 class="h4 font-weight-bold text-theme">TRANG ĐĂNG KÝ
											TÀI KHOẢN</h3>
									</div>
									<c:set var="contextPath" value="${pageContext.request.contextPath}" />
									<h6 class="h5 mb-0">Chào mừng bạn đến với BK-TOEIC</h6>
									<p class="text-muted mt-2 mb-5">Hãy nhập đầy đủ thông tin
										để tạo tài khoản mới nhé</p>

									<form:form method="POST" action='register' modelAttribute="newUser">
										<div class="form-group">
											<form:input type="email" path="email" class="form-control"
												placeholder="Email" autofocus="true" required="required"></form:input>
											<form:errors class="error" path="email"></form:errors>
										</div>

										<div class="form-group">
											<form:input type="password" path="password"
												class="form-control" required="required"
												placeholder="Mật khẩu"></form:input>
											<form:errors class="error" path="password"></form:errors>
										</div>

										<div class="form-group">
											<form:input type="password" path="confirmPassword"
												class="form-control" placeholder="Nhắc lại mật khẩu"
												required="required"></form:input>
											<form:errors class="error" path="confirmPassword"></form:errors>
										</div>

										<div class="form-group">
											<form:input type="text" path="hoTen" class="form-control"
												placeholder="Họ và tên" required="required"></form:input>
											<form:errors class="error" path="hoTen"></form:errors>
										</div>

										<div class="form-group">
											<form:input type="number" path="soDienThoai"
												class="form-control" placeholder="Số điện thoại"
												required="required"></form:input>
											<form:errors class="error" path="soDienThoai"></form:errors>
										</div>

										<div class="form-group">
											<form:input type="text" path="diaChi" class="form-control"
												placeholder="Địa chỉ" required="required"></form:input>
											<form:errors class="error" path="diaChi"></form:errors>
										</div>
										<button type="submit" class="btn btn-theme">Đăng ký</button>
									</form:form>
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
					Bạn đã có tài khoản? <a href="<c:url value='/login'/>"
						class="text-primary ml-1">Đăng nhập ngay</a>
				</p>
				<!-- end row -->
			</div>
			<!-- end col -->
		</div>
		<!-- Row -->
	</div>
</body>
</html>