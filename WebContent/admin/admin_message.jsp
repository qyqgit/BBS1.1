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
			<td>Text&nbsp;</td>
			<td>User&nbsp;</td>
			<td>PageId&nbsp;</td>
			<td>FloorNum&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Date&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Valid&nbsp;</td>
			<td>Delete&nbsp;</td>
		</tr>
		<c:forEach var="messageList" items="${requestScope.messageList }" varStatus="loop">
		<tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
			<td><c:out value="${messageList.id}" /></td>
			<td><c:out value="${messageList.text}" escapeXml="false"/></td>
			<td>
			    <c:url value="Home?id=${messageList.user.id}" var="url"></c:url>
				<a href="${url }"><c:out value="${messageList.user.name}"></c:out></a>
			</td>
			<td>
			    <c:url value="MyPageSvl?id=${messageList.myPage.id}" var="url"></c:url>
				<a href="${url }"><c:out value="${messageList.myPage.id}"></c:out></a>
			</td>
			<td><c:out value="${messageList.floorNumber}"></c:out></td>
			<td>
			    <c:out value="${messageList.invalid}"></c:out>
			</td>
			<td>
			    <c:out value="${fn:substring(messageList.date, 0, 11)}"></c:out>
			</td>
			<td>
			    <c:url value="adminMessage?id=${messageList.id}&method=invalid" var="url"></c:url>
				<a href="${url }"><button type="button">Invalid</button></a>
			</td>
			<td>
			    <c:url value="adminMessage?id=${messageList.id}&method=valid" var="url"></c:url>
				<a href="${url }"><button type="button">Valid</button></a>
			</td>
			<td>
			    <c:url value="adminMessage?id=${messageList.id}&method=delete" var="url"></c:url>
				<a href="${url }">Delete</a>
			</td>
		</tr>
		<tr><td colspan="9"><hr></td></tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
				<c:url value="adminMessage?pageNumber=${requestScope.pageNumber - 1 < 1 ? 1:requestScope.pageNumber - 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><c:out value="PageUp"></c:out></a>
			</td>
			<c:forEach var="eachPageList" items="${requestScope.eachPageList }" varStatus="loop">
					<td>
					    <c:url value="adminMessage?pageNumber=${eachPageList.pageNumber}&pageLength=${eachPageList.pageLength }" var="url"></c:url>
						<a href="${url }"><c:out value="${eachPageList.pageNumber}"></c:out></a>
					</td>
			</c:forEach>
			<td>
				<c:url value="adminMessage?pageNumber=${requestScope.pageNumber + 1 > requestScope.howManyPage ?requestScope.howManyPage:requestScope.pageNumber + 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><c:out value="NextPage"></c:out></a>
			</td>
		</tr>
	</table>
</body>
</html>