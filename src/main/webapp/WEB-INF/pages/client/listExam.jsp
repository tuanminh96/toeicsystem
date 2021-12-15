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

<!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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


        #datepicker {
            width: 180px;
            margin: 0 20px 20px 20px;
        }

        #datepicker > span:hover {
            cursor: pointer;
        }

        /* Handle config CSS*/
        .mainListExam {
            margin: 75px;
        }
    </style>

<script type="text/javascript">
        $(document).ready(function () {
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

            $('#btnLamBaiThi').click(function () {
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

		<div class="" style="text-align: center">
			<div class="page-header">
				<h4 style="font-weight: bold;">DANH SÁCH BÀI THI THỬ</h4>
			</div>
		</div>

		<!-- /. PAGE TITLE-->
		<div class="row">
			<div class="col-md-9">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<select
							class="mdb-select md-form colorful-select dropdown-primary">
							<option value="1">--Lựa chọn độ khó --</option>
							<option value="2">Dễ</option>
							<option value="3">Trung bình</option>
							<option value="4">Khó</option>
						</select>
					</div>
					<input type="text" class="form-control"
						placeholder="Nhập tên để tìm kiếm">
					<div class="input-group-append">
						<button class="btn btn-success" type="submit">Search</button>
					</div>
				</div>
				<div class="divToChange" style="padding: 0px 20px;">
					<c:if test="${fn:length(listData) == 0 }">
						<h3>Không tìm thấy dữ liệu</h3>
					</c:if>

					<c:forEach items="${listData}" var="list" varStatus="loop">
						<div class="col-md-12 post">
							<div class="">
								<div class="row">
									<h3 class="col-md-10">
										<strong><a id="namebaithithu"
											href="http://www.jquery2dotnet.com/2013/12/cool-share-button-effects-styles.html"
											class="post-title">${list.tenbaithithu}</a></strong>
									</h3>
									<label style="padding-top: 25px;" class="col-md-2"><i
										style="color: green;" class="fas fa-check-circle"></i> Đã thi</label>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 post-header-line">
									<i class="fa fa-user" aria-hidden="true"></i> by <a href="#">${list.userAdd.username}</a>
									| <i class="fa fa-calendar" aria-hidden="true"></i>
									${list.dateAdd} | <i class="fa fa-eye" aria-hidden="true"></i>
									${list.countTest } | <span class="glyphicon glyphicon-tags">
									</span>Level :<span class="label label-info">${list.level}</a>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<a href="#"> <img style="width: 100%;" class="imageExam"
										src="${pageContext.request.contextPath}/resources/file/exams/${list.baithithuid}/images/${list.anhbaithithu}" />
									</a>
								</div>
								<div class="col-md-9" style="padding: 25px;">
									<p>${list.description}</p>
									<div style="margin-bottom: 10px;"
										id="rating${list.baithithuid}" count="${list.countRate}">
										<c:forEach var="i" begin="1" end="${list.countRate}">
											<span class="fa fa-star checked"></span>
										</c:forEach>
										<c:forEach var="i" begin="1" end="${5- list.countRate}">
											<span class="fa fa-star "></span>
										</c:forEach>
										<span
											style="font-family: cursive; margin-left: 10px; color: brown;">4.57/5</span>
									</div>
									<p>
										<button class="btn btn-primary openModalExam"
											value="${list.baithithuid}" id="openModalExam.${loop.index}">
											Chi tiết</button>
									</p>
								</div>
							</div>
						</div>
						<br>
					</c:forEach>
					<br>
				</div>
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
	
	<%--<jsp:include page="include/footerHome.jsp"></jsp:include>--%>
	<jsp:include page="template/footer.jsp"></jsp:include>
	<script type="text/javascript">
	$("#viewTopRating").on('click', function (e) {
		e.preventDefault();
        var appContext = $("#baseUrl").val();
        $.ajax({
            type: "GET",
            url: appContext + "/getTopRating",
            success: function (result) {
                $(".divToChange").html(result);
                $(".paging").hide();
            },
            error: function (e) {
                alert("Error: ", e);
                console.log("Error", e);
            }
        });
    });
</script>
</body>

</html>