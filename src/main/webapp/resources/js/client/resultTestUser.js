$(document).ready(function () {
    const baseUrl = $('#baseUrl').val();
    alert(baseUrl);
    $('#seeDetailedAnswer').click(function () {
        alert(1);
        const pathname = window.location.pathname;
        const examId = pathname.charAt(pathname.length - 1);
        const totalCorrect = $("#totalCorrect").attr("totalCorrect");
        $.get({
            url: baseUrl + "/showResultListening/" + examId + "/" + totalCorrect + "/" + 200,
            success: function (responseText) {
                $('#ajaxGetUserServletResponse').text(responseText);
            }
        });
    });
});