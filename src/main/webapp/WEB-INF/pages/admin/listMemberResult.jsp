<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

</script>
</head>
<body>
	<input type="hidden" id="appContext"
		value="${pageContext.request.contextPath}">
	<h3>Xem kết quả thi của thành viên</h3>

	<div class="alert alert-warning alert-dismissible fade show"
		role="alert">
		<strong>Hướng dẫn:</strong> Nhấn vào tên thành viên để xem kết quả chi
		tiết.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<h4 style="color: red" id="info-success"></h4>
	<input id="appContext" type="hidden"
		value="${pageContext.request.contextPath}">
	<table class="table table-hover nhanHieuTable" id="tableMember">
		<thead>
			<tr>
				<th>ID</th>
				<th>Tên đăng nhập</th>
				<th>Tên thành viên</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="listUserOfGroup">
			<c:forEach items="${members}" var="member">
				<tr>
					<td class="center">${member.memId}</td>
					<td class="center"><a href="" data-toggle="modal"
						data-target="#viewResult">${member.memName}</a></td>
					<td class="center">${member.fullName}</td>
					<td class="center"><button type="button" class="viewResultStatics btn btn-info" idmem="${member.memId}"
							data-toggle="modal" data-target="#viewResultStatics">Xem thống kê </button> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="viewResult" tabindex="-1" role="dialog"
		aria-labelleby="myModalLable">
		<div class="modal-dialog" role="document" style="max-width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal">Lịch sử dự thi của
						${member.fullName}</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="listMemberVIP.jsp"></jsp:include>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" id="statisticResult"
		role="dialog" aria-labelleby="myModalLable" id="statisticResult">
		<div class="modal-dialog" role="document" style="max-width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="titleModal" >Thống kê kết quả thi
						của</h4>
				</div>
				<form role="form" id="formAddRemark">
				<div class="modal-body">
					<div class="wrapper" style="width: 40%;">
					<select style="margin-bottom: 30px;" name="" id="" class="form-control" onfocus='this.size=5;' onblur='this.size=1;' onchange='this.size=1; this.blur();'>
    					<c:forEach items="${totalrange}" var="rangee">
    						<option value="">${rangee}</option>
    					</c:forEach>
					</select>
					</div>
					<input type="hidden" id="rangeRs" value="${currange}">
					<input type="hidden" id="weekNum" value="${week}">
					<input type="hidden" id="firstday" value="${firstday}">
					<input type="hidden" id="lastday" value="${lastday}">
					<div class="form-group">
						<div id="chart_div"></div>
						<br />
						<div id="btn-group">
							<button type="button" class="button button-blue" id="none">No Format</button>
							<button type="button" class="button button-blue" id="scientific">Scientific
								Notation</button>
							<button type="button" class="button button-blue" id="decimal">Decimal</button>
							<button type="button" class="button button-blue" id="short">Short</button>
						</div>
					</div>
					<div class="form-group">
						<h5>Đánh giá</h5>
						<textarea name="remark" class="form-control" rows="5" id="remark"></textarea>
					</div>
				</div>
				
				<input type="hidden" id="appContext"
					value="${pageContext.request.contextPath}">
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="close-modal">Close</button>
					<button type="submit" class="btn btn-danger" id="sendRemark" idmem="${member.memId}">Gửi</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$(".viewResultStatics").on('click', function() {
			var idMem = $(this).attr('idmem');
			$("#sendRemark").attr("idmem",idMem);
	        var appContext = $("#appContext").val();
			var dateFrom = $("#firstday").val();
			var dateTo = $("#lastday").val();
			$.ajax({
	                type: "POST",
	                data: {
	                    idMem: idMem,
	                    dateFrom: dateFrom,
	                    dateTo:dateTo
	                },
	                url: appContext + "/admin/api/staticResult",
	                success: function (result) {
	                	loadChartSt(result);
	                },
	                error: function (e) {
	                    alert("Error: ", e);
	                    console.log("Error", e);
	                }
	            });
			
			function loadChartSt(responseSt) {
				
				google.charts.load('current', {'packages':['bar']});
				google.charts.setOnLoadCallback(drawChart);

				function drawChart() {
				  var data = google.visualization.arrayToDataTable([
				    ['Part', 'Đúng', 'Sai'],
				    ['Part I', responseSt.rightPart1, responseSt.wrongPart1],
				    ['Part II', responseSt.rightPart2, responseSt.wrongPart2],
				    ['Part III', responseSt.rightPart3, responseSt.wrongPart3],
				    ['Part IV', responseSt.rightPart4, responseSt.wrongPart4],
				    ['Part V', responseSt.rightPart5, responseSt.wrongPart5],
				    ['Part VI', responseSt.rightPart6, responseSt.wrongPart6],
				    ['Part VII', responseSt.rightPart7, responseSt.wrongPart7]
				  ]);

				  var options = {
				    chart: {
				      title: 'Kết quả thi của user ',
				      subtitle: 'Tuần '+$("#weekNum").val()+' từ: '+$("#rangeRs").val(),
				    },
				    bars: 'vertical',
				    vAxis: {format: 'decimal'},
				    height: 400,
				    colors: ['#1b9e77', '#d95f02']
				  };

				  var chart = new google.charts.Bar(document.getElementById('chart_div'));

				  chart.draw(data, google.charts.Bar.convertOptions(options));

				  var btns = document.getElementById('btn-group');

				  btns.onclick = function (e) {

				    if (e.target.tagName === 'BUTTON') {
				      options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
				      chart.draw(data, google.charts.Bar.convertOptions(options));
				    }
				  }
				}	
			}
			$("#statisticResult").modal('show');
		});

		$(document).on('click','#close-modal', function(e){
		     $(".modal-fade").modal("hide");
		     $(".modal-backdrop").remove();
		});
		
		$("#formAddRemark").validate({
			rules : {
				remark : {
					required : true
				}
			},
			messages : {
				remark : {
					required : "Comment không được để trống"
				}
			},
			submitHandler : function(form) {
				var idMem = $("#sendRemark").attr('idmem');
				var remark = $("#remark").val();
		        var appContext = $("#appContext").val();
		        var dateRange = $("#rangeRs").val();
		        var weekNum = $("#weekNum").val();
				$.ajax({
					type: "POST",
					data: {
						idMem: idMem,
						dateRange: dateRange,
						weekNum: weekNum,
						remark: remark
					},
					url: appContext + "/admin/addRemark",
					success: function(result){
						alert(result);
						$("#statisticResult").modal('hide');
						$(".modal-fade").modal("hide");
					    $(".modal-backdrop").remove();
					},
					error: function (e) {
		                alert("Error: ", e);
		                console.log("Error", e);
		            }
				});
			}
		});
		
	});
	</script>
</body>
</html>