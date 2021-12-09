<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Exam</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
<script src="<c:url value='/js/admin/quanlyGroup.js'/>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	integrity="sha512-37T7leoNS06R80c8Ulq7cdCDU5MNQBwlYoy1TX/WUsLFC2eYNqtKlV0QjH7r8JpG/S0GUMZwebnVFLPd6SU5yg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />
</head>
<style>
.error {
	color: #F00;
	background-color: #FFF;
}
</style>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header">Quản lý các nhóm của
			${loggedInUser.hoTen}</h3>

		<button class="btn btn-success btnAddExam" data-toggle="modal"
			data-target="#addGrModal">Thêm nhóm</button>
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
					<th>Tên nhóm</th>
					<th>Ngày tạo</th>
					<th>Số thành viên</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="appendGroup">
				<jsp:include page="listGroupAdmin.jsp"></jsp:include>
			</tbody>
			<tbody>
			</tbody>
		</table>
	</div>

	<!-- Modal -->

	<div class="modal fade" id="addGrModal" tabindex="-1" role="dialog"
		aria-labelleby="myModalLable">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Thêm mới Nhóm học</h4>
				</div>
				<form role="form" id="formAddGroup">
					<div class="modal-body">
						<input style="display: none" id="idExam">
						<div class="row">
							<span class="bg-danger" id="vocab_errors"></span>

							<div class="form-group col-md-12">
								<label>Tên nhóm:</label> <input id="nameGroup" name="nameGroup"
									class="form-control" placeholder="Nhập tên nhóm bạn muốn tạo">
							</div>
							<div class="form-group col-md-9">
								<label>Ảnh nhóm:</label> <input id="image" name=""
									class="form-control">
							</div>
							<div class="form-group col-md-3">
								<label>Số thành viên tối đa:</label> <input id="maxmem"
									name="maxmem" class="form-control">
							</div>
							<div class="form-group col-md-12">
								<label for="comment">Mô tả nhóm:</label>
								<textarea class="form-control" rows="5" id="describe"
									name="describe"></textarea>
							</div>
						</div>
					</div>
					<input type="hidden" id="appContext"
						value="${pageContext.request.contextPath}">
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" id="btnAddNewGrou" class="btn btn-primary">Thêm
							nhóm</button>
						<button type="button" style="display: none;" id="btnUpdateExam"
							class="btn btn-primary">Cập nhật</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End modal -->

	<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>