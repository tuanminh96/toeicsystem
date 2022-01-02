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
	$("#memberResult").on('click', function(e) {
		e.preventDefault();
		var idGroup = $("#idGroup").val();
		var appContext = $("#appContext").val();
		$.ajax({
			url: appContext+"/admin/group_detail/listMemberResult/"+idGroup+"",
			success : function(response) {
				$("#appendContent").html(response);
			}
		});
	});
	$("#feed").on('click', function(e) {
		e.preventDefault();
		var idGroup = $("#idGroup").val();
		var appContext = $("#appContext").val();
		$.ajax({
			url: appContext+"/newFeed/"+idGroup+"",
			success : function(response) {
				$("#appendContent").html(response);
			}
		});
	});
	$("#addPost").on('click', function(e) {
		e.preventDefault();
		var idGroup = $("#idGroup").val();
		var appContext = $("#appContext").val();
		console.log($("#content").val());
		var group = {
				idGroup: idGroup
		};
		var post = {
				title: $("#title").val(),
				content: $("#content").val(),
				group: group
		};
		$.ajax({
			url: appContext+"/admin/savePost",
			type : 'POST',
			data : JSON.stringify(post),
			contentType: "application/json",
			success : function(response) {
				$("#appendContent").html(response);
				$("#title").val("");
				$("#content").val("");
			},error: function () {
    			console.log("Có lỗi xảy ra vui lòng thử lại");
    		}
		});
	});
	$(".deletepost").on('click', function(e) {
        e.preventDefault();
    	var idPost = $(this).attr('idPost')
        var appContext = $("#appContext").val();
        if (confirm('Bạn có muốn xóa bài đăng này ?')) {
            var idGroup = $("#idGroup").val();
            $.ajax({
                type: "GET",
                url: appContext + "/deletePost/"+idPost,
                success: function (result) {
                    alert("Xóa bài đăng thành công");
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