<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danh sách bài thi thử</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h3>TOP ĐỀ THI NHIỀU LƯỢT THI</h3>
	<c:if test="${fn:length(listData) == 0 }">
		<h3>Không tìm thấy dữ liệu</h3>
	</c:if>
	<c:forEach items="${listData}" var="list" varStatus="loop">
		<div class="col-md-12 post">
			<div class="row">
				<div class="col-md-12">
					<h3>
						<strong><a id="namebaithithu"
							href="http://www.jquery2dotnet.com/2013/12/cool-share-button-effects-styles.html"
							class="post-title">${list.tenbaithithu}</a></strong>
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 post-header-line">
					<i class="fa fa-user" aria-hidden="true"></i> by <a href="#">${list.userAdd.username}</a>
					| <i class="fa fa-calendar" aria-hidden="true"></i> ${list.dateAdd}
					| <i class="fa fa-eye" aria-hidden="true"></i> ${list.countTest } |
					<span class="glyphicon glyphicon-tags"> </span>Level :<span
						class="label label-info">${list.level}</a>
				</div>
			</div>
			<div class="row post-content">
				<div class="col-md-3">
					<a href="#"> <img style="width: 100%;" class="imageExam"
						src="${pageContext.request.contextPath}/resources/file/exams/${list.baithithuid}/images/${list.anhbaithithu}" />
					</a>
				</div>
				<div class="col-md-9" style="padding: 25px;">
					<p>Đề thi thử của Hội đồng TOEIC năm 2020</p>
					<div id="rating${list.baithithuid}" count="${list.countRate}">
						<c:forEach var="i" begin="1" end="${list.countRate}">
							<span class="fa fa-star checked"></span>
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5- list.countRate}">
							<span class="fa fa-star"></span>
						</c:forEach>
					</div>
					<p>
						<button class="btn btn-primary openModalExam"
							value="${list.baithithuid}" id="openModalExam.${loop.index}">
							Chi tiết</button>
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
	<br>
</body>
</html>