$(document).ready(function () {

    const baseUrl = $('#baseUrl').val();
    const examId = $("#examId").val();
    const totalTimeListemExam = 60 * 5;
    let timeCheckListening;
    let timeDoListenExam = 60 * 5;

    $('#doReading').click(function () {
        const answerArr = answerListen();
        const dataExamDTO = {
            'jsonAnswerUser': answerArr,
            'timeDoExam': totalTimeListemExam - timeDoListenExam
        };

        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(dataExamDTO),
            type: 'POST',
            url: baseUrl + "/reading/" + examId,
            success: function (html) {
                $('#mainContent').html(html);
                $('.modal-backdrop').removeClass("modal-backdrop fade show");
                $('.modal-open').removeAttr("style");
                $('.modal-open').removeClass("modal-open");
                // Stop dem nguoc
                clearInterval(timeCheckListening);
            }, error: function (html) {
                console.log(html);
                $('#mainContent').html(html.responseText);
            }
        });
    });

    function startTimer(duration, display) {
        let timer = duration, minutes, seconds;
        timeCheckListening = setInterval(function () {
            minutes = parseInt(timer / 60, 10)
            seconds = parseInt(timer % 60, 10);
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            timeDoListenExam = timer;
            if (--timer < 0) {
                clearInterval(timeCheckListening);

                // do someth after countdown
                alert("Listening time-out. Hệ thống sẽ tự động chuyển qua bài test Reading");
                $("#doReading").click()
            }
        }, 1000);
    }

    window.onload = function () {
        display = document.querySelector('#time');
        startTimer(totalTimeListemExam, display);
    };
    
	// ham check so lan bam file nghe
	var countListen = new Array();
	$('audio').each(function(){
	    var audioClicked = {
	    		name : $(this).attr("audioId"),
	    		count: 0
	    }
	    countListen.push(audioClicked);
	});

	$('.audiobut').on('playing', function(){
		var nameAudio = $(this).attr("audioId");

		for (var i = 0, len = countListen.length; i < len; i++) {
			
	        if (countListen[i].name && countListen[i].name === nameAudio) {
	        	if(countListen[i].count == 2) {
	        		alert("Rất tiếc chỉ được phép nghe tối đa 2 lần"); 
	        		$(this).hide();
	        		return;
	        	}
	        	else {
		        	countListen[i].count++;
	        	}
	        }
	}
		console.log(countListen);
	});
});

// Mark color danh sach cau hoi.
function markColorListening(id) {
    // tách lấy id của câu hỏi
    const fields = id.split('.');
    const answerId = fields[1];
    $("#answer" + answerId).css('background-color', 'rgb(167,162,162)');
}

// Tra ve HashMap<Id, AnswerUser>
function answerListen() {
    let answerArr = {};
    for (let i = 1; i <= 19; i++) {
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