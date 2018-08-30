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
	<table style="border-collapse:collapse;width:960px">
		<tr bgcolor="#EEEEEE">
			<td>ID&nbsp;</td>
			<td>Name&nbsp;</td>
			<td>Password&nbsp;</td>
			<td>Birthday&nbsp;</td>
			<td>Sex&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Date&nbsp;</td>
			<td>Invalid&nbsp;</td>
			<td>Valid&nbsp;</td>
			<td>Delete&nbsp;</td>
		</tr>
		<c:forEach var="userList" items="${requestScope.userList }" varStatus="loop">
		<tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
			<td><c:out value="${userList.id}" /></td>
			<td>
				<c:url value="Home?id=${userList.id}" var="url"></c:url>
				<a href="${url }"><c:out value="${userList.name}"></c:out></a>
			</td>
			<td><c:out value="${userList.password}" /></td>
			<td><c:out value="${userList.age}" /></td>
			<td><c:out value="${userList.sex}"></c:out></td>
			<td><c:out value="${userList.invalid}"></c:out></td>
			<td>
			    <c:out value="${fn:substring(userList.date, 0, 11)}"></c:out>
			</td>
			<td>
			    <c:url value="adminUser?id=${userList.id}&method=invalid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><button type="button">Invalid</button></a>
			</td>
			<td>
			    <c:url value="adminUser?id=${userList.id}&method=valid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><button type="button">Valid</button></a>
			</td>
			<td>
			    <c:url value="adminUser?id=${userList.id}&method=delete&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }">Delete</a>
			</td>
		</tr>
		<tr><td colspan="10"><hr></td></tr>
		</c:forEach>
	</table>
	<table>
		<tr>
			<td>
				<c:url value="adminUser?pageNumber=${requestScope.pageNumber - 1 < 1 ? 1:requestScope.pageNumber - 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><c:out value="PageUp"></c:out></a>
			</td>
			<c:forEach var="eachPageList" items="${requestScope.eachPageList }" varStatus="loop">
					<td>
					    <c:url value="adminUser?pageNumber=${eachPageList.pageNumber}&pageLength=${eachPageList.pageLength }" var="url"></c:url>
						<a href="${url }"><c:out value="${eachPageList.pageNumber}"></c:out></a>
					</td>
			</c:forEach>
			<td>
				<c:url value="adminUser?pageNumber=${requestScope.pageNumber + 1 > requestScope.howManyPage ?requestScope.howManyPage:requestScope.pageNumber + 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
				<a href="${url }"><c:out value="NextPage"></c:out></a>
			</td>
		</tr>
	</table>
</body>
</html>