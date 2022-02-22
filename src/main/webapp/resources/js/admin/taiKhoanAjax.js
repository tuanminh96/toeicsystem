$(document).ready(function() {
	
	// load first when coming page
	ajaxGet(1);	
	
	function ajaxGet(page){		
		var data = { vaiTro :$("#vaiTro").val()};
		$.ajax({
			type: "GET",	
			data: data,
			contentType : "application/json",
			url: "http://localhost:8080/webtoeic/api/admin/tai-khoan/all" + '?page=' + page,
			success: function(result){
				$.each(result.content, function(i, taiKhoan){
					var taiKhoanRow = '<tr>' +
					                  '<td>' + taiKhoan.id+ '</td>' +
					                  '<td>' + taiKhoan.hoTen + '</td>' +
					                  '<td>' + taiKhoan.email + '</td>' +
					                  '<td>' + taiKhoan.soDienThoai + '</td>' +
					                  '<td>' + taiKhoan.diaChi + '</td>'+ 
					                  '<td>' + taiKhoan.role.role + '</td>';				  
					  taiKhoanRow +='<td><button id="idTaiKhoan" value=' + taiKhoan.id +' class="btn btn-danger btnXoa" >Xóa</button></td></tr>';				                  
					$('.taiKhoanTable tbody').append(taiKhoanRow);
					
				});
				$(".taiKhoanTable").DataTable();			
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	};
	
	// event khi click vào dropdown chọn danh mục thêm sản phẩm
	$('#vaiTro').mouseup(function() {
		var open = $(this).data("isopen");
		if (open) {
			resetData();
		}
		$(this).data("isopen", !open);
	});
	
	// click thêm tài khoản
    $(document).on('click', '.btnThemTaiKhoan', function (event) {
    	event.preventDefault();
        $("#taiKhoanModal").modal();
    });
    
    // xác nhận thêm tài khoản
    $(document).on('click', '#btnSubmit', function (event) {
    	event.preventDefault();
        ajaxPostTaiKhoan();
        resetData();
    });
    
    function ajaxPostTaiKhoan() {    	
    	var data = JSON.stringify($('.taiKhoanForm').serializeJSON());
    	console.log(data);
    	
    	 // do post
    	 $.ajax({
     		async:false,
 			type : "POST",
 			contentType : "application/json",
 			url : "http://localhost:8080/webtoeic/api/admin/tai-khoan/save",
 			enctype: 'multipart/form-data',
 			data : data,      
 			success : function(response) {
 				if(response.status == "success"){
 					$('#taiKhoanModal').modal('hide');
 					alert("Thêm thành công");
 				} else {
 			    	$('input').next().remove();
 		            $.each(response.errorMessages, function(key,value){
 		            	if(key != "id"){
 		   	                $('input[name='+ key +']').after('<span class="error">'+value+'</span>');
 		            	};
 		              }); 
 				}
 		    	
 			},
 			error : function(e) {
 				alert("Error!")
 				console.log("ERROR: ", e);
 			}
 		}); 
    }    
    
	// delete request
    $(document).on("click",".btnXoa", function() {
		
		var taiKhoanId = $(this).parent().prev().children().val();
		var confirmation = confirm("Bạn chắc chắn xóa tài khoản này ?");
		if(confirmation){
		  $.ajax({
			  type : "DELETE",
			  url : "http://localhost:8080/webtoeic/api/admin/tai-khoan/delete/" + taiKhoanId,
			  success: function(resultMsg){
				  alert("Xóa thành công")
				  resetData();
			  },
			  error : function(e) {
				 console.log("ERROR: ", e);
			  }
		  });
		}
     });
    
	// event khi ẩn modal form
	$('#taiKhoanModal').on('hidden.bs.modal', function(e) {
		e.preventDefault();
		$('.taiKhoanForm input').next().remove();
	});
    
    // reset table after post, put, filter
    function resetData(){   	
    	var page = $('li.active').children().text();
    	$('.taiKhoanTable tbody tr').remove();
    	$('.pagination li').remove();
        ajaxGet(page);
    };
    
    (function ($) {
        $.fn.serializeFormJSON = function () {

            var o = {};
            var a = this.serializeArray();
            $.each(a, function () {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
    })(jQuery);
    
    // remove element by class name
    function removeElementsByClass(className){
        var elements = document.getElementsByClassName(className);
        while(elements.length > 0){
            elements[0].parentNode.removeChild(elements[0]);
        }
    }
});