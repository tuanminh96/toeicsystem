<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bài test Toeic</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="http://code.jquery.com/jquery.js"></script>

    <style type="text/css">
        .content-left {
            width: 30%;
            position: fixed;
        }

        .content-right {
            width: 67%;
            margin-left: 30%;
        }

        .question {
            height: 40px;
            line-height: 40px;
            margin: 0 0 10px 0;
        }

        .questionPart1 {
            padding: 15px 0;
            margin-top: 30px;
        }

        .questionPart2a {
            padding: 15px 0;
            margin-top: 30px;
        }

        .questionPart2b {
            padding: 15px 0;
            margin-top: 30px;
            display: inline-block;
        }

        .questionPart3 {
            padding-left: 60px;
        }

        .questionPart3a {
            margin: 30px 0 10px 0;
        }

        .questionPart4 {
            border: 1px solid red;
            height: 400px;
        }

        .questionPart5 {
            margin: 30px 0 20px 0;
        }

        .questionPart6 {
            margin: 30px 0 20px 0;
        }

        .questionPart7 {
            margin: 30px 0 20px 0;
        }

        .examExplain {
            padding-top: 20px;
        }

        .numberCircle {
            display: inline-block;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            font-size: 15px;
            line-height: 25px;
            text-align: center;
            border: 2px solid #666;
            margin: 5px 5px 5px 15px;
        }
        .numberCircle:hover{
            cursor: pointer;
            border: 2px solid red;
        }

        #time {
            color: green;
            float: right;
        }

        .timeDoExam {
            height: 60px;
            line-height: 60px;
        }

        #noteCorrectExam {
            color: greenyellow;
            display: none;
        }

        #noteWrongExam {
            color: red;
            display: none;
        }

        #noteNotDoExam {
            display: none;
        }

        #doNewExam{
            height: 40px;
            width: 190px;
        }
    </style>
    <script>
        $(function() {
            $('.correctAnswer').hover(function() {
                $('#noteCorrectExam').css('display', 'inline');
            }, function() {
                // on mouseout, reset the background colour
                $('#noteCorrectExam').css('display', 'none');
            });

            $('.wrongAnswer').hover(function() {
                $('#noteWrongExam').css('display', 'inline');
            }, function() {
                // on mouseout, reset the background colour
                $('#noteWrongExam').css('display', 'none');
            });

            $('.notDoExam').hover(function() {
                $('#noteNotDoExam').css('display', 'inline');
            }, function() {
                // on mouseout, reset the background colour
                $('#noteNotDoExam').css('display', 'none');
            });
        });
    </script>
