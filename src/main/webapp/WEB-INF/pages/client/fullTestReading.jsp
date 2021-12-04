<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bài test Reading</title>
</head>

<style>
.paragraph {
	white-space: pre-wrap;
	word-break: break-word;
	text-align: justify;
	background: #f3f7fa;
	color: #222;
	font-size: 18px;
	font-family: 'Open Sans';
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

#timeReading {
	font-size: 25px;
	margin-left: 100px;
	color: green;
	font-family: 'Open Sans';
}

.web-font {
	font-size: 15px;
	font-family: 'Arial';
}

#backhome {
	margin-left: 25px;
	text-decoration: none;
}

#btnSubmitReading {
}

#btnResultReading {
	margin-bottom: 15px;
	margin-left: 25px;
}

.note {
	text-align: center;
	margin-left: -35px;
	margin-top: 10px;
	display: none;
}
</style>

<script type="text/javascript">
	
</script>
<body>

	<!--Header
==========================-->
	<div class="navbar navbar-default navbar-fixed-top">

		<br>
		<div style="display: block;">
			<p class="col-md-2">
				<a class="btn btn-info btn-lg" href="/webtoeic" id="backhome"
					style="display: inline;"> <span
					class="glyphicon glyphicon-home"></span>
				</a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input
					class="hidden" id="soCauDungListening"
					value="${socauListeningCorrect}">
			</p>
			<p style="font-size: x-large; text-align: center;" class="col-md-10">Reading</p>
		</div>
	</div>
	<!--/End Header-->

	<div id="resutlTest">
		<div id="content" class="container-fluid fill ">
			<form id="submitForm" name="submitForm">
				<div class="row">
					<div id="navigation" class="col-md-3">

						<div class="fix-scrolling">
							<br>
							<div style="position: absolute; left: 1300px; top: 80px;">
								<span id="timeReading">75:00</span>
							</div>
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
							<input data-toggle="modal" data-target="#flipFlop" style="position: absolute; top: 600px;" type="button"
								class="btn btn-danger" id="btnSubmitReading" value="Nộp bài"/> 
								<br> 
								<span class="note" id="noteReading">Click 'Nộp bài' để xem kết quả <br> &nbsp (Listening + Reading)</span>
							<hr width="60%">
						</div>
					</div>
					<div class="col-md-3 ">
						<!-- Placeholder - keep empty -->
					</div>
					<!--Nội dung bài test -->
					<div id="main" class="col-md-8 web-font">

						<ul class="nav nav-tabs" id="tabparts">
							<c:forEach items="${partReading}" var="part">
								<li><a partid="${part.idPart}" href="#${part.idPart}">${part.partName}</a></li>
							</c:forEach>
						</ul>
						<c:forEach items="${partReading}" var="part">
							<p class="part${part.idPart} parttoeic" style="display: none;">
								<b>${part.partName}: ${part.description}</b>
							</p>
						</c:forEach>
						<div class="tab-content">
							<div class="tab-pane active" id="5">
								<c:forEach items="${part5}" var="list">
									<div>
										<p>
											<b>Question ${list.number}:</b>
										</p>
										<pre class="paragraph">${list.question}</pre>

										<input class="part5" type="radio"
											name="question${list.number}" id="question.${list.number}"
											value="A" onclick="markColorReading(this.id)" /> A.
										${list.option1} <br> <input class="part5" type="radio"
											name="question${list.number}" id="question.${list.number}"
											value="B" onclick="markColorReading(this.id)" /> B.
										${list.option2} <br> <input class="part5" type="radio"
											name="question${list.number}" id="question.${list.number}"
											value="C" onclick="markColorReading(this.id)" /> C.
										${list.option3} <br> <input class="part5" type="radio"
											name="question${list.number}" id="question.${list.number}"
											value="D" onclick="markColorReading(this.id)" /> D.
										${list.option4} <br>
									</div>
									<br>
								</c:forEach>
							</div>
							<div class="tab-pane" id="6">
								<c:forEach items="${part6}" var="list">
									<c:if test="${not empty list.paragraph }">
										<pre class="paragraph">${list.paragraph}</pre>
									</c:if>

									<p>
										<b>Question ${list.number}:</b>
									</p>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="A" /> A. ${list.option1} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="B" /> B. ${list.option2} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="C" /> C. ${list.option3} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="D" /> D. ${list.option4} <br>
									<br>
								</c:forEach>
							</div>
							<div class="tab-pane" id="7">
								<c:forEach items="${part7}" var="list">
									<c:if test="${not empty list.paragraph}">
										<pre class="paragraph">${list.paragraph}</pre>
									</c:if>
									<p>
										<b>Question ${list.number}:</b> ${list.question}
									</p>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="A" /> A. ${list.option1} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="B" /> B. ${list.option2} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="C" /> C. ${list.option3} <br>
									<input type="radio" name="question${list.number}"
										id="question.${list.number}"
										onclick="markColorReading(this.id)" value="D" /> D. ${list.option4} <br>
									<br>
								</c:forEach>
							</div>
						</div>
						<c:forEach items="${listQuestion}" var="list">
							<input class="hidden" id="id_bai_exam"
								value="${list.getBaithithu().getBaithithuid()}" />
							<input class="hidden" id="correctanswer"
								name="correctanswer${list.number}" value="${list.correctanswer}" />
						</c:forEach>
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
									<div class="modal-body">Bạn có muốn kết thúc đề thi này ?</div>
									<div class="modal-footer">
										<button onclick="javascript:clickSubmitReading()" type="button" class="btn btn-danger" id=""
											data-dismiss="modal">Yes</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!--/.Footer-->
	</div>
	<script type="text/javascript">
		$('#resutlTest').bind("DOMSubtreeModified", function() {
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