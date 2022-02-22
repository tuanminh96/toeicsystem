$(document).ready(function () {
	var datatable;
    // Add new exam
	$("#formAddExam").validate({
		rules : {
			examTitle : {
				required : true
			},
			examDescription : {
				required : true
			},
			fileThumbnail: {
				extension: "jpg|jpeg|png"
			},
			file_Excel: {
				extension: "xlsx|xls"
			},
			file_Image_Question: {
				extension: "jpg|jpeg|png"
			},
			file_Audio: {
				extension: "mp3|org"
			}
		},
		messages : {
			examTitle : {
				required : "Tên không được để trống"
			},
			examDescription : {
				required : "Mô tả không được để trống"
			},
			fileThumbnail: {
				extension: "File không đúng định dạng"
			},
			file_Excel: {
				extension: "File không đúng định dạng",
			},
			file_Image_Question: {
				extension: "File không đúng định dạng"
			},
			file_Audio: {
				extension: "File không đúng định dạng"
			}
		},
		submitHandler : function(form) {
			let i;
	        // formData: examTitle, examLevel, examDescription, fileExcel, fileThumbnail, fileQuestionImage, fileQuestionAudio
	        const formData = new FormData();

	        const examTitle = $('#examTitle').val();
	        const examLevel = $('#examLevel').val();
	        const examDescription = $('#examDescription').val();
	        const fileThumbnail = $('#fileThumbnail')[0].files[0];
	        const fileQuestionExcel = $('#fileQuestionExcel')[0].files[0];
	        const countFileQuestionImage = $('#fileQuestionImageLst')[0].files.length;
	        const countFileQuestionAudio = $('#fileQuestionAudioLst')[0].files.length;

	        // Add data to FormData
	        formData.append("examTitle", examTitle);
	        formData.append("examLevel", examLevel);
	        formData.append("examDescription", examDescription);
	        formData.append("fileThumbnail", fileThumbnail);
	        formData.append("fileQuestionExcel", fileQuestionExcel);
	        for (i = 0; i < countFileQuestionImage; i++) {
	            formData.append("fileQuestionImageLst", $('#fileQuestionImageLst')[0].files[i]);
	        }
	        for (i = 0; i < countFileQuestionAudio; i++) {
	            formData.append("fileQuestionAudioLst", $('#fileQuestionAudioLst')[0].files[i]);
	        }

	        $.ajax({
	            data: formData,
	            type: 'POST',
	            url: "http://localhost:8080/webtoeic/api/admin/exam/save",
	            enctype: 'multipart/form-data',
	            contentType: false,
	            cache: false,
	            processData: false,
	            success: function (data) {
	                $('#examModal').modal('hide');
	                datatable.clear().draw();

	              //destroy datatable
	                datatable.destroy();
	                loadAllBaiThiThu();
	                $('#info-success').text("Thêm mới bài thi thử thành công");
	            },
	            error: function (e) {
	                alert("error");
	                $('#examModal').modal('hide');
	                console.log("ERROR: ", e);
	            }
	        });
		}
	});
//    $('#btnAddNewExam').click(function () {
//    	let i;
//
//        // formData: examTitle, examLevel, examDescription, fileExcel, fileThumbnail, fileQuestionImage, fileQuestionAudio
//        const formData = new FormData();
//
//        const examTitle = $('#examTitle').val();
//        const examLevel = $('#examLevel').val();
//        const examDescription = $('#examDescription').val();
//        const fileThumbnail = $('#fileThumbnail')[0].files[0];
//        const fileQuestionExcel = $('#fileQuestionExcel')[0].files[0];
//        const countFileQuestionImage = $('#fileQuestionImageLst')[0].files.length;
//        const countFileQuestionAudio = $('#fileQuestionAudioLst')[0].files.length;
//
//        // Add data to FormData
//        formData.append("examTitle", examTitle);
//        formData.append("examLevel", examLevel);
//        formData.append("examDescription", examDescription);
//        formData.append("fileThumbnail", fileThumbnail);
//        formData.append("fileQuestionExcel", fileQuestionExcel);
//        for (i = 0; i < countFileQuestionImage; i++) {
//            formData.append("fileQuestionImageLst", $('#fileQuestionImageLst')[0].files[i]);
//        }
//        for (i = 0; i < countFileQuestionAudio; i++) {
//            formData.append("fileQuestionAudioLst", $('#fileQuestionAudioLst')[0].files[i]);
//        }
//
//        $.ajax({
//            data: formData,
//            type: 'POST',
//            url: "http://localhost:8080/webtoeic/api/admin/exam/save",
//            enctype: 'multipart/form-data',
//            contentType: false,
//            cache: false,
//            processData: false,
//            success: function (data) {
//                $('#examModal').modal('hide');
//                datatable.clear().draw();
//
//              //destroy datatable
//                datatable.destroy();
//                loadAllBaiThiThu();
//                $('#info-success').text("Thêm mới bài thi thử thành công");
//            },
//            error: function (e) {
//                alert("error");
//                $('#examModal').modal('hide');
//                console.log("ERROR: ", e);
//            }
//        });
//    });

    // Edit exam
    $('#btnUpdateExam').click(function () {
        var examId = $('#idExam').val();

        // formData: examTitle,file_Excel, file_Image, file_imageQuestion, file_Listening
        var formData = new FormData();

        var file_excel = $('#file_Excel')[0].files[0];
        var file_image = $('#file_Image')[0].files[0];
        var name = $('#examTitle').val();

        //var file_image_question = $('#file_image_question')
        var countFileImage = document.getElementById('file_image_question').files.length;
        var countFileMp3 = document.getElementById('file_listening').files.length;


        for (var x = 0; x < countFileImage; x++) {
            formData.append("file_image_question", document.getElementById('file_image_question').files[x]);
        }

        for (var x = 0; x < countFileMp3; x++) {
            formData.append("file_listening", document.getElementById('file_listening').files[x]);
        }

        formData.append("file_excel", file_excel);
        formData.append("file_image", file_image);
        formData.append("name", name);
        formData.append("idExam", examId);


        $.ajax({
            data: formData,
            type: 'POST',
            url: "http://localhost:8080/webtoeic/api/admin/exam/update",
            enctype: 'multipart/form-data',
            contentType: false,
            cache: false,
            processData: false,

            success: function (data) {
                $('#examModal').modal('hide');
                $('#info-success').text("Cập nhật bài thi thử thành công");
                loadAllBaiThiThu();
            },
            error: function (e) {
                alert("error");
                console.log("ERROR: ", e);
            }

        });


    });

    var editId, idBaiThiThu, fields;
    $(document).on('click', '.editBaiThiThu', function (e) {
        e.stopPropagation();
        e.stopImmediatePropagation();
        editId = $(this).attr('id');
        fields = editId.split('.');
        idBaiThiThu = fields[1];

        $('#btnUpdateExam').show();
        $('#btnAddNewExam').hide();
        $('#examModal').modal('show');

        var modal = $('#examModal');
        modal.find('.modal-header #titleModal').text("Cập nhật bài thi thử");
        $('#examModal #idExam').val(idBaiThiThu);

        $.ajax({
            type: 'GET',
            url: "http://localhost:8080/webtoeic/api/admin/exam/infoExam/" + idBaiThiThu,
            success: function (data) {
                $('#examModal #examTitle').val(data.tenbaithithu);
                $('#examModal #examDescription').val(data.description);
                $('#examModal #examLevel').val(data.level);
            },
            error: function (e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
    $(document).on('click', '.btnAddExam', function (e) {
        e.stopPropagation();
        e.stopImmediatePropagation();

        $('#btnUpdateExam').hide();
        $('#btnAddNewExam').show();
        $('#examModal').modal('show');

        var modal = $('#examModal');
        $("#examTitle").val("");
        $("#examDescription").val("");
        modal.find('.modal-header #titleModal').text("Thêm mới Exam");

    });

    // Delete exam
    $(document).on('click', '.deleteBaiThiThu', function () {
        var deleteId = $(this).attr('id');
        var fields = deleteId.split('.');
        var idBaiThiThu = fields[1];

        if (confirm("Bạn muốn xóa bài thi thử này?")) {
            $.ajax({
                type: 'POST',
                url: "http://localhost:8080/webtoeic/api/admin/exam/delete/" + idBaiThiThu,
                success: function (data) {
                    datatable.clear().draw();
                    //destroy datatable
                      datatable.destroy();
                    loadAllBaiThiThu();
                    $('#info-success').text("Xóa bài thi thử thành công");
                },
                error: function (e) {
                    alert("error");
                    console.log("ERROR: ", e);
                }
            });
        }
    });

    function loadAllBaiThiThu() {
        $.ajax({
            dataType: 'json',
            type: 'GET',
            url: "http://localhost:8080/webtoeic/api/admin/exam/loadExam",
            success: function (data) {
                //convert array to json type
                var jsonArray = new Array();
                var fields, id, anhbaithithu, tenbaithithu, describe, level, status;
                for (var i = 0; i < data.length; i++) {
                    var jsonObject = new Object();
                    fields = data[i].split(',');

                    id = fields[0].split(':');
                    jsonObject.baithithuid = id[1];

                    anhbaithithu = fields[1].split(':');
                    jsonObject.anhbaithithu = anhbaithithu[1];

                    tenbaithithu = fields[2].split(':');
                    jsonObject.tenbaithithu = tenbaithithu[1];
                    
                    level = fields[3].split(':');
                    jsonObject.level = level[1];
                    
                    status = fields[4].split(':');
                    jsonObject.status = status[1];

                    
                    jsonArray.push(jsonObject);
                }

                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML = "";
                for (var i = 0; i < jsonArr.length; i++) {
                    trHTML += '<tr><td class= "center">' + jsonArr[i].baithithuid + '</td>'
                        + '<td class= "center ">' + jsonArr[i].tenbaithithu + 
                        '</td>'
                        + '<td class= "center">' + jsonArr[i].level + '</td>'
                        + '<td class= "center">' + jsonArr[i].status + '</td>'
                        + '<td class = "center"> <a id="edit.' + jsonArr[i].baithithuid + ' "'
                        + 'class="yellow editBaiThiThu"><button class="btn btn-warning">Cập nhật</button></a> '
                        + ' <a id="delete.' + jsonArr[i].baithithuid + ' "'
                        + 'class="red deleteBaiThiThu" ><button class="delete btn btn-danger">Xóa</button></a> </td>'
                        + '</tr>';
                }
                //$('#tableExam').append(trHTML);
                $('tbody').html(trHTML);
                datatable = $("#tableExam").DataTable({
            		language: {
            			emptyTable: "Không có đề thi nào."
            		},
            		lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            		searching: true, // Mặc định là true, set false để tắt chức năng search
            		ordering:  true, // Mặc định là true, set false để tắt chức năng sắp xếp theo collumn
            		paging: true, // Mặc định là true, set false để tắt chức năng phân trang
            		// scrollX: 400, // Nội dụng của table sẽ hiện thị với with 400px, Nếu quá thì sẽ có thanh scroll
            		// scrollY: 300, // Nội dụng của table sẽ hiện thị với hieght 400px, Nếu quá thì sẽ có thanh scroll
            		processing: true,
                });
            }, error: function (e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    }
   loadAllBaiThiThu();

});
