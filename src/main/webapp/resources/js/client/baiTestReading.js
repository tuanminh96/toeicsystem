$(document).ready(function () {
    const baseUrl = $('#baseUrl').val();
    const examId = $("#examId").val();
    let interval;
    const totalTimeReadExam = 60 * 5;
    let timeDoReadExam = 60 * 5;

    // Start time do Reading
    onLoadReadTimer();

    // Ket qua test( Listening + Reading)
    $('#btnSubmitReading').click(function () {
        const answerArr = answerRead();

        var dataExamDTO = {
            'jsonAnswerUser': answerArr,
            'timeDoExam': totalTimeReadExam - timeDoReadExam
        };

        $.ajax({
            headers: {
                'Accept': 'application/json', 'Content-Type': 'application/json'
            }, // dataType: "json",
            data: JSON.stringify(dataExamDTO),
            type: 'POST',
            url: baseUrl + "/saveResultTest/" + examId,
            success: function (html) {
                clearInterval(interval);
                $('#mainContent').html(html);
                $('.modal-backdrop').removeClass("modal-backdrop fade show");
                $('.modal-open').removeAttr("style");
                $('.modal-open').removeClass("modal-open");
            }, error: function (html) {
                alert('Error');
                $('#mainContent').html(html.responseText);
            }
        });
    });

    function onLoadReadTimer() {
        let display = document.querySelector('#time');
        startTimer(totalTimeReadExam, display);
    }

    function startTimer(duration, display) {
        let timer = duration, minutes, seconds;
        interval = setInterval(function () {
            minutes = parseInt(timer / 60, 10)
            seconds = parseInt(timer % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            timeDoReadExam = timer;
            if (--timer < 0) {
                clearInterval(interval);

                //do someth after countdown
                alert("Reading time-out. Hệ thống sẽ tự động nộp bài!");
                $("#btnSubmitReading").click();
            }
        }, 1000);
    }
});

function markColorReading(id) {
    //tách lấy id của câu hỏi
    const fields = id.split('.');
    const answerId = fields[1];
    $("#answer" + answerId).css('background-color', 'rgb(167,162,162)');
}

function answerRead() {
    let answerArr = {};
    for (let i = 20; i <= 37; i++) {
        const questionId = $("#question" + i).attr("questionId");
        const nameRadio = "question" + i;
        let result = document.getElementById("submitForm").elements.namedItem(nameRadio);
        if (result == null) answerArr[questionId] = ""; else {
            const value = document.getElementById("submitForm").elements.namedItem(nameRadio).value;
            answerArr[questionId] = value;
        }
    }

    return answerArr;
}

function convertTimeToView(timer) {
    let minutes = parseInt(timer / 60, 10)
    let seconds = parseInt(timer % 60, 10);
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    return minutes + ":" + seconds;
}