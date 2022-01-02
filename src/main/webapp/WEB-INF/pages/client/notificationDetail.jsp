<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tài khoản</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
</head>
<body>
	<style>
body {
	margin-top: 20px;
	background-color: #f0f2f5;
}

.dropdown-list-image {
	position: relative;
	height: 2.5rem;
	width: 2.5rem;
}

.dropdown-list-image img {
	height: 2.5rem;
	width: 2.5rem;
}

.btn-light {
	color: #2cdd9b;
	background-color: #e5f7f0;
	border-color: #d8f7eb;
}
</style>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container mainListExam">
		<section class="member-details">
		<div class="container">
			<div class="row">				
				<div class="col-lg-3 col-md-4">
				</div>
				<div class="col-lg-9 col-md-8">
					<div class="member_designation">
						<c:set var="notification" scope="session" value="${notification}"/>							
							<c:if test="${notification.type == 'post' || notification.type == 'comment'}">
								<h3>Thông báo từ nhóm</h3>
							</c:if>
							<c:if test="${notification.type == 'remark' || notification.type == 'add_group'}">
								<h3>Thông báo từ quản lý</h3>
							</c:if>
							<span>${notification.dateSend}</span>
					</div>
					<div class="member_desc">
						<p>${notification.content}</p>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>

	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>