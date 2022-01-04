$(document).ready(function () {

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
                var fields, id, anhbaithithu, tenbaithithu;
                for (var i = 0; i < data.length; i++) {
                    var jsonObject = new Object();
                    fields = data[i].split(',');

                    id = fields[0].split(':');
                    jsonObject.baithithuid = id[1];

                    anhbaithithu = fields[1].split(':');
                    jsonObject.anhbaithithu = anhbaithithu[1];

                    tenbaithithu = fields[2].split(':');
                    jsonObject.tenbaithithu = tenbaithithu[1];

                    jsonArray.push(jsonObject);
                }

                var jsonArr = JSON.parse(JSON.stringify(jsonArray));
                var trHTML = "";
                for (var i = 0; i < jsonArr.length; i++) {
                    trHTML += '<tr><td class= "center">' + jsonArr[i].baithithuid + '</td>'
                        + '<td class= "center">' + jsonArr[i].tenbaithithu + '</td>'
                        + '<td class= "center">' + jsonArr[i].anhbaithithu + '</td>'
                        + '<td class = "center"> <a id="approve.' + jsonArr[i].baithithuid + ' "'
                        + 'class="yellow approveExam"><button class="btn btn-warning">Approve</button></a> '
                        + ' <a id="reject.' + jsonArr[i].baithithuid + ' "'
                        + 'class="red rejectExam" ><button class="delete btn btn-danger">Reject</button></a> </td>'
                        + '</tr>';
                }
                //$('#tableExam').append(trHTML);
                $('tbody').html(trHTML);
            }, error: function (e) {
                alert("error");
                console.log("ERROR: ", e);
            }
        });
    }

    //default. load all object baithithu
    window.onload = function () {
        loadAllBaiThiThu();
    };
});
