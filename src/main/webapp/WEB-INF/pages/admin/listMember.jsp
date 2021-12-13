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
	<input id="appContext" type="hidden"
		value="${pageContext.request.contextPath}">
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
		<tbody id="listUserOfGroup">
			<c:forEach items="${members}" var="member">
				<tr>
					<td class="center">${member.memId}</td>
					<td class="center"><a
						href="${pageContext.request.contextPath}/">${member.memName}</a></td>
					<td class="center">${member.fullName}</td>
					<td class="center">${member.dateAdd}</td>
					<td class="center"><a href="#" id="deleteBut"
						idMem="${member.memId}" class="red deleteBaiThiThu"><button
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
					<button type="submit" id="btnAddNewGroup" class="btn btn-primary">Thêm</button>
					<button type="button" style="display: none;" id="btnUpdateExam"
						class="btn btn-primary">Cập nhật</button>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalLabel">Xác nhận</h4>
				</div>
				<div class="modal-body">Bạn có muốn xóa người dùng này khỏi nhóm ?</div>
				<div class="modal-footer">
					<button id="deleteBut" type="button" class="btn btn-danger" id="btnSubmit"
						data-dismiss="modal">Yes</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function () {

	    $('#addMemModal').on('shown.bs.modal', function () {
	        var appContext = $("#appContext").val();
	        $.ajax({
	            type: "GET",
	            contentType: "application/json",
	            url: appContext + "/admin/getVipNotAdded",
	            success: function (result) {
	                var taiKhoanRow = "<p id='nodata'>No data found</p>";
	                $.each(result, function (i, taiKhoan) {
	                    $("#nodata").text("");
	                    taiKhoanRow = taiKhoanRow + '<tr>' +
	                        '<td>' + taiKhoan.id + '</td>' +
	                        '<td>' + taiKhoan.hoTen + '</td>' +
	                        '<td>' + taiKhoan.email + '</td>' +
	                        '<td>' + taiKhoan.soDienThoai + '</td>' +
	                        '<td>' + taiKhoan.diaChi + '</td>';
	                    taiKhoanRow += '<td><label class="form-check-label">';
	                    taiKhoanRow += '<input type="checkbox" class="checkAdd" value="' + taiKhoan.id + '">';
	                    taiKhoanRow += '</label></td>';

	                });
	                $('.taiKhoanVIP tbody').html(taiKhoanRow);
	                $('#example').DataTable();
	            },
	            error: function (e) {
	                alert("Error: ", e);
	                console.log("Error", e);
	            }
	        });
	    });

	    $("#btnAddNewGroup").on('click', function () {
	        var appContext = $("#appContext").val();
	        if (confirm('Bạn có muốn thêm người dùng vào nhóm này ?')) {
	            var list = [];
	            var idGroup = $("#idGroup").val();
	            $(':checkbox:checked').each(function (i) {
	                list[i] = $(this).val();
	            });
	            $.ajax({
	                type: "POST",
	                data: {
	                    listUser: list,
	                    idGroup: idGroup
	                },
	                url: appContext + "/admin/addUserGroup",
	                success: function (result) {
	                    $('#addMemModal').modal('hide');
	                    alert("Thêm thành viên thành công");
	                    $("#listUserOfGroup").html(response);
	                },
	                error: function (e) {
	                    alert("Error: ", e);
	                    console.log("Error", e);
	                }
	            });
	        }
	    });

	    $("#deleteBut").on('click', function (e) {
	        e.preventDefault();
	    	var idUser = $(this).attr('idMem')
	        var appContext = $("#appContext").val();
	        if (confirm('Bạn có muốn xóa người dùng khỏi nhóm này ?')) {
	            var idGroup = $("#idGroup").val();
	            $.ajax({
	                type: "POST",
	                data: {
	                    idUser: idUser,
	                    idGroup: idGroup
	                },
	                url: appContext + "/admin/deleteUserGroup",
	                success: function (result) {
	                    alert("Xóa thành viên thành công");
	                    $("#appendContent").html(result);
	                },
	                error: function (e) {
	                    alert("Error: ", e);
	                    console.log("Error", e);
	                }
	            });
	        }
	    });
	});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
</body>
</html>