</head>
<body>
<div id="content" class="container-fluid fill">
    <form id="submitForm" name="submitForm">
        <div class="row">
            <div id="navigation" class="content-left">
                <div class="fix-scrolling">
                    <div class="timeDoExam" style="width: 80%">
                        Tổng thời gian làm bài: </i><span id="time">${totalTimeDoExam}</span>
                    </div>
                    <hr width="80%">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="margin-bottom: 20px">Danh sách câu hỏi</div>
                        <div class="panel-body" style="width: 80%">
                            <c:forEach items="${fullListExamQuestionDTO}" var="data" varStatus="index">
                                <c:choose>
                                    <c:when test="${data.userAnswer == data.correctAnswer}">
                                        <div class="numberCircle correctAnswer" id="answer${index.count}"
                                             style="background-color: greenyellow">${index.count}</div>
                                    </c:when>
                                    <c:when test="${data.userAnswer != ''}">
                                        <div class="numberCircle wrongAnswer" id="answer${index.count}"
                                             style="background-color: red">${index.count}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="numberCircle notDoExam"
                                             id="answer${index.count}">${index.count}</div>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                    <hr width="80%">
                    <div class="noteExam">
                        <div id="noteCorrectExam">Correct</div>
                        <div id="noteWrongExam">Wrong</div>
                        <div id="noteNotDoExam">Do not exam</div>
                    </div>

                    <a id="doNewExam" href="${pageContext.request.contextPath}/listExam" style="position: fixed;bottom: 80px;left: 5%;" type="button"
                       class="btn btn-danger">Làm bài thi thử khác</a>
                </div>
            </div>
            <!--Nội dung bài test -->
            <div class="content-right">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-part1-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-part1" type="button" role="tab" aria-controls="nav-part1"
                                aria-selected="true">Part I
                        </button>
                        <button class="nav-link" id="nav-part2-tab" data-bs-toggle="tab" data-bs-target="#nav-part2"
                                type="button" role="tab" aria-controls="nav-part2" aria-selected="false">Part II
                        </button>
                        <button class="nav-link" id="nav-part3-tab" data-bs-toggle="tab" data-bs-target="#nav-part3"
                                type="button" role="tab" aria-controls="nav-part3" aria-selected="false">Part III
                        </button>
                        <button class="nav-link" id="nav-part4-tab" data-bs-toggle="tab" data-bs-target="#nav-part4"
                                type="button" role="tab" aria-controls="nav-part4" aria-selected="false">Part IV
                        </button>
                        <button class="nav-link" id="nav-part5-tab" data-bs-toggle="tab" data-bs-target="#nav-part5"
                                type="button" role="tab" aria-controls="nav-part5" aria-selected="true">Part V
                        </button>
                        <button class="nav-link" id="nav-part6-tab" data-bs-toggle="tab" data-bs-target="#nav-part6"
                                type="button" role="tab" aria-controls="nav-part6" aria-selected="false">Part VI
                        </button>
                        <button class="nav-link" id="nav-part7-tab" data-bs-toggle="tab" data-bs-target="#nav-part7"
                                type="button" role="tab" aria-controls="nav-part7" aria-selected="false">Part VII
                        </button>
                    </div>
                </nav>
                <c:forEach items="${partListen}" var="part">
                    <p class="part${part.idPart} parttoeic"
                       style="margin-top: 20px; display: none;">
                        <b>${part.partName}: ${part.description}</b>
                    </p>
                </c:forEach>

                <!-- Tab panes -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-part1" role="tabpanel"
                         aria-labelledby="nav-part1-tab">
                        <c:forEach items="${listQuestionPart1}" var="part1" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:set var="userAnswerD" value=""/>
                            <c:if test="${part1.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part1.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part1.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>
                            <c:if test="${part1.userAnswer == 'D'}">
                                <c:set var="userAnswerD" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:set var="correctAnswerD" value=""/>
                            <c:if test="${part1.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part1.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part1.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part1.correctAnswer == 'D'}">
                                <c:set var="correctAnswerD"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>

                            <div class="questionPart1">
                                <div class="row question">
                                    <b id="question${index.count}"
                                       questionId="${part1.idQuestion}">Question ${index.count}:</b>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <img src="${pageContext.request.contextPath}/resources/file/exams/${part1.idExam}/images/${part1.sImage}.jpg"
                                             alt="Image not found"
                                             style="height: 300px; width: 400px; float: left; margin-right: 10px"/>
                                    </div>
                                    <div class="col-md-6">
                                        <audio controls style="width: 100%">
                                            <source src="${pageContext.request.contextPath}/resources/file/exams/${part1.idExam}/audio/${part1.audio}.mp3"
                                                    type="audio/wav">
                                        </audio>
                                        <br>
                                        <br> <input class="part1" type="radio" ${userAnswerA}/> A
                                        &nbsp;<img src="${correctAnswerA}">
                                        <br> <input class="part1" type="radio" ${userAnswerB}/> B
                                        &nbsp;<img src="${correctAnswerB}">
                                        <br> <input class="part1" type="radio" ${userAnswerC}/> C
                                        &nbsp;<img src="${correctAnswerC}">
                                        <br> <input class="part1" type="radio" ${userAnswerD}/> D
                                        &nbsp;<img src="${correctAnswerD}">
                                        <br>
                                    </div>
                                    <div class="examExplain">
                                        <c:if test="${part1.userAnswer == ''}">
                                            <b>Bạn chưa chọn đáp án nào.</b>
                                        </c:if>
                                        <c:if test="${part1.userAnswer != ''}">
                                            <b>Đáp án bạn chọn:</b> ${part1.userAnswer}
                                        </c:if>
                                        <br>
                                        <b>Đáp án đúng:</b> ${part1.correctAnswer}
                                        <br>
                                        <b>Giải thích chi tiết:</b> ${part1.explain}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part2" role="tabpanel" aria-labelledby="nav-part2-tab">
                        <c:forEach items="${listQuestionPart2}" var="part2" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:if test="${part2.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part2.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part2.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:if test="${part2.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part2.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part2.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>

                            <c:if test="${index.count == 1}">
                                <div class="row questionPart2a">
                                    <audio controls style="width: 100%">
                                        <source src="${pageContext.request.contextPath}/resources/file/exams/${part2.idExam}/audio/${part2.audio}.mp3"
                                                type="audio/wav">
                                    </audio>
                                </div>
                            </c:if>
                            <div class="questionPart2b">
                                <div class="row" style="padding-bottom: 10px">
                                    <b id="question${index.count + 2}"
                                       questionId="${part2.idQuestion}">Question ${index.count + 2}:</b>
                                </div>
                                <div>
                                    <input class="part2" type="radio" ${userAnswerA}/> A
                                    &nbsp;<img src="${correctAnswerA}"> <br>
                                    <input class="part2" type="radio" ${userAnswerB}/> B
                                    &nbsp;<img src="${correctAnswerB}"> <br>
                                    <input class="part2" type="radio" ${userAnswerC}/> C
                                    &nbsp;<img src="${correctAnswerC}">
                                </div>
                            </div>
                            <div class="examExplain">
                                <c:if test="${part2.userAnswer == ''}">
                                    <b>Bạn chưa chọn đáp án nào.</b>
                                </c:if>
                                <c:if test="${part2.userAnswer != ''}">
                                    <b>Đáp án bạn chọn:</b> ${part2.userAnswer}
                                </c:if>
                                <br>
                                <b>Đáp án đúng:</b> ${part2.correctAnswer}
                                <br>
                                <b>Giải thích chi tiết:</b> ${part2.explain}
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part3" role="tabpanel" aria-labelledby="nav-part3-tab">
                        <c:forEach items="${listQuestionPart3}" var="part3" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:set var="userAnswerD" value=""/>
                            <c:if test="${part3.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part3.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part3.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>
                            <c:if test="${part3.userAnswer == 'D'}">
                                <c:set var="userAnswerD" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:set var="correctAnswerD" value=""/>
                            <c:if test="${part3.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part3.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part3.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part3.correctAnswer == 'D'}">
                                <c:set var="correctAnswerD"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${index.count == 1 || index.count == 4}">
                                <div class="row questionPart2a">
                                    <c:if test="${index.count == 4}">
                                        <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                                    </c:if>
                                    <p><b>Question ${index.count + 7} ~ ${index.count + 9} refer to following
                                        conversation:</b></p>
                                    <audio controls>
                                        <source src="${pageContext.request.contextPath}/resources/file/exams/${part3.idExam}/audio/${part3.audio}.mp3"
                                                type="audio/wav">
                                    </audio>
                                </div>
                            </c:if>
                            <div class="questionPart3">
                                <div class="questionPart3a">
                                    <b id="question${index.count + 7}"
                                       questionId="${part3.idQuestion}">Question ${index.count + 7}:</b>${part3.question}
                                </div>
                                <div>
                                    <input class="part3" type="radio" ${userAnswerA}/> A
                                    &nbsp;<img src="${correctAnswerA}"> <br>
                                    <input class="part3" type="radio" ${userAnswerB}/> B
                                    &nbsp;<img src="${correctAnswerB}"> <br>
                                    <input class="part3" type="radio" ${userAnswerC}/> C
                                    &nbsp;<img src="${correctAnswerC}"> <br>
                                    <input class="part3" type="radio" ${userAnswerD}/> D
                                    &nbsp;<img src="${correctAnswerD}">
                                </div>
                                <div class="examExplain">
                                    <c:if test="${part3.userAnswer == ''}">
                                        <b>Bạn chưa chọn đáp án nào.</b>
                                    </c:if>
                                    <c:if test="${part3.userAnswer != ''}">
                                        <b>Đáp án bạn chọn:</b> ${part3.userAnswer}
                                    </c:if>
                                    <br>
                                    <b>Đáp án đúng:</b> ${part3.correctAnswer}
                                    <br>
                                    <b>Giải thích chi tiết:</b> ${part3.explain}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part4" role="tabpanel" aria-labelledby="nav-part4-tab">
                        <c:forEach items="${listQuestionPart4}" var="part4" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:set var="userAnswerD" value=""/>
                            <c:if test="${part4.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part4.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part4.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>
                            <c:if test="${part4.userAnswer == 'D'}">
                                <c:set var="userAnswerD" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:set var="correctAnswerD" value=""/>
                            <c:if test="${part4.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part4.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part4.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part4.correctAnswer == 'D'}">
                                <c:set var="correctAnswerD"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${index.count == 1 || index.count == 4}">
                                <div class="row questionPart2a">
                                    <c:if test="${index.count == 4}">
                                        <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                                    </c:if>
                                    <p><b>Question ${index.count + 13} ~ ${index.count + 15} refer to following
                                        conversation:</b></p>
                                    <audio controls>
                                        <source src="${pageContext.request.contextPath}/resources/file/exams/${part4.idExam}/audio/${part4.audio}.mp3"
                                                type="audio/wav">
                                    </audio>
                                </div>
                            </c:if>
                            <div class="questionPart3">
                                <div class="questionPart3a">
                                    <b id="question${index.count + 13}"
                                       questionId="${part4.idQuestion}">Question ${index.count + 13}:</b> ${part4.question}
                                </div>
                                <div>
                                    <input class="part4" type="radio" ${userAnswerA}/> A
                                    &nbsp;<img src="${correctAnswerA}"> <br>
                                    <input class="part4" type="radio" ${userAnswerB}/> B
                                    &nbsp;<img src="${correctAnswerB}"> <br>
                                    <input class="part4" type="radio" ${userAnswerC}/> C
                                    &nbsp;<img src="${correctAnswerC}"> <br>
                                    <input class="part4" type="radio" ${userAnswerD}/> D
                                    &nbsp;<img src="${correctAnswerD}">
                                </div>
                                <div class="examExplain">
                                    <c:if test="${part4.userAnswer == ''}">
                                        <b>Bạn chưa chọn đáp án nào.</b>
                                    </c:if>
                                    <c:if test="${part4.userAnswer != ''}">
                                        <b>Đáp án bạn chọn:</b> ${part4.userAnswer}
                                    </c:if>
                                    <br>
                                    <b>Đáp án đúng:</b> ${part4.correctAnswer}
                                    <br>
                                    <b>Giải thích chi tiết:</b> ${part4.explain}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part5" role="tabpanel" aria-labelledby="nav-part5-tab">
                        <c:forEach items="${listQuestionPart5}" var="part5" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:set var="userAnswerD" value=""/>
                            <c:if test="${part5.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part5.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part5.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>
                            <c:if test="${part5.userAnswer == 'D'}">
                                <c:set var="userAnswerD" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:set var="correctAnswerD" value=""/>
                            <c:if test="${part5.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part5.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part5.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part5.correctAnswer == 'D'}">
                                <c:set var="correctAnswerD"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <div class="questionPart5">
                                <div class="row">
                                    <p>
                                        <b id="question${index.count + 19}"
                                           questionId="${part5.idQuestion}">Question ${index.count+19}:</b> ${part5.question}
                                    </p>
                                </div>
                                <div>
                                    <input class="part5" type="radio" ${userAnswerA}/> A
                                    &nbsp;<img src="${correctAnswerA}"> <br>
                                    <input class="part5" type="radio" ${userAnswerB}/> B
                                    &nbsp;<img src="${correctAnswerB}"> <br>
                                    <input class="part5" type="radio" ${userAnswerC}/> C
                                    &nbsp;<img src="${correctAnswerC}"> <br>
                                    <input class="part5" type="radio" ${userAnswerD}/> D
                                    &nbsp;<img src="${correctAnswerD}">
                                </div>
                                <div class="examExplain">
                                    <c:if test="${part5.userAnswer == ''}">
                                        <b>Bạn chưa chọn đáp án nào.</b>
                                    </c:if>
                                    <c:if test="${part5.userAnswer != ''}">
                                        <b>Đáp án bạn chọn:</b> ${part5.userAnswer}
                                    </c:if>
                                    <br>
                                    <b>Đáp án đúng:</b> ${part5.correctAnswer}
                                    <br>
                                    <b>Giải thích chi tiết:</b> ${part5.explain}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part6" role="tabpanel" aria-labelledby="nav-part6-tab">
                        <c:forEach items="${listQuestionPart6}" var="part6" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:set var="userAnswerD" value=""/>
                            <c:if test="${part6.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part6.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part6.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>
                            <c:if test="${part6.userAnswer == 'D'}">
                                <c:set var="userAnswerD" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:set var="correctAnswerD" value=""/>
                            <c:if test="${part6.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part6.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part6.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part6.correctAnswer == 'D'}">
                                <c:set var="correctAnswerD"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <div class="questionPart6">
                                <c:if test="${index.count == 1 || index.count == 4}">
                                    <div class="row">
                                        <c:if test="${index.count == 4}">
                                            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                                        </c:if>
                                        <p><b>Question ${index.count + 25} ~ ${index.count + 27} refer to following
                                            conversation:</b></p>
                                        <p style="border: 2px dashed #949494;">${part6.sParagraph}</p>
                                    </div>
                                </c:if>
                                <p>
                                    <b id="question${index.count + 25}"
                                       questionId="${part6.idQuestion}">Question ${index.count + 25}:</b>
                                </p>
                                <div>
                                    <input class="part6" type="radio" ${userAnswerA}/> A
                                    &nbsp;<img src="${correctAnswerA}"> <br>
                                    <input class="part6" type="radio" ${userAnswerB}/> B
                                    &nbsp;<img src="${correctAnswerB}"> <br>
                                    <input class="part6" type="radio" ${userAnswerC}/> C
                                    &nbsp;<img src="${correctAnswerC}"> <br>
                                    <input class="part6" type="radio" ${userAnswerD}/> D
                                    &nbsp;<img src="${correctAnswerD}">
                                </div>
                                <div class="examExplain">
                                    <c:if test="${part6.userAnswer == ''}">
                                        <b>Bạn chưa chọn đáp án nào.</b>
                                    </c:if>
                                    <c:if test="${part6.userAnswer != ''}">
                                        <b>Đáp án bạn chọn:</b> ${part6.userAnswer}
                                    </c:if>
                                    <br>
                                    <b>Đáp án đúng:</b> ${part6.correctAnswer}
                                    <br>
                                    <b>Giải thích chi tiết:</b> ${part6.explain}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part7" role="tabpanel" aria-labelledby="nav-part7-tab">
                        <c:forEach items="${listQuestionPart7}" var="part7" varStatus="index">
                            <c:set var="userAnswerA" value=""/>
                            <c:set var="userAnswerB" value=""/>
                            <c:set var="userAnswerC" value=""/>
                            <c:set var="userAnswerD" value=""/>
                            <c:if test="${part7.userAnswer == 'A'}">
                                <c:set var="userAnswerA" value="checked"/>
                            </c:if>
                            <c:if test="${part7.userAnswer == 'B'}">
                                <c:set var="userAnswerB" value="checked"/>
                            </c:if>
                            <c:if test="${part7.userAnswer == 'C'}">
                                <c:set var="userAnswerC" value="checked"/>
                            </c:if>
                            <c:if test="${part7.userAnswer == 'D'}">
                                <c:set var="userAnswerD" value="checked"/>
                            </c:if>

                            <c:set var="correctAnswerA" value=""/>
                            <c:set var="correctAnswerB" value=""/>
                            <c:set var="correctAnswerC" value=""/>
                            <c:set var="correctAnswerD" value=""/>
                            <c:if test="${part7.correctAnswer == 'A'}">
                                <c:set var="correctAnswerA"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part7.correctAnswer == 'B'}">
                                <c:set var="correctAnswerB"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part7.correctAnswer == 'C'}">
                                <c:set var="correctAnswerC"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <c:if test="${part7.correctAnswer == 'D'}">
                                <c:set var="correctAnswerD"
                                       value="${pageContext.request.contextPath}/resources/file/images/correct.png"/>
                            </c:if>
                            <div class="questionPart7">
                                <c:if test="${index.count == 1 || index.count == 4}">
                                    <div class="row">
                                        <c:if test="${index.count == 4}">
                                            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                                        </c:if>
                                        <p><b>Question ${index.count + 31} ~ ${index.count + 33} refer to following
                                            conversation:</b></p>
                                        <p style="border: 2px dashed #949494;">${part7.sParagraph}</p>
                                    </div>
                                </c:if>
                                <p>
                                    <b id="question${index.count+31}"
                                       questionId="${part7.idQuestion}">Question ${index.count+31}:</b>
                                </p>
                                <div>
                                    <input class="part7" type="radio" ${userAnswerA}/> A
                                    &nbsp;<img src="${correctAnswerA}"> <br>
                                    <input class="part7" type="radio" ${userAnswerB}/> B
                                    &nbsp;<img src="${correctAnswerB}"> <br>
                                    <input class="part7" type="radio" ${userAnswerC}/> C
                                    &nbsp;<img src="${correctAnswerC}"> <br>
                                    <input class="part7" type="radio" ${userAnswerD}/> D
                                    &nbsp;<img src="${correctAnswerD}">
                                </div>
                                <div class="examExplain">
                                    <c:if test="${part7.userAnswer == ''}">
                                        <b>Bạn chưa chọn đáp án nào.</b>
                                    </c:if>
                                    <c:if test="${part7.userAnswer != ''}">
                                        <b>Đáp án bạn chọn:</b> ${part7.userAnswer}
                                    </c:if>
                                    <br>
                                    <b>Đáp án đúng:</b> ${part7.correctAnswer}
                                    <br>
                                    <b>Giải thích chi tiết:</b> ${part7.explain}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- The modal -->
                <div class="modal fade" id="flipFlop" tabindex="-1" role="dialog"
                     aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="modalLabel">Xác nhận</h4>
                            </div>
                            <div class="modal-body">Bạn có muốn kết thúc phần nghe ?</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" id="btnSubmit" data-dismiss="modal">
                                    Yes
                                </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>