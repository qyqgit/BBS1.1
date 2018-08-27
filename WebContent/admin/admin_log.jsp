<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table style="border-collapse:collapse">
		<tr bgcolor="#EEEEEE">
			<td>ID&nbsp;</td>
			<td>IP&nbsp;</td>
			<td>User&nbsp;</td>
			<td>Date&nbsp;</td>
			<td>URL&nbsp;</td>
		</tr>
		<c:forEach var="myLogList" items="${requestScope.myLogList }" varStatus="loop">
		<tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
			<td><c:out value="${myLogList.id}" /></td>
			<td><c:out value="${myLogList.ip}" /></td>
			<td>
				<c:url value="Home?id=${myLogList.user.id}" var="url"></c:url>
				<a href="${url }"><c:out value="${myLogList.user.name}"></c:out></a>
			</td>
			<td>
				<c:out value="${fn:substring(myLogList.date, 0, 19)}"></c:out>
			</td>
			<td><c:out value="${myLogList.url}"></c:out></td>
		</tr>
		<tr><td colspan="5"><hr></td></tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
				<c:url value="adminLog?pageNumber=${requestScope.pageNumber - 1 < 1 ? 1:requestScope.pageNumber - 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><c:out value="PageUp"></c:out></a>
			</td>
			<c:forEach var="eachPageList" items="${requestScope.eachPageList }" varStatus="loop">
					<td>
					    <c:url value="adminLog?pageNumber=${eachPageList.pageNumber}&pageLength=${eachPageList.pageLength }" var="url"></c:url>
						<a href="${url }"><c:out value="${eachPageList.pageNumber}"></c:out></a>
					</td>
			</c:forEach>
			<td>
				<c:url value="adminLog?pageNumber=${requestScope.pageNumber + 1 > requestScope.howManyPage ?requestScope.howManyPage:requestScope.pageNumber + 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><c:out value="NextPage"></c:out></a>
			</td>
		</tr>
	</table>
</body>
</html>