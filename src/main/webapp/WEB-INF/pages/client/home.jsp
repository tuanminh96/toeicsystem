<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>


<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/home.js"></script>


</head>
<body>

	<!--Header
==========================-->

	<jsp:include page="template/header.jsp"></jsp:include>

	<!--/End Headter-->

	<!-- Search -->

	<div class="container">

		<div class="row">

			<br>
			<div class="col-md-12">
				<div class="navbar  pull-right">
					<div id="size">
						<form name="myform"></form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End search -->

	<div class="container" id="resultsearch">
		<input style="display: none;" id="nameUser"
			value="${pageContext.request.userPrincipal.name}" /> <input
			style="display: none;" id="baseUrl"
			value="${pageContext.request.contextPath}">
		<!--Carousel
  ==================================================-->
		<!-- slide 1 là để cứng. 2 slide còn lại dùng for each. load từ database lên -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">

				<div class="carousel-item active">
					<div class="container">
						<div class="row">

							<div class="col-md-6">
								<div class="carousel-caption">
									<h1>Giải đáp chi tiết các đề thi</h1>
									<p class="lead">Chỉ với 300.000VNĐ/1 Tháng, bạn sẽ được mở
										khóa chức năng này.</p>
									<c:if test="${pageContext.request.userPrincipal.name == null}">
										<a href="<%=request.getContextPath()%>/login"
											class="btn btn-large btn-primary" href="#" id="modal1">Tham
											gia</a>
									</c:if>
									<c:if test="${pageContext.request.userPrincipal.name != null}">
										<a class="btn btn-large btn-primary openModalFunction doExam"
											href="#">Thi thử ngay</a>
									</c:if>
								</div>
							</div>

							<div class="col-md-6">
								<img
									src="${pageContext.request.contextPath}/resources/file/images/slide/aaa.jpg"
									alt="img not found aab" />
							</div>
						</div>
					</div>
				</div>
				<c:forEach items="${listslidebanner}" var="list">
					<div class="carousel-item">
						<div class="container">
							<div class="row">

								<div class="col-md-6">
									<div class="carousel-caption">
										<h1>${list.getSlidename()}</h1>
										<p class="lead">${list.getSlidecontent()}</p>

										<c:if test="${pageContext.request.userPrincipal.name == null}">

											<c:if test="${list.getSlideimage() == 'slide2'}">
												<a href="<%=request.getContextPath()%>/login"
													class="btn btn-large btn-primary openModalFunction"
													id="modal2">Tham gia</a>
											</c:if>
											<c:if test="${list.getSlideimage() == 'slide3'}">
												<a href="<%=request.getContextPath()%>/login"
													class="btn btn-large btn-primary doExam ">Tham gia</a>
											</c:if>

										</c:if>
										<c:if test="${pageContext.request.userPrincipal.name != null}">

											<c:choose>
												<c:when test="${list.getSlideimage() == 'slide2'}">
													<a class="btn btn-large btn-primary doExam">Thi thử
														ngay</a>
												</c:when>

												<c:otherwise>
													<a class="btn btn-large btn-primary  doExam">Thi thử
														ngay</a>
												</c:otherwise>
											</c:choose>

										</c:if>
									</div>

								</div>

								<div class="col-md-6">
									<img
										src="${pageContext.request.contextPath}/resources/file/images/slide/${list.getSlideimage()}.jpg">
								</div>

							</div>
						</div>
					</div>


				</c:forEach>

			</div>
			<!-- Carousel nav -->
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			<!-- /.Carousel nav -->

		</div>
		<!-- /Carousel -->

		<!-- Feature 
  ==============================================-->


		<div class="row feature-box">
			<div class="span12 cnt-title">
				<h1>Cung cấp các giao diện học và thi thân thiện.</h1>
				<span>--- Học thử, Làm bài tập, Thi thử ---</span>
			</div>

			<div class="col-md-4">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/feature-vocabulary1.jpg">

				<h2>Học từ vựng, ngữ pháp</h2>
				<p>Các bài hướng dẫn đơn giản, dễ hiểu.</p>
				<a href="#" id="modal1" class="openModalFunction">Chi tiết
					&rarr;</a>

			</div>

			<div class="col-md-4">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/feature-listenandread.jpg">
				<h2>Bài tập phần nghe, đọc</h2>
				<p>Sử dụng các dạng bài tập thường xuyên xuất hiện.</p>
				<a href="#" id="modal2" class="openModalFunction">Chi tiết
					&rarr;</a>
			</div>

			<div class="col-md-4">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/feature-lamdethithu.jpg"
					height="170px" width="270px">
				<h2>Đề thi thử</h2>
				<p>Cập nhật, đổi mới liên tục, sát với đề thi thật nhất.</p>
				<a href="#" class="doExam" id="doExam">Chi tiết &rarr;</a>
			</div>
		</div>


		<!-- /.Feature -->

		<div class="hr-divider"></div>

		<!-- Row View -->


		<div class="row">
			<div class="col-md-8">
				<img
					src="${pageContext.request.contextPath}/resources/file/images/background3.png">
			</div>

			<div class="col-md-4">
				<!--   <img class="hidden-phone" src="Template/Frontend/img/icon4.png" alt="img not found"> -->
				<h1 align="center">Tin cậy - uy tín</h1>
				<p align="justify">Mỗi năm, có hàng nghìn lượt học viên đã tham
					dự các khóa học tiếng Anh tại CFL và đạt kết quả như ý muốn. Chúng
					tôi tự hào là một trong những trung tâm ngoại ngữ được yêu thích,
					là địa chỉ tin cậy của các bạn SV Bách Khoa, Kinh tế, Xây dựng,
					Ngân hàng... và nhiều người đi làm trên địa bàn Hà Nội.</p>

			</div>
		</div>


	</div>


	<!-- /.Row View -->



	<!--Footer
==========================-->
	<jsp:include page="include/footerHome.jsp"></jsp:include>
	<!--/.Footer-->


	<!-- Start Modal -->

	<div class="modal fade" id="openModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">DANH SÁCH LOẠT BÀI HƯỚNG DẪN</h4>
				</div>

				<div class="modal-body">

					<div class="media">
						<a class="pull-left"><img src="" id="image1"
							class="media-object" /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name1" name="name1"></a>
							</h3>
						</div>
					</div>

					<div class="media">
						<a class="pull-left"><img src="" id="image2"
							class="media-object" /></a>
						<div class="media-body">
							<h3>
								<a href="" id="name2" name="name2"></a>
							</h3>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Thoát</button>
				</div>

			</div>
		</div>
	</div>
	<!-- End Modal -->

</body>
</html>