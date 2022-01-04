<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tài khoản</title>

<style>
.mainProfileClient {
	margin-top: 75px;
	margin-bottom: 75px;
}

.formDoiMatKhau, #information {
	margin-top: 20px;
}

.changeInput {
	display: block;
	width: 100%;
	padding: 0.375rem 0;
	margin-bottom: 0;
	font-size: 1rem;
	line-height: 1.5;
	color: #212529;
	background-color: transparent;
	/* border: solid transparent; */
	border-top-style: hidden;
	border-right-style: hidden;
	border-left-style: hidden;
	border-bottom-style: groove;
	border-width: 1px 0;
}

.changePass {
	display: block;
	width: 100%;
	padding: 0.375rem 0;
	margin-bottom: 0;
	font-size: 1rem;
	line-height: 1.5;
	color: #212529;
	background-color: transparent;
	/* border: solid transparent; */
	border-top-style: hidden;
	border-right-style: hidden;
	border-left-style: hidden;
	border-bottom-style: groove;
	border-width: 1px 0;
	margin-top: -10px;
}

textarea:focus, input:focus {
	outline: none;
}

.confirm {
	margin-top: 40px;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container mainProfileClient">
		<h3 class="page-header">Thông tin cá nhân</h3>

		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				href="#information" role="tab" data-toggle="tab">Cập nhật</a></li>
			<li class="nav-item"><a class="nav-link" href="#changePass"
				role="tab" data-toggle="tab">Đổi mật khẩu</a></li>
			<li class="nav-item"><a class="nav-link" href="#history"
				role="tab" data-toggle="tab">Lịch sử dự thi</a></li>
		</ul>
		<div>
			<div class="tab-content">
				<div class="tab-pane active" id="information">
					<form class="form-profile" action="/webtoeic/profile/update"
						method="post">
						<div class="form-group">

							<label style="font-weight: bold" for="staticEmail"
								class="col-sm-2 col-form-label">Email đăng ký</label>
							<div class="col-sm-5">${user.email }</div>
							<c:if test="${pageContext.request.isUserInRole('MEMBER_VIP')}">
								<img class="col-sm-5"
									style="position: absolute; width: 5%; top: 190px; left: 25%;"
									src="https://aboco.vn/wp-content/uploads/2021/05/VIP-1-THANG.png">
							</c:if>

						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<input type="hidden" class="form-control-plaintext nguoiDungId"
									value="${user.id}" name="id">
							</div>
						</div>
						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Tên người dùng</label>
							<div class="col-sm-10">
								<input type="text" class="changeInput" value="${user.username}"
									name="username" required="required" autofocus>
							</div>
							<c:set var="errorupprofile" scope="session" value="${errorupprofile}"/>
							<p style="color: red;">${errorupprofile}</p>
						</div>
						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Họ Tên</label>
							<div class="col-sm-10">
								<input type="text" class="changeInput" value="${user.hoTen}"
									name="hoTen" required="required" autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Số điện thoại</label>
							<div class="col-sm-10">
								<input type="text" class="changeInput"
									value="${user.soDienThoai}" name="soDienThoai"
									required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="staticEmail" style="font-weight: bold"
								class="col-sm-2 col-form-label">Địa chỉ</label>
							<div class="col-sm-10">
								<input type="text" class="changeInput" value="${user.diaChi}"
									name="diaChi" required="required">
							</div>
						</div>
						<div class="confirm">
							<input class="btn btn-primary" id="btnSubmit" type="submit"
								value="Xác nhận" />
						</div>
					</form>
				</div>
				<div class="tab-pane" id="changePass">
					<form class="formDoiMatKhau">
						<div>
							<input class="changeInput" type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
						<div class="form-group">
							<label for="name">Mật khẩu cũ</label> <input type="password"
								class="changePass" name="oldPassword" required="required"
								autofocus />
						</div>
						<div class="form-group">
							<label for="name">Mật khẩu mới</label> <input type="password"
								class="changePass" name="newPassword" required="required" />
						</div>
						<div class="form-group">
							<label for="name">Nhắc lại mật khẩu mới</label> <input
								type="password" class="changePass" name="confirmNewPassword"
								required="required" />
						</div>
						<div class="confirm">
							<input class="btn btn-primary" type="button" id="btnXacNhanDoiMK"
								value="Xác nhận" />
						</div>
					</form>
				</div>
				<div class="tab-pane" id="history" style="padding-top: 20px">
					<c:choose>
						<c:when test="${listExamHistoryDTO != null}">
							<div style="padding-bottom: 20px">Bạn đã thi tổng cộng
								${listExamHistoryDTO.size()} lần và ${totalExam} bài thi.</div>
						</c:when>
					</c:choose>

					<table id="historyExam"
						class="table table-striped table-bordered taiKhoanVIP"
						style="width: 100%">
						<thead>
							<tr>
								<th style="text-align: center">STT</th>
								<th style="text-align: center">Title Exam</th>
								<th style="text-align: center">Date Test</th>
								<th style="text-align: center">Total Time Test</th>
								<th style="text-align: center">Score Listen</th>
								<th style="text-align: center">Score Reading</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listExamHistoryDTO}" var="examHistoryDTO"
								varStatus="index">
								<tr>
									<td style="text-align: center; width: 30px">${index.count}</td>
									<td>${examHistoryDTO.title}</td>
									<td>${examHistoryDTO.dateTest}</td>
									<td>${examHistoryDTO.totalTimeTest}s</td>
									<td>${examHistoryDTO.scoreListen}/${examHistoryDTO.totalScoreListen}</td>
									<td>${examHistoryDTO.scoreReading}/${examHistoryDTO.totalScoreRead}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>