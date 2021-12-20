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

<%--    <script src="${pageContext.request.contextPath}/resources/js/client/baiTestReading.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/js/client/baiTestListening.js"></script>

    <style type="text/css">
        .question {
            height: 40px;
            line-height: 40px;
            margin: 0 0 10px 0;
        }

        .questionPart1 {
            height: 400px;
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
    </style>
</head>
<body>
<div id="content" class="container-fluid fill">
    <form id="submitForm" name="submitForm">
        <div class="row">
            <div id="navigation" class="col-md-3">
                <div class="fix-scrolling">
                    <br>
                    Time: <span id="time">20:00</span>
                    <hr width="60%">
                    <div class="panel panel-info">
                        <div class="panel-heading">Danh sách câu hỏi</div>
                        <%--                        <div class="panel-body">--%>
                        <%--                            <c:forEach items="${part1}" var="quest">--%>
                        <%--                                <div class="numberCircle part1 parttoeic"--%>
                        <%--                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>--%>
                        <%--                            </c:forEach>--%>
                        <%--                            <c:set var="part1count" value="${part1.size()}"></c:set>--%>
                        <%--                            <c:forEach items="${part2}" var="quest">--%>
                        <%--                                <div class="numberCircle part2 parttoeic"--%>
                        <%--                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>--%>
                        <%--                            </c:forEach>--%>
                        <%--                            <c:set var="part2count" value="${part2.size()}"></c:set>--%>
                        <%--                            <c:forEach items="${part3}" var="quest">--%>
                        <%--                                <div class="numberCircle part3 parttoeic"--%>
                        <%--                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>--%>
                        <%--                            </c:forEach>--%>
                        <%--                            <c:set var="part3count" value="${part3.size()}"></c:set>--%>
                        <%--                            <c:forEach items="${part4}" var="quest">--%>
                        <%--                                <div class="numberCircle part4 parttoeic"--%>
                        <%--                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>--%>
                        <%--                            </c:forEach>--%>
                        <%--                            <c:set var="part4count" value="${part4.size()}"></c:set>--%>
                        <%--                            <input type="hidden"--%>
                        <%--                                   value="${part1count+part2count+part3count+part4count}"--%>
                        <%--                                   id="totalquest">--%>
                        <%--                        </div>--%>
                    </div>

                    <br> <br>
                    <!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
                    <!-- 							<input type="button" class="btn btn-primary" id="btnResult"
                        value="Chấm điểm" />  -->
                    <input id="doReading" style="position: absolute; top: 600px;"
                           type="button"
                           class="btn btn-danger" value="Làm bài đọc"/>
                    <br>
                    <hr width="60%">
                </div>
            </div>
            <!--Nội dung bài test -->
            <div class="col-md-9 main">
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
                            <c:if test="${not empty part1.sImage}">
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
                                            <br> <input class="part1" type="radio" name="question${index.count}"
                                                        id="question${index.count}" value="A"
                                                        onclick="markColorListening(this.id)"/> A
                                            <br> <input class="part1" type="radio" name="question${index.count}"
                                                        id="question${index.count}" value="B"
                                                        onclick="markColorListening(this.id)"/> B
                                            <br> <input class="part1" type="radio" name="question${index.count}"
                                                        id="question${index.count}" value="C"
                                                        onclick="markColorListening(this.id)"/> C
                                            <br> <input class="part1" type="radio" name="question${index.count}"
                                                        id="question${index.count}" value="D"
                                                        onclick="markColorListening(this.id)"/> D
                                            <br>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part2" role="tabpanel" aria-labelledby="nav-part2-tab">
                        <c:forEach items="${listQuestionPart2}" var="part2" varStatus="index">
                            <c:if test="${index.count == 1}">
                                <div class="row questionPart2a">
                                    <audio controls style="width: 100%">
                                        <source src="${pageContext.request.contextPath}/resources/file/exams/${part2.idExam}/audio/${part2.audio}.mp3"
                                                type="audio/wav">
                                    </audio>
                                </div>
                            </c:if>
                            <div class="questionPart2b col-md-4">
                                <div class="row" style="padding-bottom: 10px">
                                    <b id="question${index.count + 2}"
                                       questionId="${part2.idQuestion}">Question ${index.count + 2}:</b>
                                </div>
                                <div>
                                    <input type="radio" name="question${index.count + 2}"
                                           id="question${index.count + 2}" onclick="markColorListening(this.id)"
                                           value="A"/> A <br>
                                    <input type="radio" name="question${index.count + 2}"
                                           id="question${index.count + 2}" onclick="markColorListening(this.id)"
                                           value="B"/> B <br>
                                    <input type="radio" name="question${index.count + 2}"
                                           id="question${index.count + 2}" onclick="markColorListening(this.id)"
                                           value="C"/> C
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part3" role="tabpanel" aria-labelledby="nav-part3-tab">
                        <c:forEach items="${listQuestionPart3}" var="part3" varStatus="index">
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
                                    <input type="radio" name="question${index.count + 7}"
                                           id="question${index.count + 7}" onclick="markColorListening(this.id)"
                                           value="A"/> A.${part3.option1} <br>
                                    <input type="radio" name="question${index.count + 7}"
                                           id="question${index.count + 7}" onclick="markColorListening(this.id)"
                                           value="B"/> B.${part3.option2} <br>
                                    <input type="radio" name="question${index.count + 7}"
                                           id="question${index.count + 7}" onclick="markColorListening(this.id)"
                                           value="C"/> C.${part3.option3} <br>
                                    <input type="radio" name="question${index.count + 7}"
                                           id="question${index.count + 7}" onclick="markColorListening(this.id)"
                                           value="D"/> D.${part3.option4} <br>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part4" role="tabpanel" aria-labelledby="nav-part4-tab">
                        <c:forEach items="${listQuestionPart4}" var="part4" varStatus="index">
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
                                       questionId="${part4.idQuestion}">Question ${index.count + 13}:</b>${part4.question}
                                </div>
                                <div>
                                    <input type="radio" name="question${index.count + 13}"
                                           id="question${index.count + 13}" onclick="markColorListening(this.id)"
                                           value="A"/> A.${part4.option1} <br>
                                    <input type="radio" name="question${index.count + 13}"
                                           id="question${index.count + 13}" onclick="markColorListening(this.id)"
                                           value="B"/> B.${part4.option2} <br>
                                    <input type="radio" name="question${index.count + 13}"
                                           id="question${index.count + 13}" onclick="markColorListening(this.id)"
                                           value="C"/> C.${part4.option3} <br>
                                    <input type="radio" name="question${index.count + 13}"
                                           id="question${index.count + 13}" onclick="markColorListening(this.id)"
                                           value="D"/> D.${part4.option4} <br>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <%--                <c:forEach items="${listQuestion}" var="list2">--%>
                <%--                    <input class="hidden" id=" answer"--%>
                <%--                           name="correctanswer${list2.number}"--%>
                <%--                           value="${list2.correctanswer}"/>--%>
                <%--                </c:forEach>--%>
                <hr>
                <p>End Part</p>

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
<%--<script type="text/javascript">--%>
<%--    $(document).ready(function () {--%>
<%--        $('#tabs a').click(function (e) {--%>
<%--            e.preventDefault();--%>
<%--            $(this).tab('show');--%>
<%--            $('.parttoeic').hide();--%>
<%--            var a = '.part' + $(this).attr('partid');--%>
<%--            $(a).show();--%>
<%--        });--%>
<%--        $('.part1').show();--%>
<%--    });--%>
<%--</script>--%>

<%--<script type="text/javascript">--%>
<%--    $('#testReading').bind("DOMSubtreeModified", function () {--%>
<%--        $('#tabparts a').click(function (e) {--%>
<%--            e.preventDefault();--%>
<%--            $(this).tab('show');--%>
<%--            $('.parttoeic').hide();--%>
<%--            var a = '.part' + $(this).attr('partid');--%>
<%--            $(a).show();--%>

<%--        });--%>
<%--        $('.part5').show();--%>
<%--        if ($('.part6').is(":visible") || $('.part7').is(":visible")) {--%>
<%--            $('.part5').hide();--%>
<%--        }--%>

<%--        var star = '.star', selected = '.selected';--%>

<%--        $(star).on('click', function () {--%>
<%--            $(selected).each(function () {--%>
<%--                $(this).removeClass('selected');--%>
<%--            });--%>
<%--            $(this).addClass('selected');--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
