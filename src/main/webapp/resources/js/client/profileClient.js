$(document).ready(function() {
	$('#historyExam').DataTable({
		language: {
			emptyTable: "Bạn chưa thi bài thi nào."
		},
		lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
		searching: true, // Mặc định là true, set false để tắt chức năng search
		ordering:  true, // Mặc định là true, set false để tắt chức năng sắp xếp theo collumn
		paging: true, // Mặc định là true, set false để tắt chức năng phân trang
		// scrollX: 400, // Nội dụng của table sẽ hiện thị với with 400px, Nếu quá thì sẽ có thanh scroll
		// scrollY: 300, // Nội dụng của table sẽ hiện thị với hieght 400px, Nếu quá thì sẽ có thanh scroll
		processing: true,
		info: false, // Tắt thông tin về table VD: Showing 1 to 14 of 14 entries
	});
	$('#tabs a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	})

	$(document).on('click', '#btnXacNhanDoiMK', function(event) {
		event.preventDefault();
		removeElementsByClass("error");
		ajaxPostChangePass();
	});

	function ajaxPostChangePass() {
		alert(3);
		// PREPATEE DATA
		var data = $('.formDoiMatKhau').serializeFormJSON();
		// do post
		$.ajax({
			async : false,
			type : "POST",
			contentType : "application/json",
			url : "/webtoeic/api/admin/profile/doiMatKhau",
			data : JSON.stringify(data),
			success : function(response) {
				if (response.status == "success") {
					$('#doiMKModal').modal('hide');
					alert("Đổi mật khẩu thành công. Bạn phải đăng nhập lại để xác nhận");
					location.href = "/webtoeic/logout";
				} else {
					$('input').next().remove();
					$.each(response.errorMessages, function(key, value) {
						$('input[name=' + key + ']').after('<span class="error" style="color:red; font-size: 14px; margin-left:5px">' + value + '</span>');
					});
				}
			},
			error : function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		});
	}

	(function($) {
		$.fn.serializeFormJSON = function() {

			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
	})(jQuery);

	function removeElementsByClass(className) {
		var elements = document.getElementsByClassName(className);
		while (elements.length > 0) {
			elements[0].parentNode.removeChild(elements[0]);
		}
	}
})