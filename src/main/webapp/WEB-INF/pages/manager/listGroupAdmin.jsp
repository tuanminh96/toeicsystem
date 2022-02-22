<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${groups}" var="group">
		<tr>
			<td class="center">${group.groupCode}</td>
			<c:choose>
			<c:when test="${group.delFlag==1}">
				<td class="center">${group.name}</td>
			</c:when>
			<c:otherwise>
				<td class="center"><a
					href="${pageContext.request.contextPath}/admin/group_detail/${group.idGroup}">${group.name}</a></td>
			</c:otherwise>
			</c:choose>
			<td class="center">${group.createDate}</td>
			<td class="center">${group.totalMem}</td>
			<td class="center">
			<c:choose>
			<c:when test="${group.delFlag==1}">DELETED</c:when>
			<c:otherwise>ACTIVE</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
</body>
</html>