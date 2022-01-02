<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tài khoản</title>
<style type="text/css">
body {
	background-color: #f5f7fa;
	margin-top: 20px;
}

.card {
	margin-bottom: 24px;
	-webkit-box-shadow: 0 2px 4px rgb(126 142 177/ 10%);
	box-shadow: 0 2px 4px rgb(126 142 177/ 10%);
}

.card {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid #eaedf1;
	border-radius: .25rem;
}

.activity-wid {
	margin-left: 16px;
}

.mb-0 {
	margin-bottom: 0 !important;
}

.list-unstyled {
	padding-left: 0;
	list-style: none;
}

.activity-wid .activity-list {
	position: relative;
	padding: 0 0 33px 30px;
}

.activity-border:before {
	content: "";
	position: absolute;
	height: 38px;
	border-left: 3px dashed #eaedf1;
	top: 40px;
	left: 0;
}

.activity-wid .activity-list .activity-icon {
	position: absolute;
	left: -20px;
	top: 0;
	z-index: 2;
}

.avatar-sm {
	height: 2.5rem;
	width: 2.5rem;
}

.media {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: start;
	-ms-flex-align: start;
	align-items: flex-start;
}

.me-3 {
	margin-right: 1rem !important;
}

.font-size-15 {
	font-size: 15px !important;
}

.font-size-14 {
	font-size: 14px !important;
}

.text-muted {
	color: #74788d !important;
}

.text-end {
	text-align: right !important;
}

.font-size-13 {
	font-size: 13px !important;
}

.avatar-title {
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	height: 100%;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 100%;
}

.bg-soft-primary {
	background-color: rgba(82, 92, 229, .25) !important;
}

.bg-soft-success {
	background-color: rgba(35, 197, 143, .25) !important;
}
/* Handle config CSS*/
.mainListGroup {
	margin: 75px;
}
</style>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container mainListGroup">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-9">
				<link
					href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
					rel="stylesheet" />

				<div class="">
					<h4 class="header-title mb-4">Nhóm của user:
						${nguoiDung.hoTen}</h4>
					<div class="card">
						<div class="card-body">
							<c:if test="${groups.size() == 0}">
								<p>Hãy đợi để admin thêm bạn vào nhóm nhé</p>
							</c:if>
							<c:forEach items="${groups}" var="group">
								<ul class="list-unstyled activity-wid mb-0">
									<li class="activity-list activity-border">
										<div class="activity-icon avatar-sm">
											<img style="width: 70%;"
												src="https://cla.hust.edu.vn/xmedia/2014/05/ky-nang-lam-phan-nghe-trong-bai-thi-toeic.png"
												alt="profile" class="img-lg rounded-circle mb-3">
										</div>
										<div class="media">
											<div class="me-3">
												<h5 class="font-size-15 mb-1">
													<a
														href="${pageContext.request.contextPath}/group_detail/${group.idGroup}">${group.name}</a>
												</h5>
												<p class="text-muted font-size-14 mb-0">${group.totalMem}</p>
											</div>

											<div class="media-body">
												<div class="text-end d-none d-md-block">
													<p class="text-muted font-size-13 mt-2 pt-1 mb-0">
														<i class="fa fa-calendar font-size-15 text-primary"></i>${group.createDate}
													</p>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>

	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>