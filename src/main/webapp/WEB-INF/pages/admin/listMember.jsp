<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Danh sánh thành viên nhóm</h2>
	<button class="btn btn-success btnAdd" data-toggle="modal"
		data-target="#addMemModal" id="#addMemModal">Thêm thành viên</button>
	
	<h4 style="color: red" id="info-success"></h4>
	<input id="appContext" type="hidden" value="${pageContext.request.contextPath}">
	<table class="table table-hover nhanHieuTable" id="tableMember">
		<thead>
			<tr>
				<th>ID</th>
				<th>Tên đăng nhập</th>
				<th>Tên thành viên</th>
				<th>Giới tính</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${members}" var="member">
				<tr>
					<td class="center">${member.id}</td>
					<td class="center"><a
						href="${pageContext.request.contextPath}/">${member.username}</a></td>
					<td class="center">${member.hoTen}</td>
					<td class="center">${member.gender}</td>
					<td class="center">${member.gender}</td>
					<td class="center"><a id="" class="red deleteBaiThiThu"><button
								class="delete btn btn-danger">Xóa</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="addMemModal" tabindex="-1" role="dialog"
		aria-labelleby="myModalLable">
		<div class="modal-dialog" role="document" style="max-width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Thêm mới thành viên
						VIP vào nhóm</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="listMemberVIP.jsp"></jsp:include>
				</div>
				<input type="hidden" id="appContext"
					value="${pageContext.request.contextPath}">
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" id="btnAddNewGrou" class="btn btn-primary">Thêm</button>
					<button type="button" style="display: none;" id="btnUpdateExam"
						class="btn btn-primary">Cập nhật</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#addMemModal').on('shown.bs.modal', function () {
				var appContext = $("#appContext").val();
				$.ajax({
					type: "GET",	
					contentType : "application/json",
					url: appContext+"/admin/getVipNotAdded",
					success: function(result){
						var taiKhoanRow = "<p id='nodata'>No data found</p>";
						$.each(result, function(i, taiKhoan){
							$("#nodata").text("");
							taiKhoanRow = taiKhoanRow + '<tr>' +
							                  '<td>' + taiKhoan.id+ '</td>' +
							                  '<td>' + taiKhoan.hoTen + '</td>' +
							                  '<td>' + taiKhoan.email + '</td>' +
							                  '<td>' + taiKhoan.soDienThoai + '</td>' +
							                  '<td>' + taiKhoan.diaChi + '</td>';				  
							  taiKhoanRow +='<td><button class="btn btn-danger btnXoa" >Xóa</button></td>';			;				                  
							
						});
						$('.taiKhoanVIP tbody').html(taiKhoanRow);
						$('#example').DataTable();
					},
					error : function(e){
						alert("Error: ",e);
						console.log("Error" , e );
					}
				});
			});
		});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
</body>
</html>