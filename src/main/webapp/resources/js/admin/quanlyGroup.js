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
					alert("Send mail")
				}
			});
		}
	});
});