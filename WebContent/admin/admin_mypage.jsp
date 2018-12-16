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
			<td>Title&nbsp;</td>
			<td>Num&nbsp;</td>
			<td>Author&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>CreateDate&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Valid&nbsp;</td>
			<td>Delete&nbsp;</td>
		</tr>
		<c:forEach var="myPageList" items="${requestScope.myPageList }" varStatus="loop">
		<tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
			<td><c:out value="${myPageList.id}" /></td>
			<td>
			    <c:url value="MyPageSvl?id=${myPageList.id}&timeStamp=${myPageList.date }" var="url"></c:url>
				<a href="${url }" style="text-decoration:none;"><c:out value="${myPageList.title} " escapeXml="false"></c:out></a>
			</td>
			<td><c:out value="${myPageList.messageNumber}" /></td>
			<td>
			    <c:url value="Home?id=${myPageList.user.id}" var="url"></c:url>
				<a href="${url }"><c:out value="${myPageList.user.name}"></c:out></a>
			</td>
			<td><c:out value="${myPageList.invalid}"></c:out></td>
			<td>
			    <c:out value="${fn:substring(myPageList.createDate, 0, 11)}"></c:out>
			</td>
			<td>
			    <c:url value="adminPage?id=${myPageList.id}&method=invalid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><button type="button">Invalid</button></a>
			</td>
			<td>
			    <c:url value="adminPage?id=${myPageList.id}&method=valid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><button type="button">Valid</button></a>
			</td>
			<td>
			    <c:url value="adminPage?id=${myPageList.id}&method=delete&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }">Delete</a>
			</td>
		</tr>
		<tr><td colspan="9"><hr></td></tr>
		</c:forEach>
	</table>
	<% pageContext.setAttribute("urlName", "adminPage"); %>
	<% pageContext.setAttribute("paraName", ""); %>
	<% pageContext.setAttribute("paraValue", ""); %>
	<%@include file="../sys/jsp/each_page.jsp" %>
</body>
</html>