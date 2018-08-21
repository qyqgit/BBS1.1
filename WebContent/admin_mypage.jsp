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
				<td>ID</td>
				<td>Title</td>
				<td>Author</td>
				<td>Num</td>
				<td>CreateDate</td>
				<td>Invalid</td>
			</tr>
			<c:forEach var="myPageList" items="${requestScope.myPageList }" varStatus="loop">
			<tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
				<td><c:out value="${myPageList.id}" /></td>
				<td>
				    <c:url value="MyPageSvl?id=${myPageList.id}&timeStamp=${myPageList.date }" var="url"></c:url>
					<a href="${url }" style="text-decoration:none;"><c:out value="${myPageList.title} " escapeXml="false"></c:out></a>
				</td>
				<td>
				    <c:url value="Home?id=${myPageList.user.id}" var="url"></c:url>
					<a href="${url }"><c:out value="${myPageList.user.name}"></c:out></a>
				</td>
				<td><c:out value="${myPageList.messageNumber}" /></td>
				<td>
				    <c:out value="${fn:substring(myPageList.createDate, 0, 11)}"></c:out>
				</td>
				<td><c:out value="${myPageList.id}"></c:out></td>
			</tr>
			<tr><td colspan="6"><hr></td></tr>
			</c:forEach>
	</table>
</body>
</html>