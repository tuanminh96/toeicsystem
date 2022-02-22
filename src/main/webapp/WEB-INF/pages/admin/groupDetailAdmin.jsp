<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdn.materialdesignicons.com/3.7.95/css/materialdesignicons.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	integrity="sha512-37T7leoNS06R80c8Ulq7cdCDU5MNQBwlYoy1TX/WUsLFC2eYNqtKlV0QjH7r8JpG/S0GUMZwebnVFLPd6SU5yg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet prefetch"
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<script src="<c:url value='/js/admin/quanlyGroup.js'/>"></script>
</head>
<link rel="stylesheet" href="<c:url value='/css/group.css'/>">
<body>
	<nav class="navbar navbar-light navbar-expand-sm sticky-top bg-dark">
		<a class="navbar-brand" href="<c:url value='/admin'/>">BK Toeic
			Admin</a>
		<div class="col-md-9 collapse navbar-collapse"
			style="float: right; margin-right: 30px;">
			<ul class="navbar-nav nav navbar-right ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/admin/profile' />"> <i
						class="fa fa-user-o" aria-hidden="true"></i> Xin chào:
						${loggedInUser.username }
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/signout' />"><i class="fa fa-sign-out"
						aria-hidden="true"></i> Đăng xuất</a></li>
				<li class="nav-item">
					<div class="dropdown" style="float: right; padding: 13px">
						<a href="#" onclick="return false;" role="button"
							data-toggle="dropdown" id="dropdownMenu1" data-target="#"
							style="float: left" aria-expanded="true"> <i
							class="fa fa-bell-o"
							style="font-size: 20px; float: left; color: black"> </i>
						</a> <span class="badge badge-danger"></span>
						<ul class="dropdown-menu dropdown-menu-left pull-right"
							style="left: -100px;" role="menu" aria-labelledby="dropdownMenu1">
							<li role="presentation"><a href="#"
								class="dropdown-menu-header">Notifications</a></li>
							<ul class="timeline timeline-icons timeline-sm"
								style="margin: 10px; width: 210px">
								<li>
									<p>
									</p>
								</li>
							</ul>
							<li role="presentation"><a href="#"
								class="dropdown-menu-header"></a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<div class="row">
		<div class="leftbar col-md-2">
			<a href="${pageContext.request.contextPath}/admin/group">Back</a>
		</div>
		<div class="col-md-10">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-3">
							<div class="border-bottom text-center pb-4">
								<img style="width: 70%;"
									src="https://cla.hust.edu.vn/xmedia/2014/05/ky-nang-lam-phan-nghe-trong-bai-thi-toeic.png"
									alt="profile" class="img-lg rounded-circle mb-3">
								<div class="mb-3">
									<h4>[${group.groupCode}]</h4>
									<h4><input class="form-control" type="text" id="name_group" value="${group.name}"></h4>
									<input type="hidden" value="${group.idGroup}" id="idGroup">
									<input type="hidden" value="${pageContext.request.contextPath}"
										id="appContext">
								</div>
								<p class="w-75 mx-auto mb-3"><input class="form-control" type="text" id="name_group" value="${group.description}"/></p>
								<p class="w-75 mx-auto mb-3"><i class="fa fa-pencil" aria-hidden="true"></i></p>
							</div>


							<div class="py-4">
								<p class="clearfix">
									<span class="float-left"> Chủ nhóm</span> 
									<span class="float-right text-muted">${group.createAdmin.username} </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Email </span> 
									<span class="float-right text-muted">${group.createAdmin.email} </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Ngày tạo </span> <span
										class="float-right text-muted"> <fmt:formatDate pattern="dd-MM-yyyy" value="${group.createDate}" /> </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Số thành viên </span> <span
										class="float-right text-muted"> ${group.totalMem} </span>
								</p>
							</div>
							<div class="card">
								<h5 class="card-header">Bài đăng được quan tâm</h5>
								<div class="card-body">
<!-- 									<ul class="list-group list-group-flush">
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
									</ul> -->
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="share border bg-white">
								<div class=" flex-row inputs">
									<input type="text" class=" form-control share-input"
										placeholder="Nhập tiêu đề cho bài viết" id="title">
									<div class="form-group purple-border">
										<label
											style="font-size: 12px; margin-left: 10px; color: cadetblue;"
											for="exampleFormControlTextarea4"> Nội dung</label>
										<textarea class="form-control"
											id="content" rows="3" style="white-space: pre-line"></textarea>
									</div>
								</div>
								<div class="d-flex flex-row justify-content-between border-top">
									<div class="d-flex flex-row publish-options">
										<div class="align-items-center border-right p-2 share">
											<i class="fa fa-question-circle"></i><span class="ml-1">Bạn muốn chia sẻ điều với nhóm ?</span>
										</div>
									</div>
									<div class="publish-button"
										style="background-color: aliceblue;">
										<div id="addPost"
											class="align-items-center border-left p-2 px-5 btn publish">
											<span class="ml-1">Đăng</span>
										</div>
									</div>
								</div>
							</div>
							<div class="mt-4 py-2 border-top border-bottom">
								<ul class="nav profile-navbar">
									<li class="nav-item"><a class="nav-link active" href="#"
									id="feed">
											<i class="mdi mdi-newspaper"></i> Bài viết
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="memberlist"> <i class="mdi mdi-account-multiple"></i>
											Thành viên
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#"
										id="memberResult"> <i class="mdi mdi-cloud-check"></i> Kết
											quả học tập
									</a></li>
								</ul>
							</div>
							<div id="appendContent">
								<div class="profile-feed">
									<c:if test="${listpost.size()==0}">
									<p style=" margin: auto;width: 30%;margin-top: 20px; ">Nhóm chưa có bài đăng nào</p>
									</c:if>
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
													<small
														class="ml-4 text-muted"><i
														class="mdi mdi-clock mr-1"></i>${post.timePost}</small>
													<a href="#" class="deletepost" idPost="${post.post.idPost}"><i class="fa fa-trash" aria-hidden="true" style="color: red;float: right;font-size: 20px;"></i></a>														
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
														<button class="btn btn-primary btn-sm shadow-none"
															type="button">Post comment</button>
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
																	<span class="username"> <a href="#">tuanmino96</a>
																		: <span class="ml-4 text-muted pull-right"
																		style="font-size: 10px;">8:03 PM</span>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value='/js/client/post.js'/>"></script>
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>

</html>