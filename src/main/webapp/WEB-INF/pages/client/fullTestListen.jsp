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

    <script src="${pageContext.request.contextPath}/resources/js/client/baiTestListening.js"></script>
    <style type="text/css">
        .questionPart1 {
            border: 1px solid red;
            height: 400px;
        }

        .questionPart2 {
            border: 1px solid red;
            height: 400px;
        }

        .questionPart3 {
            border: 1px solid red;
            height: 400px;
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
                                    <p>
                                        <b>Question ${index.count}:</b>
                                    </p>
                                    <img src="${pageContext.request.contextPath}/resources/file/exams/${part1.idExam}/images/${part1.sImage}.jpg"
                                         alt="image not found"
                                         style="height: 300px; width: 400px; float: left; margin-right: 10px"/>
                                    <audio controls>
                                        <source src="${pageContext.request.contextPath}/resources/file/exams/${part1.idExam}/audio/${part1.audio}.mp3"
                                                type="audio/wav">
                                    </audio>
                                    <br> <input class="part1" type="radio" name="question${index.count}"
                                                id="question${index.count}" value="A" onclick="markColor(this.id)"/> A
                                    <br> <input class="part1" type="radio" name="question${index.count}"
                                                id="question${index.count}" value="B" onclick="markColor(this.id)"/> B
                                    <br> <input class="part1" type="radio" name="question${index.count}"
                                                id="question${index.count}" value="C" onclick="markColor(this.id)"/> C
                                    <br> <input class="part1" type="radio" name="question${index.count}"
                                                id="question${index.count}" value="D" onclick="markColor(this.id)"/> D
                                    <br>
                                </div>
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part2" role="tabpanel" aria-labelledby="nav-part2-tab">
                        <c:forEach items="${part2}" var="list">
                            <div class="questionPart2">
                                <p>
                                    <b>Question ${list.number}:</b>
                                </p>
                                <audio controls>
                                    <source
                                            src="${pageContext.request.contextPath}/resources/file/exams/${list.getBaithithu().getBaithithuid()}/audio/${list.audiomp3}.mp3"
                                            type="audio/wav">
                                </audio>
                                <br>
                                <input type="radio" name="question${list.number}"
                                       id="question.${list.number}" onclick="markColor(this.id)"
                                       value="A"/> A <br>
                                <input type="radio" name="question${list.number}"
                                       id="question.${list.number}" onclick="markColor(this.id)"
                                       value="B"/> B <br>
                                <input type="radio" name="question${list.number}"
                                       id="question.${list.number}" onclick="markColor(this.id)"
                                       value="C"/> C <br>
                                <br>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part3" role="tabpanel" aria-labelledby="nav-part2-tab">
                        <c:forEach items="${part3}" var="list">
                            <p>
                                <b>Question ${list.number}:</b>
                            </p>
                            <audio controls>
                                <source
                                        src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
                                        type="audio/wav">
                            </audio>

                            <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="A"/> A.${list.option1} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="B"/> B.${list.option2}  <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="C"/> C.${list.option3}  <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="D"/> D.${list.option4}  <br>
                            <br>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part4" role="tabpanel" aria-labelledby="nav-part2-tab">
                        <c:forEach items="${part4}" var="list">
                            <p>
                                <b>Question ${list.number}:</b>
                            </p>
                            <audio controls>
                                <source
                                        src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
                                        type="audio/wav">
                            </audio>

                            <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="A"/> A.${list.option1} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="B"/> B.${list.option2}  <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="C"/> C.${list.option3}  <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}" onclick="markColor(this.id)"
                                   value="D"/> D.${list.option4}  <br>
                            <br>
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
