$(document).ready(function() {
	$.validator.addMethod("validateNameGroup", function(value, element) {
		if (value) {
			return true;
		} else {
			return false;
		}
	});
	$("#formAddGroup").validate({
		rules : {
			nameGroup : {
				required : true
			},
			maxmem : {
				required : true
			}
		},
		messages : {
			nameGroup : {
				required : "Tên không được để trống"
			},
			maxmem : {
				required : "Số lượng thành viên giới hạn không được để trống"
			}
		},
		submitHandler : function(form) {
			var appContext = $("#appContext").val();
			var group = {
					name: $("#nameGroup").val(),
					maxMem: $("#maxmem").val(),
					description: $("#describe").val()
			}
			$.ajax({
				url : appContext+"/admin/addGroup",
				type : 'POST',
				data : JSON.stringify(group),
				contentType: "application/json",
				success : function(response) {
					$('#addGrModal').modal('hide');
					alert("Thêm nhóm thành công");
					$("#appendGroup").html(response);
				},error: function () {
	    			console.log("Có lỗi xảy ra vui lòng thử lại");
	    		}
			});
		}
	});
	
	$("#memberlist").on('click', function(e) {
		e.preventDefault();
		var idGroup = $("#idGroup").val();
		var appContext = $("#appContext").val();
		$.ajax({
			url: appContext+"/admin/group_detail/listMember/"+idGroup+"",
			success : function(response) {
				$("#appendContent").html(response);
			}
		});
	});
	

});