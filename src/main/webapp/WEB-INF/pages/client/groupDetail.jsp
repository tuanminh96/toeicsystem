<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdn.materialdesignicons.com/3.7.95/css/materialdesignicons.min.css">

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
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-12">
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
										<div class="d-flex align-items-center justify-content-center">
											<div class="br-wrapper br-theme-css-stars">
												<select id="profile-rating" name="rating" autocomplete="off"
													style="display: none;">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
												<div class="br-widget">
													<a href="#" data-rating-value="1" data-rating-text="1"
														class="br-selected br-current"></a><a href="#"
														data-rating-value="2" data-rating-text="2"></a><a href="#"
														data-rating-value="3" data-rating-text="3"></a><a href="#"
														data-rating-value="4" data-rating-text="4"></a><a href="#"
														data-rating-value="5" data-rating-text="5"></a>
												</div>
											</div>
										</div>
									</div>
									<p class="w-75 mx-auto mb-3">${group.description}</p>
								</div>


								<div class="py-4">
									<p class="clearfix">
										<span class="float-left"> Chủ nhóm</span> <span
											class="float-right text-muted"> ${group.createAdmin.username} </span>
									</p>
									<p class="clearfix">
										<span class="float-left"> Email </span> <span
											class="float-right text-muted"> ${group.createAdmin.email} </span>
									</p>
									<p class="clearfix">
										<span class="float-left"> Ngày tạo </span> <span
											class="float-right text-muted"> ${group.createDate} </span>
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
											<li class="list-group-item">Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</li>
											<li class="list-group-item">Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</li>
											<li class="list-group-item">Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</li>
											<li class="list-group-item">Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-8">
								<div class="share border bg-white">
									<div class="d-flex flex-row inputs p-2 py-4">
										<input type="text" class="border-0 form-control share-input"
											placeholder="Nhập tiêu đề cho bài viết">
										<input type="text" class="border-0 form-control share-input"
											placeholder="Nhập nội dung bài viết">
									</div>
									<div class="d-flex flex-row justify-content-between border-top">
										<div class="d-flex flex-row publish-options">
											<div class="align-items-center border-right p-2 share">
												<i class="fa fa-camera text-black-50"></i><span class="ml-1">Photo</span>
											</div>
										</div>
										<div class="publish-button"
											style="background-color: aliceblue;">
											<div
												class="align-items-center border-left p-2 px-5 btn publish">
												<span class="ml-1">Đăng</span>
											</div>
										</div>
									</div>
								</div>
								<div class="mt-4 py-2 border-top border-bottom">
									<ul class="nav profile-navbar">
										<li class="nav-item"><a class="nav-link active" href="#">
												<i class="mdi mdi-newspaper"></i> Feed
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> <i
												class="mdi mdi-calendar"></i> Bài giao
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#"> <i
												class="mdi mdi-calendar"></i> Thành viên
										</a></li>
									</ul>
								</div>
								<div class="profile-feed">
									<div class="d-flex align-items-start profile-feed-item">
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
											alt="profile" class="img-sm rounded-circle">
										<div class="ml-4">
											<h6>
												tuanminh96<i style="color: blue;" class="fa fa-star"
													aria-hidden="true"></i><small class="ml-4 text-muted"><i
													class="mdi mdi-clock mr-1"></i>10 hours</small>
											</h6>
											<h3>Tổng hợp các mẹo thi TOEIC hay nhất đủ 7 phần</h3>
											<p>Mình gửi các bạn tham khảo nhé.</p>
											<a href="https://tienganhmoingay.com/meo-thi-toeic/">https://tienganhmoingay.com/meo-thi-toeic/</a>
											<p class="small text-muted mt-2 mb-0">
												</span> <span class="ml-2"> <i class="mdi mdi-comment mr-1"></i>11
												</span>
											<div class="bg-light p-2">
												<div class="d-flex flex-row align-items-start">
													<img class="rounded-circle"
														src="https://i.imgur.com/RpzrMR2.jpg" width="40">
													<textarea class="form-control ml-1 shadow-none textarea"></textarea>
												</div>
												<div class="mt-2 text-right">
													<button class="btn btn-primary btn-sm shadow-none"
														type="button">Post comment</button>
													<button
														class="btn btn-outline-primary btn-sm ml-1 shadow-none"
														type="button">Cancel</button>
												</div>
											</div>
											<div class="box-footer box-comments"
												style="padding: 10px; background-color: #f8f9fa; border-top: outset;">
												<div class="box-comment">
													<div class="comment-text">
														<span class="username"> <a href="#">tuanmino96</a>
															: <span class="ml-4 text-muted pull-right"
															style="font-size: 10px;">8:03 PM Today</span>
														</span>
														<p>Thank you so much</p>
													</div>
												</div>
												<div class="box-comment">
													<div class="comment-text">
														<span class="username"> <a href="#">chuthanh99</a>
															: <span class="ml-4 text-muted pull-right"
															style="font-size: 10px;">8:03 PM Today</span>
														</span>
														<p>Thank you so much</p>
													</div>
												</div>
											</div>
											<!-- Card -->

											</p>

										</div>
									</div>

									<div class="d-flex align-items-start profile-feed-item">
										<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
											alt="profile" class="img-sm rounded-circle">
										<div class="ml-4">
											<h6>
												phanhai99 <small class="ml-4 text-muted"><i
													class="mdi mdi-clock mr-1"></i>10 hours</small>
											</h6>
											<h3></h3>
											<p>
												Cho mình hỏi câu này chọn đáp án nào nhỉ:<br></br>The ode
												was original (A) a ceremonial (B) poem written to (C)
												celebrate public occasions or (D) exalted subjects.
											</p>
											<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
												alt="sample" class="rounded mw-100">
											<p class="small text-muted mt-2 mb-0">
												<span> <i class="mdi mdi-star mr-1"></i>4
												</span> <span class="ml-2"> <i class="mdi mdi-comment mr-1"></i>11
												</span> <span class="ml-2"> <i class="mdi mdi-reply"></i>
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>