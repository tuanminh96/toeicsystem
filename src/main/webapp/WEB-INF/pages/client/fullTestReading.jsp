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
                        <div class="panel-body">
                            <c:forEach items="${part5}" var="quest">
                                <div class="numberCircle part5 parttoeic"
                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>
                            </c:forEach>
                            <c:set var="part5count" value="${part5.size()}"></c:set>
                            <c:forEach items="${part6}" var="quest">
                                <div class="numberCircle part6 parttoeic"
                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>
                            </c:forEach>
                            <c:set var="part6count" value="${part6.size()}"></c:set>
                            <c:forEach items="${part7}" var="quest">
                                <div class="numberCircle part7 parttoeic"
                                     style="display: none;" id="answer${quest.number}">${quest.number}</div>
                            </c:forEach>
                            <c:set var="part7count" value="${part7.size()}"></c:set>
                            <input type="hidden" value="${part5.get(0).number}"
                                   id="firstquest"> <input type="hidden"
                                                           value="${part5count+part6count+part7count}" id="totalquest">
                        </div>
                    </div>

                    <br> <br>
                    <!-- 							<input type="button" class="btn btn-primary"
                        id="btnResultReading" value="Chấm điểm"
                        onclick="clickResutlReading()" /> -->
                    <input data-toggle="modal" data-target="#flipFlop" style="position: absolute; top: 600px;"
                           type="button" class="btn btn-danger" id="btnSubmitReading" value="Nộp bài"/>
                    <br>
                    <span class="note" id="noteReading">Click 'Nộp bài' để xem kết quả <br> &nbsp (Listening + Reading)</span>
                    <hr width="60%">
                </div>
            </div>
            <!--Nội dung bài test -->
            <div class="col-md-9 main">
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
                <c:forEach items="${partReading}" var="part">
                    <p class="part${part.idPart} parttoeic" style="display: none;">
                        <b>${part.partName}: ${part.description}</b>
                    </p>
                </c:forEach>

                <!-- Tab panes -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-part5" role="tabpanel"
                         aria-labelledby="nav-part5-tab">
                        <c:forEach items="${part5}" var="list">
                            <div>
                                <p>
                                    <b>Question ${list.number}:</b>
                                </p>
                                <pre class="paragraph">${list.question}</pre>

                                <input class="part5" type="radio"
                                       name="question${list.number}" id="question.${list.number}"
                                       value="A" onclick="markColorReading(this.id)"/> A.
                                    ${list.option1} <br> <input class="part5" type="radio"
                                                                name="question${list.number}"
                                                                id="question.${list.number}"
                                                                value="B" onclick="markColorReading(this.id)"/> B.
                                    ${list.option2} <br> <input class="part5" type="radio"
                                                                name="question${list.number}"
                                                                id="question.${list.number}"
                                                                value="C" onclick="markColorReading(this.id)"/> C.
                                    ${list.option3} <br> <input class="part5" type="radio"
                                                                name="question${list.number}"
                                                                id="question.${list.number}"
                                                                value="D" onclick="markColorReading(this.id)"/> D.
                                    ${list.option4} <br>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part6" role="tabpanel" aria-labelledby="nav-part6-tab">
                        <c:forEach items="${part6}" var="list">
                            <c:if test="${not empty list.paragraph }">
                                <pre class="paragraph">${list.paragraph}</pre>
                            </c:if>

                            <p>
                                <b>Question ${list.number}:</b>
                            </p>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="A"/> A. ${list.option1} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="B"/> B. ${list.option2} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="C"/> C. ${list.option3} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="D"/> D. ${list.option4} <br>
                            <br>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="nav-part7" role="tabpanel" aria-labelledby="nav-part7-tab">
                        <c:forEach items="${part7}" var="list">
                            <c:if test="${not empty list.paragraph}">
                                <pre class="paragraph">${list.paragraph}</pre>
                            </c:if>
                            <p>
                                <b>Question ${list.number}:</b> ${list.question}
                            </p>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="A"/> A. ${list.option1} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="B"/> B. ${list.option2} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="C"/> C. ${list.option3} <br>
                            <input type="radio" name="question${list.number}"
                                   id="question.${list.number}"
                                   onclick="markColorReading(this.id)" value="D"/> D. ${list.option4} <br>
                            <br>
                        </c:forEach>
                    </div>
                </div>
                <hr>
                <p>End Reading</p>

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
