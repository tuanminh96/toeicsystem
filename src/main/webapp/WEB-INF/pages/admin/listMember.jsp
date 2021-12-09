<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${members}" var="member">
		<tr>
			<td class="center">${member.id}</td>
			<td class="center"><a
				href="${pageContext.request.contextPath}/">${member.username}</a></td>
			<td class="center">${member.hoTen}</td>
			<td class="center">${member.gender}</td>
			<td class="center">${member.gender}</td>
			<td class="center"><a id="" class="red deleteBaiThiThu"><button
						class="delete btn btn-danger">Xóa</button></a></td>
		</tr>
	</c:forEach>
</body>
</html>