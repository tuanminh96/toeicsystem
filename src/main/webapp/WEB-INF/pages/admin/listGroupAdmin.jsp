<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
			<c:set var = "now" value = "${group.createDate}" />
			<td class="center"><fmt:formatDate type = "date" pattern = "dd-MM-yyyy"  value = "${now}" /></td>
			<td class="center">${group.totalMem}</td>
			<td class="center">${group.maxMem}</td>
			<td class="center"><a href="${pageContext.request.contextPath}/admin/delGroup/${group.idGroup}" onclick="return confirm('Bạn có muốn xóa nhóm này?')" class="red deleteGroup" id="del${group.idGroup}" idGroup="${group.idGroup}"><button
						class="delete btn btn-danger">Xóa</button></a></td>
		</tr>
	</c:forEach>
</body>
</html>