<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bài test Toeic</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/client/doExam.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/client/resultTestUser.js"></script>

    <style>
        #backhome {
            text-decoration: none;
            height: 40px;
            margin: 10px 0 10px 25px;
        }

        .titleDoExam {
            font-size: 30px;
            line-height: 60px;
            text-align: center;;
        }

        .headerDoExam {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 60px;
            margin-bottom: 15px;
            z-index: 999;
            background: gainsboro;
        }

        #mainContent {
            margin-top: 75px;
            margin-bottom: 75px;
        }

        #footerExam {
            height: 40px;
            line-height: 40px;
            background: gainsboro;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
<input id="baseUrl" value="${pageContext.request.contextPath}" style="display: none;"/>
<input id="examId" value="${examId}"/>
<!--==========================Start Header==========================-->
<div class="headerDoExam row">
    <div class="col-md-3">
        <a class="btn btn-info btn-lg" href="/webtoeic" id="backhome">
            <i class="fas fa-home"></i>
        </a>
    </div>
    <div class="col-md-6 titleDoExam">
        Bài thi thử toeic
    </div>
    <div class="col-md-3">

    </div>
</div>
<!--==========================/End Header==========================-->

<!--==========================Start Main Content==========================-->
<div id="mainContent" class="container-fluid fill">
    <%--    <jsp:include page="client/fullTestListen.jsp"></jsp:include>--%>
    <%@include file="fullTestListen.jsp" %>
</div>
<!--==========================/End Main Content==========================-->

<!--==========================Start Footer==========================-->
<div id="footerExam">
    Footer
</div>
<!--==========================/End Footer==========================-->

</body>
</html>