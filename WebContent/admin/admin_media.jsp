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
			<td>Name&nbsp;</td>
			<td>User&nbsp;</td>
			<td>Download&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Date&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Valid&nbsp;</td>
			<td>Delete&nbsp;</td>
		</tr>
		<c:forEach var="mediaList" items="${requestScope.mediaList }" varStatus="loop">
		<tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
			<td><c:out value="${mediaList.id}" /></td>
			<td><c:out value="${mediaList.name}"></c:out></td>
			<td>
			    <c:url value="Home?id=${mediaList.user.id}" var="url"></c:url>
				<a href="${url }"><c:out value="${mediaList.user.name}"></c:out></a>
			</td>
			<td>
			    <c:url value="${mediaList.url}" var="url"></c:url>
				<a href="${url}"><c:out value="Download"></c:out></a>
		    </td>
			<td><c:out value="${mediaList.invalid}"></c:out></td>
			<td>
			    <c:out value="${fn:substring(mediaList.date, 0, 11)}"></c:out>
			</td>
			<td>
			    <c:url value="adminMedia?id=${mediaList.id}&method=invalid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><button type="button">Invalid</button></a>
			</td>
			<td>
			    <c:url value="adminMedia?id=${mediaList.id}&method=valid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><button type="button">Valid</button></a>
			</td>
			<td>
			    <c:url value="adminMedia?id=${mediaList.id}&method=delete&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }">Delete</a>
			</td>
		</tr>
		<tr><td colspan="9"><hr></td></tr>
		</c:forEach>
	</table>
	<% pageContext.setAttribute("urlName", "adminMedia"); %>
	<% pageContext.setAttribute("paraName", ""); %>
	<% pageContext.setAttribute("paraValue", ""); %>
	<%@include file="../sys/jsp/each_page.jsp" %>
</body>
</html>