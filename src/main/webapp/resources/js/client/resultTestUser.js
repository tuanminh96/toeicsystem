$(document).ready(function () {
    const baseUrl = $('#baseUrl').val();
    const examId = $("#examId").val();
    $('#seeDetailedAnswer').click(function () {
        const url = baseUrl + "/showResultExam/" + examId;
        $.get(url, function (html) {
            console.log(html);
            $('#mainContent').html(html);
        });
    });
});