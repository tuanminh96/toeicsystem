<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ket qua Reading</title>
    <style type="text/css">
        .ratings {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 100%;
            direction: rtl;
            text-align: left;
        }

        .star {
            position: relative;
            line-height: 60px;
            display: inline-block;
            transition: color 0.2s ease;
            color: #ebebeb;
        }

        .star:before {
            content: '\2605';
            width: 60px;
            height: 60px;
            font-size: 60px;
        }

        .star:hover, .star.selected, .star:hover ~ .star, .star.selected ~ .star {
            transition: color 0.8s ease;
            color: orange;
        }
    </style>
</head>

<body>
<input id="baseUrl" value="${pageContext.request.contextPath}" style="display: none;"/>
<h3 style="text-decoration: underline;">Kết quả bài test:</h3>
<br>
<h4 id="totalCorrect" totalCorrect="${total}">Tổng số câu đúng: ${total}/37</h4>
<h4>Số câu đúng phần Listening: ${correctListening}/19 (Time ${timeDoListenExam})</h4>
<h4>Số câu đúng phần Reading: ${correctReading}/18 (Time ${timeDoReadExam})</h4>

<br>
<%-- 	<a style="text-decoration: none;"
    href="<%=request.getContextPath()%>/listExam">Làm các bài test khác</a> --%>
<br>
<br>
<p id="seeDetailedAnswer" style="text-decoration: none; cursor: pointer">Xem giải đáp chi tiết</p>
<br>
<br>
<a style="text-decoration: none;" href="#">Xem top người dùng đạt
    điểm cao bài thi</a>
<br>
<a style="text-decoration: none;" href="<%=request.getContextPath()%>/listExam">Quay lại trang đề thi</a>
<br>
<button data-toggle="modal" data-target="#flipFlop" type="button"
        class="btn btn-warning">Đánh giá
</button>
<div class="modal fade" id="flipFlop" tabindex="-1" role="dialog"
     aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modalLabel">Mời bạn đánh giá về
                    trải nghiệm thi</h4>
            </div>
            <div class="modal-body">
                <ul class="ratings">
                    <li class="star"></li>
                    <li class="star"></li>
                    <li class="star"></li>
                    <li class="star"></li>
                    <li class="star"></li>
                </ul>
                <div class="form-group">
                    <label for="comment">Nhận xét:</label>
                    <textarea class="form-control" rows="5" id="comment"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" id=""
                        data-dismiss="modal">Gửi
                </button>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value='/js/client/resultTestUser.js'/>"></script>
</body>
</html>