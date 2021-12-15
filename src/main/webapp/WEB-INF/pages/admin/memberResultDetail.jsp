<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
				<th></th>
			</tr>
		</thead>
		<tbody id="listUserOfGroup">
			<c:forEach items="${members}" var="member">
				<tr>
					<td class="center">${member.memId}</td>
					<td class="center"><a
						href="${pageContext.request.contextPath}/admin/">${member.memName}</a></td>
					<td class="center">${member.fullName}</td>
					<button type="button" class="btn btn-info">Info</button>
					<button type="button" class="btn btn-warning">Warning</button>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
</body>
</html>