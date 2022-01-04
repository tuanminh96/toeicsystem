<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ket qua Reading</title>
    <style type="text/css">
        .mainResultTestUser {
            width: 80%;
            margin: 75px auto;
            text-align: center;
        }

        .result {
            margin: 60px 0;
        }

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
<div class="mainResultTestUser">
    <input id="baseUrl" value="${pageContext.request.contextPath}" style="display: none;"/>
    <div class="row"><h3>Kết quả bài test</h3></div>

    <div class="row result">
        <table class="table table-sm">
            <thead>
            <tr>
                <th scope="col">Phần thi</th>
                <th scope="col">Số câu đúng</th>
                <th scope="col">Số điểm</th>
                <th scope="col">Thời gian làm bài</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Listening</td>
                <td>${correctListening}/${totalListen}</td>
                <td>${scoreListen}</td>
                <td>${timeDoListenExam}</td>
            </tr>
            <tr>
                <td>Reading</td>
                <td>${correctReading}/${totalReading}</td>
                <td>${scoreReading}</td>
                <td>${timeDoReadExam}</td>
            </tr>
            <tr>
                <td>Total:</td>
                <td>${total}/${totalListen+totalReading}</td>
                <td>${totalScore}</td>
                <td>${totalTimeDoExam}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-4">
            <button id="doAnotherExam" type="button" class="btn btn-success">
                <a style="text-decoration:none; color: black;" href="${pageContext.request.contextPath}/listExam">Làm bài thi khác</a></button>
        </div>
        <div class="col-md-4">
            <button id="seeDetailedAnswer" type="button" class="btn btn-info">Xem giải đáp chi tiết</button>
        </div>
        <div class="col-md-4">
            <button data-bs-toggle="modal" data-bs-target="#evaluateExam" type="button"
                    class="btn btn-warning">Đánh giá
            </button>
        </div>
    </div>
</div>

<%--Modal--%>
<div class="modal fade" id="evaluateExam" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Mời bạn đánh giá về
                    trải nghiệm thi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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