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
			<td class="center"><a
				href="${pageContext.request.contextPath}/admin/group_detail/${group.idGroup}">${group.name}</a></td>
			<td class="center">${group.createDate}</td>
			<td class="center">${group.totalMem}</td>
			<td class="center"><a id="" class="red deleteBaiThiThu"><button
						class="delete btn btn-danger">Xóa</button></a></td>
		</tr>
	</c:forEach>
</body>
</html>