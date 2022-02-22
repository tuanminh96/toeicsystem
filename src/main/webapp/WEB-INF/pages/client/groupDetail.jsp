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
<link rel="stylesheet" href="<c:url value='/css/group.css'/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<c:url value='/js/client/group.js'/>"></script>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	
	<div class="container mainListExam">
		<div class="">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="border-bottom text-center pb-4">
								<img style="width: 70%;"
									src="https://cla.hust.edu.vn/xmedia/2014/05/ky-nang-lam-phan-nghe-trong-bai-thi-toeic.png"
									alt="profile" class="img-lg rounded-circle mb-3">
								<div class="mb-3">
									<h3>${group.name}</h3>
									<input type="hidden" value="${group.idGroup}" id="idGroup">
									<input type="hidden" value="${pageContext.request.contextPath}"
										id="appContext">
								</div>
								<p class="w-75 mx-auto mb-3">${group.description}</p>
							</div>


							<div class="py-4">
								<p class="clearfix">
									<span class="float-left"> Chủ nhóm</span> <span
										class="float-right text-muted">
										${group.createAdmin.username} </span>
								</p>
								<p class="clearfix">
									<span class="float-left"> Email </span> <span
										class="float-right text-muted">
										${group.createAdmin.email} </span>
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
									<ul class="list-group list-group-flush">
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
										<li class="list-group-item">Tổng hợp các mẹo thi TOEIC
											hay nhất đủ 7 phần</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-8">
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
											<i class="fa fa-question-circle"></i><span class="ml-1">Bạn
												đang thắc mắc điều gì ?</span>
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
								</ul>
							</div>
							<div id="appendContent">
								<div class="profile-feed">
									<!-- <div class="d-flex align-items-start profile-feed-item">
										<img
											src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
											alt="profile" class="img-sm rounded-circle">
										<div class="ml-4" style="width: 80%;">
											<h6>
												<a href="#"> tuanminh96 </a> <i style="color: blue;"
													class="fa fa-star" aria-hidden="true"></i><small
													class="ml-4 text-muted"><i
													class="mdi mdi-clock mr-1"></i>10 hours</small>
											</h6>
											<h4>Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</h4>
											<p>Mình gửi các bạn tham khảo nhé.</p>
											<a href="https://tienganhmoingay.com/meo-thi-toeic/">https://tienganhmoingay.com/meo-thi-toeic/</a>
											<p class="small text-muted mt-2 mb-0">
												</span> <span class="ml-2"> <i class="mdi mdi-comment mr-1"></i>11
												</span>
											<div class="bg-light p-2">
												<div class="d-flex flex-row align-items-start commentlist">
													<img class="rounded-circle"
														src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
														width="30">
													<textarea class="form-control ml-1 shadow-none textarea" style="white-space: pre-wrap;"></textarea>
												</div>
												<div class="mt-2 text-right">
													<button class="btn btn-primary btn-sm shadow-none"
														type="button">Post comment</button>
												</div>
											</div>
											<div class="box-footer box-comments"
												style="padding: 10px; background-color: #f8f9fa; border-top: outset;">
												<div class="box-comment">
													<div class="flex-row align-items-start commentlist">
														<img class="rounded-circle"
															src="https://aui.atlassian.com/aui/latest/docs/images/avatar-person.svg"
															width="30">
														<div class="comment-text">
															<span class="username"> <a href="#">chutuanthanh</a>
																: <span class="ml-4 text-muted pull-right"
																style="float: right;font-size: 10px;">8:03 PM</span>
															</span>
															<p>Bai viet that huu ich</p>
														</div>
													</div>
												</div>
											</div>
											Card
											</p>
										</div>
									</div> -->
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
													<c:if test="${loggedInUser.id == post.post.user.id}">
													<a href="#" class="deletepost" idPost="${post.post.idPost}"><i class="fa fa-trash" aria-hidden="true" style="color: red;float: right;font-size: 20px;"></i></a>														
													</c:if>
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
																		style="float: right;font-size: 10px;">8:03 PM</span>
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
		</div>
		<!-- Event main -->
		<jsp:include page="template/footer.jsp"></jsp:include>
		<script src="<c:url value='/js/client/post.js'/>"></script>
</body>
</html>