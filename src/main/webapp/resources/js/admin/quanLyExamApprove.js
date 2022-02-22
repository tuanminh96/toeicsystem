$(document).ready(function () {
	var editId, idBaiThiThu, fields;
    $(document).on('click', '.viewExam', function (e) {
        e.stopPropagation();
        e.stopImmediatePropagation();
        editId = $(this).attr('id');
        fields = editId.split('.');
        idBaiThiThu = fields[1];

        $('#btnUpdateExam').show();
        $('#btnAddNewExam').hide();
        $('#examModal').modal('show');

        var modal = $('#examModal');
        modal.find('.modal-header #titleModal').text("Xem chi tiết bài thi thử");
        $('#examModal #idExam').val(idBaiThiThu);

        $.ajax({
            type: 'GET',
            url: "http://localhost:8080/webtoeic/api/admin/exam/infoExam/" + idBaiThiThu,
            success: function (data) {
                $('#examModal #examTitle').val(data.tenbaithithu);
                $('#examModal #examDescription').val(data.description);
                $('#examModal #examLevel').val(data.level);
                $('#examModal #downloadExcel').attr('urlExcel',data.urlExcel)
                $('#examModal #downloadExcel').attr('excelName',data.excelName)
                $('#examModal #downloadThumb').attr('urlThumb',data.urlThumbnail)
                $('#examModal #downloadThumb').attr('thumbName',data.anhbaithithu)
            },
            error: function (e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    });
    
    $("#downloadExcel").click(function (e) {
    	e.preventDefault();
    	var link = document.createElement("a");
        // If you don't know the name or want to use
        // the webserver default set name = ''
        link.setAttribute('download', $('#examModal #downloadExcel').attr('excelName'));
        link.href = $('#examModal #downloadExcel').attr('urlExcel');
        console.log(link.href);
        document.body.appendChild(link);
        link.click();
        link.remove();
    });
    $("#downloadThumb").click(function (e) {
    	e.preventDefault();
    	var link = document.createElement("a");
        // If you don't know the name or want to use
        // the webserver default set name = ''
        link.setAttribute('download', $('#examModal #downloadThumb').attr('thumbName'));
        link.href = $('#examModal #downloadThumb').attr('urlThumb');
        console.log(link.href);
        document.body.appendChild(link);
        link.click();
        link.remove();
    });
	
	var datatable;
    // Approve exam
    $(document).on('click', '.approveExam', function () {
        var approveId = $(this).attr('id');
        var fields = approveId.split('.');
        var examId = fields[1];

        if (confirm("Bạn muốn approve bài thi thử này?")) {
            $.ajax({
                type: 'POST',
                url: "http://localhost:8080/webtoeic/api/admin/exam/approve/" + examId,
                success: function (data) {
                    datatable.clear().draw();
                    //destroy datatable
                      datatable.destroy();
                    loadAllBaiThiThu();
                    $('#info-success').text("Approve exam success!");
                },
                error: function (e) {
                    alert("error");
                    console.log("ERROR: ", e);
                }
            });
        }
    });

    // Approve exam
    $(document).on('click', '.rejectExam', function () {
        var approveId = $(this).attr('id');
        var fields = approveId.split('.');
        var examId = fields[1];

        if (confirm("Bạn muốn reject bài thi thử này?")) {
            $.ajax({
                type: 'POST',
                url: "http://localhost:8080/webtoeic/api/admin/exam/reject/" + examId,
                success: function (data) {
                    datatable.clear().draw();
                    //destroy datatable
                      datatable.destroy();
                    loadAllBaiThiThu();
                    $('#info-success').text("Reject exam success!");
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
            url: "http://localhost:8080/webtoeic/api/admin/exam/loadExamApprove",
            success: function (data) {
                //convert array to json type
                var jsonArray = new Array();
                var fields, id, anhbaithithu, tenbaithithu, level, status, adminAdd;
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
                    
                    adminAdd = fields[5].split(':');
                    jsonObject.adminAdd = adminAdd[1];
                    console.log(jsonObject.adminAdd);
                    jsonArray.push(jsonObject);
                }

                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML = "";
                for (var i = 0; i < jsonArr.length; i++) {
                    trHTML += '<tr><td class= "center">' + jsonArr[i].baithithuid + '</td>'
                    	if(jsonArr[i].status=='DELETED') {
                    		trHTML += '<td class= "center">' + jsonArr[i].tenbaithithu + '</td>'
                    	}
                    	else {
                    		trHTML += '<td class= "center"><a href="">' + jsonArr[i].tenbaithithu + '</a></td>'
                    	}
                    trHTML += '<td class= "center">' + jsonArr[i].level + '</td>'
                        + '<td class= "center">' + jsonArr[i].status + '</td>'
                    	+ '<td class= "center">' + jsonArr[i].adminAdd + '</td>';
                    
                    if(jsonArr[i].status=='CREATED') {
                    	trHTML += '<td class = "center"> <a id="view.' + jsonArr[i].baithithuid + '"'
                    	+'class="yellow viewExam"><button class="btn btn-info">View</button></a> '
                    	+'<a id="approve.' + jsonArr[i].baithithuid + ' "'
                        	+'class="yellow approveExam"><button class="btn btn-warning">Approve</button></a> '
                        + ' <a id="reject.' + jsonArr[i].baithithuid + ' "'
                        + 'class="red rejectExam" ><button class="delete btn btn-danger">Reject</button></a> </td>'
                        + '</tr>';
                    }
                    else {
                    	if(jsonArr[i].status!='DELETED') {
                    	trHTML += '<td class = "center"> <a id="view.' + jsonArr[i].baithithuid + '"'
                    	+'class="yellow viewExam"><button class="btn btn-info">View</button></a> '
                    	+'</td>'
                        +'</tr>';
                    	}
                    	else {
                    		trHTML += '<td class = "center"> <a id="view.' + jsonArr[i].baithithuid + '"'
                        	+'class="yellow viewExam"></a> '
                        	+'</td>'
                            +'</tr>';
                    	}
                    }

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
