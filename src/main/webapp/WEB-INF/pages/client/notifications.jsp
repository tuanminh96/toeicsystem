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
		<div class="row">
			<div class="col-lg-3 left">
				<div class="box shadow-sm mb-3 rounded bg-white ads-box text-center">

				</div>
				<div
					class="box mb-3 shadow-sm rounded bg-white profile-box text-center">

				</div>
			</div>
			<div class="col-lg-9 right">
				<div class="box shadow-sm rounded bg-white mb-3">
					<div class="box-title border-bottom p-3">
						<h6 class="m-0">Danh sách thông báo</h6>
					</div>
					<c:forEach items="${listData}" var="list" varStatus="loop">
						<c:if test="${empty list.dateSeen}">
							<div class="box-body p-0">
								<div
									class="p-3 d-flex align-items-center bg-light border-bottom osahan-post-header">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Circle-icons-mail.svg/768px-Circle-icons-mail.svg.png"
											alt="" />
									</div>
									<div class="font-weight-bold mr-3">
										<a href="<%=request.getContextPath()%>/detailnoti/${list.idNoti}">
											<c:if test="${list.type == 'post' || list.type == 'comment'}">
												<div class="text-truncate">Thông báo từ nhóm</div>
											</c:if>
											<c:if test="${list.type == 'remark' || list.type == 'add_group'}">
												<div class="text-truncate">Thông báo từ quản lý</div>
											</c:if>
											<div class="small">${list.brief}</div></a>
									</div>
									<span class="ml-auto mb-auto" style="display: flex;">
										<div class="btn-group">
										<div class="text-right text-muted pt-1">${list.dateSend}</div>
										<button type="button" class="btn btn-light btn-sm rounded"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="mdi mdi-dots-vertical"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-right">
												<button class="dropdown-item" type="button">
													<i class="mdi mdi-delete"></i> Delete
												</button>
											</div>
										</div>
									</span>
								</div>
							</div>
						</c:if>
						
						<c:if test="${not empty list.dateSeen}">
							<div class="box-body p-0">
								<div
									class="p-3 d-flex align-items-center border-bottom osahan-post-header">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Circle-icons-mail.svg/768px-Circle-icons-mail.svg.png"
											alt="" />
									</div>
									<div class="font-weight-bold mr-3">
										<c:if test="${list.type == 'post' || list.type == 'comment'}">
											<div class="text-truncate">Thông báo từ nhóm</div>
										</c:if>
										<c:if test="${list.type == 'remark' || list.type == 'add_group'}">
											<div class="text-truncate">Thông báo từ quản lý</div>
										</c:if>
										<div class="small">${list.brief}</div>
										<div class="small text-success">
											<i class="fa fa-check-circle"></i> seen
										</div>
									</div>
									<span class="ml-auto mb-auto" style="display: flex;">
										<div type="date" class="text-right text-muted pt-1">${list.dateSend}</div>
										<div class="btn-group">
											<button type="button" class="btn btn-light btn-sm rounded"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="mdi mdi-dots-vertical"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-right">
												<button class="dropdown-item" type="button">
													<i class="mdi mdi-close"></i> Turn Off
												</button>
											</div>
										</div>
									</span>
								</div>						
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>
	<script src="<c:url value='/js/client/profileClient.js'/>"></script>
</body>
</html>