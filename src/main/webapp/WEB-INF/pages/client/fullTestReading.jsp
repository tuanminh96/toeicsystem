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

    <script src="${pageContext.request.contextPath}/resources/js/client/baiTestReading.js"></script>
    <style type="text/css">
        .content-left {
            width: 30%;
            position: fixed;
        }

        .content-right {
            width: 67%;
            margin-left: 30%;
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

        #time {
            font-size: 25px;
            margin-left: 100px;
            color: green;
            float: right;
        }

        .timeDoExam {
            height: 60px;
            line-height: 60px;
        }
    </style>
</head>
<body>
<div id="content" class="container-fluid fill">
    <form id="submitForm" name="submitForm">
        <div class="row">
            <div id="navigation" class="content-left">
                <div class="fix-scrolling">
                    <div class="timeDoExam" style="width: 80%">
                        Time <i class="fas fa-clock"> : </i><span id="time">20:00</span>
                    </div>
                    <hr width="80%">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="margin-bottom: 20px">Danh sách câu hỏi</div>
                        <div class="panel-body" style="width: 80%">
                            <c:forEach var="i" begin="20" end="37">
                                <div class="numberCircle" id="answer${i}">${i}</div>
                            </c:forEach>
                        </div>
                    </div>
                    <hr width="80%">
                    <input style="position: fixed;bottom: 80px;left: 5%;" type="button" class="btn btn-danger"
                           value="Nộp bài" data-bs-toggle="modal" data-bs-target="#modalReading"/>
                </div>
            </div>

            <!--Nội dung bài test -->
            <div class="content-right">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-part5-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-part5" type="button" role="tab" aria-controls="nav-part5"
                                aria-selected="true">Part V
                        </button>
                        <button class="nav-link" id="nav-part6-tab" data-bs-toggle="tab" data-bs-target="#nav-part6"
                                type="button" role="tab" aria-controls="nav-part6" aria-selected="false">Part VI
                        </button>
                        <button class="nav-link" id="nav-part7-tab" data-bs-toggle="tab" data-bs-target="#nav-part7"
                                type="button" role="tab" aria-controls="nav-part7" aria-selected="false">Part VII
                        </button>
                    </div>
                </nav>

                <!-- Tab panes -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-part5" role="tabpanel"
                         aria-labelledby="nav-part5-tab">
                        <c:forEach items="${listQuestionPart5}" var="part5" varStatus="index">
                            <div class="questionPart5">
                                <div class="row">
                                    <p>
                                        <b id="question${index.count + 19}"
                                           questionId="${part5.idQuestion}">Question ${index.count+19}:</b> ${part5.question}
                                    </p>
                                </div>
                                <div>
                                    <input class="part5" type="radio" name="question${index.count+19}"
                                           id="question.${index.count+19}" value="A"
                                           onclick="markColorReading(this.id)"/> A. ${part5.option1} <br>
                                    <input class="part5" type="radio" name="question${index.count+19}"
                                           id="question.${index.count+19}" value="B"
                                           onclick="markColorReading(this.id)"/> B. ${part5.option2} <br>
                                    <input class="part5" type="radio" name="question${index.count+19}"
                                           id="question.${index.count+19}" value="C"
                                           onclick="markColorReading(this.id)"/> C. ${part5.option3} <br>
                                    <input class="part5" type="radio" name="question${index.count+19}"
                                           id="question.${index.count+19}" value="D"
                                           onclick="markColorReading(this.id)"/> D. ${part5.option4} <br>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part6" role="tabpanel" aria-labelledby="nav-part6-tab">
                        <c:forEach items="${listQuestionPart6}" var="part6" varStatus="index">
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
                                <input type="radio" name="question${index.count+25}"
                                       id="question.${index.count+25}"
                                       onclick="markColorReading(this.id)" value="A"/> A. ${part6.option1} <br>
                                <input type="radio" name="question${index.count+25}"
                                       id="question.${index.count+25}"
                                       onclick="markColorReading(this.id)" value="B"/> B. ${part6.option2} <br>
                                <input type="radio" name="question${index.count+25}"
                                       id="question.${index.count+25}"
                                       onclick="markColorReading(this.id)" value="C"/> C. ${part6.option3} <br>
                                <input type="radio" name="question${index.count+25}"
                                       id="question.${index.count+25}"
                                       onclick="markColorReading(this.id)" value="D"/> D. ${part6.option4} <br>
                                <br>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part7" role="tabpanel" aria-labelledby="nav-part7-tab">
                        <c:forEach items="${listQuestionPart7}" var="part7" varStatus="index">
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
                                <input type="radio" name="question${index.count+31}"
                                       id="question.${index.count+31}"
                                       onclick="markColorReading(this.id)" value="A"/> A. ${part7.option1} <br>
                                <input type="radio" name="question${index.count+31}"
                                       id="question.${index.count+31}"
                                       onclick="markColorReading(this.id)" value="B"/> B. ${part7.option2} <br>
                                <input type="radio" name="question${index.count+31}"
                                       id="question.${index.count+31}"
                                       onclick="markColorReading(this.id)" value="C"/> C. ${part7.option3} <br>
                                <input type="radio" name="question${index.count+31}"
                                       id="question.${index.count+31}"
                                       onclick="markColorReading(this.id)" value="D"/> D. ${part7.option4} <br>
                                <br>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <hr>
                <p>End Reading</p>
            </div>
        </div>
    </form>
    <!-- Modal -->
    <div class="modal fade" id="modalReading" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Xác nhận</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có muốn kết thúc phần thi đọc và nộp bài?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="btnSubmitReading" type="button" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
