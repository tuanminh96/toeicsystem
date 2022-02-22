<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<table id="historyExam"
			class="table table-striped table-bordered taiKhoanVIP"
			style="width: 100%">
			<thead>
				<tr>
					<th style="text-align: center">STT</th>
					<th style="text-align: center">Tên đề thi</th>
					<th style="text-align: center">Ngày thi</th>
					<th style="text-align: center">Thời gian làm</th>
					<th style="text-align: center">Điểm nghe</th>
					<th style="text-align: center">Điểm đọc</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listExamHistoryDTO}" var="examHistoryDTO"
					varStatus="index">
					<tr>
						<td style="text-align: center; width: 30px">${index.count}</td>
						<td>${examHistoryDTO.title}</td>
						<td>${examHistoryDTO.dateTest}</td>
						<td>${examHistoryDTO.totalTimeTest}s</td>
						<td>${examHistoryDTO.scoreListen}/${examHistoryDTO.totalScoreListen}</td>
						<td>${examHistoryDTO.scoreReading}/${examHistoryDTO.totalScoreRead}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
</body>
</html>