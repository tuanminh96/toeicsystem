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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/paging.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->

<!-- Inline CSS based on choices in "Settings" tab -->
<style>
.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p,
	.bootstrap-iso form {
	font-family: Arial, Helvetica, sans-serif;
	color: black
}

.bootstrap-iso form button, .bootstrap-iso form button:hover {
	color: white !important;
}

.asteriskField {
	color: red;
}
</style>
<style>
.checked {
	color: orange;
}
</style>
<style type="text/css">
.hidden {
	display: none;
}

.error-message {
	color: red;
}

.anchor {
	display: block;
	height: 115px; /*same height as header*/
	margin-top: -115px; /*same height as header*/
	visibility: hidden;
}

.imageExam {
	float: left;
	height: 150px;
	width: 250px;
	margin-bottom: 25px;
}

<
style>label {
	margin-left: 20px;
}

#datepicker {
	width: 180px;
	margin: 0 20px 20px 20px;
}

#datepicker>span:hover {
	cursor: pointer;
}
</style>
</style>

<script type="text/javascript">
	$(document).ready(function() {

		var buttons = document.getElementsByClassName('openModalExam');

		for (var i = 0; i < buttons.length; i++) {
			buttons[i].addEventListener("click", clickHandler);

		}

		function clickHandler(event) {
			var buttonId = event.target.id;
			var idExam = document.getElementById(buttonId).value;

			$('#examModal').modal('show');
			$('#examModal #idExamModal').val(idExam);

		}

		$('#btnLamBaiThi').click(function() {
			var baseUrl = $('#baseUrl').val();
			var examId = $('#idExamModal').val();
			window.location.href = baseUrl + "/doExam?idExam=" + examId;

		});

	});
</script>

</head>
<body>

	<jsp:include page="template/header.jsp"></jsp:include>
	<input id="baseUrl" value="${pageContext.request.contextPath}"
		style="display: none;" />
	<div class="container">
		<!--PAGE TITLE-->
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<select class="mdb-select md-form colorful-select dropdown-primary">
					<option value="1">--Lựa chọn độ khó --</option>
					<option value="2">Dễ</option>
					<option value="3">Trung bình</option>
					<option value="4">Khó</option>
				</select>
			</div>
			<input type="text" class="form-control" placeholder="Nhập tên để tìm kiếm">
			<div class="input-group-append">
				<button class="btn btn-success" type="submit">Search</button>
			</div>
		</div>
		<div class="" style="text-align: center">
			<div class="page-header">
				<h4 style="font-weight: bold;">DANH SÁCH BÀI THI THỬ</h4>
			</div>
		</div>

		<!-- /. PAGE TITLE-->
		
		<div class="row">

			<div class="col-md-8">
				<c:if test="${fn:length(listData) == 0 }">
					<h3>Không tìm thấy dữ liệu</h3>
				</c:if>

				<c:forEach items="${listData}" var="list" varStatus="loop">

					<div class="col-md-12">
						<div class="col-md-4">
							<img class="imageExam"
								src="${pageContext.request.contextPath}/resources/file/exams/${list.baithithuid}/images/${list.anhbaithithu}" />
						</div>
						<div class="col-md-12">
							<div class="" style="display: flex;">
								<div class="col-md-6">
									<h4 class="content-heading" id="namebaithithu">
										${list.tenbaithithu}</h4>
									<p>Lượt thi:</p>
									<p>Ngày đăng:</p>
								</div>
								<div class="col-md-6">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
							</div>

							<button class="btn btn-primary openModalExam"
								value="${list.baithithuid}" id="openModalExam.${loop.index}">
								Chi tiết</button>
						</div>


					</div>

				</c:forEach>

				<br>
			</div>

			<jsp:include page="template/leftbar.jsp"></jsp:include>
		</div>
	</div>




	<!--Pagination-->
	<c:if test="${listData.size() != 0}">

		<div class="paging">
			<c:if test="${currentPage != 1}">
				<a href="/webtoeic/listExam?page=${currentPage-1}">Back</a>
			</c:if>
			<c:if test="${currentPage == 1}">
				<a class="current">1</a>
			</c:if>

			<c:if test="${currentPage != 1}">
				<a href="/webtoeic/listExam?page=1">1</a>
			</c:if>

			<c:forEach var="pag" items="${pageList}" varStatus="loop">
				<c:if test="${currentPage == pag}">
					<a class="current">${pag}</a>
				</c:if>
				<c:if test="${currentPage != pag}">
					<a href="/webtoeic/listExam?page=${pag}">${pag}</a>
				</c:if>
			</c:forEach>

			<c:if test="${currentPage != totalPage}">
				<a href="/webtoeic/listExam?page=${currentPage+1} " class="pageNext">Next</a>
			</c:if>
		</div>
	</c:if>



	<!--/.End Pagination-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Modal -->
	<!-- Modal -->
	<!-- New modal -->
	<!-- Modal -->
	<div class="modal fade" id="examModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">HƯỚNG DẪN LÀM
						BÀI THI THỬ</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input class="hidden" id="idExamModal">
					<p>Bài thi thử gồm 2 phần: (100 câu hỏi)</p>
					<img style="float: left"
						src="https://img.icons8.com/nolan/64/000000/reading.png"> <br>
					<p>Phần 1: Listening skills (30 phút - 50 câu hỏi)</p>
					<br> <img style="float: left"
						src="https://img.icons8.com/nolan/64/000000/reading.png"> <br>
					<p>Phần 2: Reading skills (45 phút - 50 câu hỏi)</p>

					<br>
					<p>Bài thi được thực hiện sau khi xác nhận làm bài thi</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="btnLamBaiThi">Làm
						bài</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="include/footerHome.jsp"></jsp:include>

	<!-- Include Date Range Picker -->
</body>

</html>