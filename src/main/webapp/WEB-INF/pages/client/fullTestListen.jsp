<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bài test Toeic</title>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/baiTestListening.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/client/baiTestReading.js"></script>
</head>

<style>
.paragraph {
	white-space: pre-wrap;
	word-break: break-word;
	text-align: justify;
	background: #f3f7fa;
	color: #222;
	font-size: 14px;
	font-style: 'Roboto';
}

#main {
	padding-top: 120px;
	overflow: hidden;
}

@media ( min-width : 767px) {
	#navigation {
		margin-top: 50px;
		position: fixed;
	}
}

.fix-scrolling {
	max-height: 450px;
	/*overflow-y: scroll;*/
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
	color: green
}

#backhome {
	margin-left: 25px;
	text-decoration: none;
}

#btnSubmit {

}

#btnResult {
	margin-bottom: 15px;
	margin-left: 25px;
}

#btndoAgain {
	display: none;
	margin-bottom: 15px;
	margin-left: 40px;
}

.web-font {
	font-size: 15px;
	font-family: 'Arial';
}
</style>

<script type="text/javascript">
	
</script>
<body>

	<!--Header
==========================-->
	<div class="testReading" id="testReading">
		<div class="row navbar navbar-default navbar-fixed-top">
			<br>
			<div style="display: block;">
				<p class="col-md-2">
					<a class="btn btn-info btn-lg" href="/webtoeic" id="backhome">
						<span class="glyphicon glyphicon-home"></span>
					</a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
				</p>
				<p style="font-size: x-large; text-align: center;" class="col-md-10">Listening</p>
			</div>
		</div>

		<!--/End Header-->

		<div id="content" class="container-fluid fill">
			<form id="submitForm" name="submitForm">
				<div class="row">
					<div id="navigation" class="col-md-3">

						<div class="fix-scrolling">
							<br>
							<div style="position: absolute; left: 1300px; top: 50px;">
								<div>
									<span id="time">45:00</span>
								</div>
							</div>
							<hr width="60%">
							<div class="panel panel-info">
								<div class="panel-heading">Danh sách câu hỏi</div>
								<div class="panel-body">
									<c:forEach items="${part1}" var="quest">
										<div class="numberCircle part1 parttoeic"
											style="display: none;" id="answer${quest.number}">${quest.number}</div>
									</c:forEach>
									<c:set var="part1count" value="${part1.size()}"></c:set>
									<c:forEach items="${part2}" var="quest">
										<div class="numberCircle part2 parttoeic"
											style="display: none;" id="answer${quest.number}">${quest.number}</div>
									</c:forEach>
									<c:set var="part2count" value="${part2.size()}"></c:set>
									<c:forEach items="${part3}" var="quest">
										<div class="numberCircle part3 parttoeic"
											style="display: none;" id="answer${quest.number}">${quest.number}</div>
									</c:forEach>
									<c:set var="part3count" value="${part3.size()}"></c:set>
									<c:forEach items="${part4}" var="quest">
										<div class="numberCircle part4 parttoeic"
											style="display: none;" id="answer${quest.number}">${quest.number}</div>
									</c:forEach>
									<c:set var="part4count" value="${part4.size()}"></c:set>
									<input type="hidden"
										value="${part1count+part2count+part3count+part4count}"
										id="totalquest">
								</div>

							</div>

							<br> <br>
							<!-- 	<input type="button" id="btndoAgain" class="btn btn-warning" value="Làm lại"> -->
							<!-- 							<input type="button" class="btn btn-primary" id="btnResult"
								value="Chấm điểm" />  -->
							<input data-toggle="modal" data-target="#flipFlop" style="position: absolute; top: 600px;" type="button"
								class="btn btn-danger" value="Làm bài đọc" /> 
							<br>
							<hr width="60%">
						</div>


					</div>

					<div class="col-md-3 ">
						<!-- Placeholder - keep empty -->
					</div>

					<!--Nội dung bài test -->
					<div id="main" class="col-md-8 web-font">
						<ul class="nav nav-tabs" id="tabs">
							<c:forEach items="${partListen}" var="part" varStatus="index">
								<c:choose>
									<c:when test="${index.count=='1'}">
										<li class="active"><a partid="${part.idPart}" href="#${part.idPart}">${part.partName}</a></li>
									</c:when>
									<c:otherwise>
										<li><a partid="${part.idPart}" href="#${part.idPart}">${part.partName}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
						<c:forEach items="${partListen}" var="part">
							<p class="part${part.idPart} parttoeic"
								style="margin-top: 20px; display: none;">
								<b>${part.partName}: ${part.description}</b>
							</p>
						</c:forEach>

						<div class="tab-content">
							<div class="tab-pane active" id="1">
								<c:forEach items="${part1}" var="list">
									<c:if test="${list.number == 1 }">
										<input class="hidden" id="id_bai_exam"
											value="${list.getBaithithu().getBaithithuid()}" />
									</c:if>
									<c:if test="${not empty list.image}">
										<div class="container">
											<p>
												<b>Question ${list.number}:</b>
											</p>

											<img
												src="${pageContext.request.contextPath}/resources/file/exams/${list.getBaithithu().getBaithithuid()}/images/${list.image}.jpg"
												alt="image not found"
												style="height: 300px; width: 400px; float: left; margin-right: 10px" />
											<audio controls> <source
												src="${pageContext.request.contextPath}/resources/file/exams/${list.getBaithithu().getBaithithuid()}/audio/${list.audiomp3}.mp3"
												type="audio/wav"></audio>
											<br> <input class="part1" type="radio"
												name="question${list.number}" id="question.${list.number}"
												value="A" onclick="markColor(this.id)" /> A <br> <input
												class="part1" type="radio" name="question${list.number}"
												id="question.${list.number}" value="B"
												onclick="markColor(this.id)" /> B <br> <input
												class="part1" type="radio" name="question${list.number}"
												id="question.${list.number}" value="C"
												onclick="markColor(this.id)" /> C <br> <input
												class="part1" type="radio" name="question${list.number}"
												id="question.${list.number}" value="D"
												onclick="markColor(this.id)" /> D <br>
										</div>
										<br>
									</c:if>
								</c:forEach>
							</div>
							<div class="tab-pane" id="2">
								<c:forEach items="${part2}" var="list">
									<p>
										<b>Question ${list.number}:</b>
									</p>
									<audio controls> <source
										src="${pageContext.request.contextPath}/resources/file/exams/${list.getBaithithu().getBaithithuid()}/audio/${list.audiomp3}.mp3"
										type="audio/wav"></audio>
									<br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="A" /> A <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="B" /> B <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="C" /> C <br>
									<br>
								</c:forEach>
							</div>
							<div class="tab-pane" id="3">
								<c:forEach items="${part3}" var="list">
									<p>
										<b>Question ${list.number}:</b>
									</p>
									<audio controls> <source
										src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
										type="audio/wav"></audio>

									<br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="A" /> A.${list.option1} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="B" /> B.${list.option2}  <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="C" /> C.${list.option3}  <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="D" /> D.${list.option4}  <br>
									<br>
								</c:forEach>
							</div>
							<div class="tab-pane" id="4">
								<c:forEach items="${part4}" var="list">
									<p>
										<b>Question ${list.number}:</b>
									</p>
									<audio controls> <source
										src="${pageContext.request.contextPath}/resources/file/audio/exam/${list.audiomp3}.mp3"
										type="audio/wav"></audio>

									<br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="A" /> A.${list.option1} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="B" /> B.${list.option2}  <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="C" /> C.${list.option3}  <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}" onclick="markColor(this.id)"
										value="D" /> D.${list.option4}  <br>
									<br>
								</c:forEach>
							</div>
						</div>
						<c:forEach items="${listQuestion}" var="list2">
							<input class="hidden" id=" answer"
								name="correctanswer${list2.number}"
								value="${list2.correctanswer}" />

						</c:forEach>
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
									<button type="button" class="btn btn-danger" id="btnSubmit" data-dismiss="modal">Yes</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#tabs a').click(function(e) {
					e.preventDefault();
					$(this).tab('show');
					$('.parttoeic').hide();
					var a = '.part' + $(this).attr('partid');
					$(a).show();

				});
				$('.part1').show();
			});
		</script>
	</div>

	<!--Footer
==========================-->

<!-- Vì load lại trang bằng ajax, mỗi khi sang trang sau sẽ đổ content vào div testReading nên phải bắt sự kiện bind này ở trang chính thì mới ăn -->
	<!--/.Footer-->
	<script type="text/javascript">
		$('#testReading').bind("DOMSubtreeModified", function() {
			$('#tabparts a').click(function(e) {
				e.preventDefault();
				$(this).tab('show');
				$('.parttoeic').hide();
				var a = '.part' + $(this).attr('partid');
				$(a).show();

			});
			$('.part5').show();
			if ($('.part6').is(":visible") || $('.part7').is(":visible")) {
				$('.part5').hide();
			}
			
			var star = '.star', selected = '.selected';

			$(star).on('click', function() {
				$(selected).each(function() {
					$(this).removeClass('selected');
				});
				$(this).addClass('selected');
			});
		});
	</script>
</body>
</html>