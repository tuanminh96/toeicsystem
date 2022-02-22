<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdn.materialdesignicons.com/3.7.95/css/materialdesignicons.min.css">
<script src="<c:url value='/js/admin/quanlyGroup.js'/>"></script>
</head>
<style>
body {
	margin-top: 20px;
}

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
<body>
	<div class="profile-feed">
		<c:forEach items="${listpost}" var="post">
			<div class="d-flex align-items-start profile-feed-item">
				<img
					src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
					alt="profile" class="img-sm rounded-circle">
				<div class="ml-4" style="width: 80%;">
					<h6>
						<a href="#"> ${post.post.user.username} </a>
						<c:if test="${post.post.user.role.code == 1}">
							<i style="color: blue;" class="fa fa-star" aria-hidden="true"></i>
						</c:if>
						<small class="ml-4 text-muted"><i
							class="mdi mdi-clock mr-1"></i>${post.timePost}</small> <a href="#" class="deletepost" idPost="${post.post.idPost}"><i
							class="fa fa-trash" aria-hidden="true"
							style="color: red; float: right; font-size: 20px;"></i></a>
					</h6>

					<h4>${post.post.title}</h4>
					<p>${post.post.content}</p>
					<p class="small text-muted mt-2 mb-0">
						</span> <span class="ml-2"> <i class="mdi mdi-comment mr-1"></i>${post.totalComment}
						</span>
					<div class="bg-light p-2">
						<div class="d-flex flex-row align-items-start">
							<img class="rounded-circle"
								src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
								width="30">
							<textarea class="form-control ml-1 shadow-none textarea"></textarea>
						</div>
						<div class="mt-2 text-right">
							<button class="btn btn-primary btn-sm shadow-none" type="button">Post
								comment</button>
						</div>
					</div>
					<div class="box-footer box-comments"
						style="padding: 10px; background-color: #f8f9fa; border-top: outset;">
						<c:forEach items="${post.post.comments}" var="comment">
							<div class="box-comment">
								<div class="flex-row align-items-start commentlist">
									<img class="rounded-circle"
										src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
										width="30">
									<div class="comment-text">
										<span class="username"> <a href="#">tuanmino96</a> : <span
											class="ml-4 text-muted pull-right" style="font-size: 10px;">8:03
												PM</span>
										</span>
										<p>Thank you so much</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- Card -->
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- Event main -->
</body>
</html>