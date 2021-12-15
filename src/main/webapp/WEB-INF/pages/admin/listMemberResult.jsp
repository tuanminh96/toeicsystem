<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="appContext"
		value="${pageContext.request.contextPath}">
	<h3>Xem kết quả thi của thành viên</h3>

	<div class="alert alert-warning alert-dismissible fade show"
		role="alert">
		<strong>Hướng dẫn:</strong> Nhấn vào tên thành viên để xem kết quả chi
		tiết.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<h4 style="color: red" id="info-success"></h4>
	<input id="appContext" type="hidden"
		value="${pageContext.request.contextPath}">
	<table class="table table-hover nhanHieuTable" id="tableMember">
		<thead>
			<tr>
				<th>ID</th>
				<th>Tên đăng nhập</th>
				<th>Tên thành viên</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="listUserOfGroup">
			<c:forEach items="${members}" var="member">
				<tr>
					<td class="center">${member.memId}</td>
					<td class="center"><a href="" data-toggle="modal" data-target="#viewResult"
						>${member.memName}</a></td>
					<td class="center">${member.fullName}</td>
					<td class="center"><button type="button" class="btn btn-info" 
					data-toggle="modal" data-target="#viewResultStatics">Xem thống kê
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="viewResult" tabindex="-1" role="dialog"
		aria-labelleby="myModalLable">
		<div class="modal-dialog" role="document" style="max-width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Lịch sử dự thi của
						${member.fullName}</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="listMemberVIP.jsp"></jsp:include>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="viewResultStatics" tabindex="-1"
		role="dialog" aria-labelleby="myModalLable">
		<div class="modal-dialog" role="document" style="max-width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Thống kê kết quả thi của</h4>
				</div>
				<div class="modal-body">
				<label for="comment">Tuần từ: 12/13/2021 - 12/19/2021</label>
					<div class="form-group"><img src="https://damienbod.files.wordpress.com/2013/12/serializationtests01.png?w=640"></div>
					<div class="form-group">
						<h5>Đánh giá</h5>
						<textarea class="form-control" rows="5" id="comment"></textarea>
					</div>
				</div>
				<input type="hidden" id="appContext"
					value="${pageContext.request.contextPath}">
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger" id="">Gửi</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {

	});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
</body>
</html>