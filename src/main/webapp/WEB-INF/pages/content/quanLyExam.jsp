<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Exam</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
</head>
<style>
.error {
	color: #F00;
	background-color: #FFF;
}
/* Tooltip container */
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
}

/* Tooltip text */
.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  padding: 5px 0;
  border-radius: 6px;
 
  /* Position the tooltip text - see examples below! */
  position: absolute;
  z-index: 1;
}

/* Show the tooltip text when you mouse over the tooltip container */
.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<div class="row">
		<jsp:include page="template/sidebar.jsp"></jsp:include>

		<div class="col-md-9 animated bounce">
			<h3 class="page-header">Quản lý bài thi thử Toeic</h3>

			<button class="btn btn-success btnAddExam">Thêm mới</button>
			<h4 style="color: red" id="info-success"></h4>

			<c:if test="${errorInfo != null }">
				<h4 style="color: red" id="info-error">${error}</h4>
				<h4>error: ${errorInfo}</h4>
			</c:if>
			<hr />

			<table class="table table-hover nhanHieuTable" id="tableExam">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tên bài thi thử</th>
						<th>Ngày đăng</th>
						<th>Trạng thái</th>
						<th>Chọn</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<!-- Modal -->

		<div class="modal fade" id="examModal" tabindex="-1" role="dialog"
			aria-labelleby="myModalLable">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="titleModal">Thêm mới Exam</h4>
					</div>
					<form id="formAddExam">
					<div class="modal-body">
						<input style="display: none" id="idExam">
						<div class="row">
							<span class="bg-danger" id="vocab_errors"></span>

							<div class="form-group col-md-6">
								<label>Tên bài thi thử</label> <input id="examTitle" name="examTitle"
									class="form-control">

							</div>
							<div class="form-group col-md-6">
								<label>Level</label> <select class="form-control" id="examLevel" name="examLevel">
									<option value="1">Dễ</option>
									<option value="2">Trung Bình</option>
									<option value="3">Khó</option>
								</select>
							</div>
							<div class="form-group col-md-12">
								<label>Mô tả bài thi</label> <input id="examDescription" name="examDescription"
									class="form-control">
							</div>

							<div class="form-group col-md-6">
								<label>Ảnh bài thi thử</label> <input type="file"
									id="fileThumbnail" class="form-control" required name="fileThumbnail">
							</div>

							<div class="form-group col-md-6">
								<label for="fileExcel">File nội dung (Excel):</label> <input
									type="file" class="form-control" id="fileQuestionExcel"
									name="file_Excel" required >
							</div>

							<div class="form-group col-md-6">
								<label for="fileAnhCauHoi">File ảnh câu hỏi:</label> <input
									type="file" class="form-control" id="fileQuestionImageLst"
									name="file_Image_Question" required  multiple>
							</div>

							<div class="form-group col-md-6">
								<label for="fileNghe">File nghe câu hỏi:</label> <input
									type="file" class="form-control" id="fileQuestionAudioLst"
									name="file_Audio" required multiple>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" id="btnAddNewExam" class="btn btn-primary">Thêm</button>
						<button type="submit" style="display: none;" id="btnUpdateExam"
							class="btn btn-primary">Cập nhật</button>

					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End modal -->
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="<c:url value='/js/admin/quanLyExam.js'/>"></script>
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>