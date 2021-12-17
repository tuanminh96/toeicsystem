function markColor(id) {
    //tách lấy id của câu hỏi
    var fields = id.split('.');
    var answerId = fields[1];
    document.getElementById("answer" + answerId).style.backgroundColor = "rgb(167,162,162)";

}

function correctAnswer() {
    var correctArr = [];
    var totalquest = document.getElementById("totalquest").value;
    for (var i = 1; i < totalquest; i++) {
        var nameRadio = "correctanswer" + i;
        if (document.getElementById("submitForm").elements.namedItem(nameRadio) != null) {
            var x = document.getElementById("submitForm").elements.namedItem(nameRadio).value;
        }
        correctArr.push(x);
    }

    return correctArr;
}

function answerUser() {
    //var form = document.getElementById("submitForm");
    // array index start = 0
    var answerArr = [];

    for (var i = 1; i < 51; i++) {
        var nameRadio = "question" + i;
        var result = document.getElementById("submitForm").elements.namedItem(nameRadio);

        if (result == null) answerArr.push("");
        else {

            var x = document.getElementById("submitForm").elements.namedItem(nameRadio).value;
            answerArr.push(x);
        }

    }

    return answerArr;
}

$(document).ready(function () {
    const baseUrl = $('#baseUrl').val();
    var answerArr = answerUser();
    var correctArr = correctAnswer();
    // var countCorrect = 0;
    // for (var i = 0; i < 50; i++) {
    //     if (answerArr[i] == correctArr[i] && answerArr[i] != ' ') countCorrect++;
    // }
    var jsonAnswerListen = JSON.stringify(answerArr);
    var examId = $("#examId").val();

    $('#doReading').click(function () {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            dataType: "json",
            data: jsonAnswerListen,
            type: 'POST',
            url: baseUrl + "/reading/" + examId,
            success: function (html) {
                alert('Success');
                $('#mainContent').html(html);
            },
            error: function (html) {
                console.log(html);
                $('#mainContent').html(html.responseText);
            }
        });

        // $.get({
        //     // headers: {
        //     //     'Accept': 'application/json',
        //     //     'Content-Type': 'application/json'
        //     // },
        //     // dataType: "json",
        //     // data: jsonAnswerUser,
        //     // type: 'GET',
        //     url: baseUrl+ "/reading/" + examId + "/" + countCorrect,
        //     success: function (html) {
        //         alert('Success');
        //         $('#mainContent').html(html);
        //         // window.location.href = "http://localhost:8080/webtoeic/reading?idExam=" + examId;
        //     },
        //     error: function (e) {
        //         alert("error");
        //         console.log("ERROR: ", e);
        //     }
        // });
    });

    $('#doReading1').click(function () {
        // startReadingClock()

        var url = baseUrl + "/reading/" + examId + "/" + countCorrect;
        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.open("POST", url, true);
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {
                const data = xhttp.responseText;
                alert("OK");
                document.getElementById("mainContent").innerHTML = data;
            }
        }
        xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhttp.send(jsonAnswerUser);
    });


    $('#btnResult').click(function () {

        //clear clock,stop countdown
        clearInterval(timecheck);
        //tranfer information

        //remove btn XemdapAn, show btn lamlai
        $('#btnResult').hide();
        //$('#btndoAgain').show();

        document.getElementById("btnSubmit").style.margin = "0px 0px 0px 80px";

        var totalquest = document.getElementById("totalquest").value;
        var url = "http://localhost:8080/webtoeic/showResultListening/" + examId + "/" + countCorrect + "/" + totalquest;
        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xhttp.open("POST", url, true);

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {

                var data = xhttp.responseText;
                document.getElementById("main").innerHTML = data;
            }
        }


        xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

        xhttp.send(jsonAnswerUser);
    });


    var timecheck;

    function startTimer(duration, display) {
        var timer = duration, minutes, seconds;

        timecheck = setInterval(function () {
            minutes = parseInt(timer / 60, 10)
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                clearInterval(timecheck);
                //do someth after countdown
                var examId = $("#examId").val();
                alert("Đã hết thời gian làm bài test Listening. Hệ thống sẽ tự động chuyển qua bài test Reading");
                $("#btnSubmit").click()
                //window.location.href = "http://localhost:8080/webtoeic/reading?idExam="+examId;

            }
        }, 1000);


    }

    window.onload = function () {
        //change time here
        //var thirtyMinutes = 0.2 * 30;
        var thirtyMinutes = 60 * 45;
        display = document.querySelector('#time');
        startTimer(thirtyMinutes, display);
    };


});








