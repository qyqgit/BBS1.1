<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
td a img{
    max-height:120px !important;
}
td video{
    max-height:120px !important;
}
</style>
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
                <c:url value="adminMessage?id=${messageList.id}&method=invalid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }"><button type="button">Invalid</button></a>
            </td>
            <td>
                <c:url value="adminMessage?id=${messageList.id}&method=valid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }"><button type="button">Valid</button></a>
            </td>
            <td>
                <c:url value="adminMessage?id=${messageList.id}&method=delete&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }">Delete</a>
            </td>
        </tr>
        <tr><td colspan="10"><hr></td></tr>
        </c:forEach>
    </table>
    <% pageContext.setAttribute("urlName", "adminMessage"); %>
    <% pageContext.setAttribute("paraName", ""); %>
    <% pageContext.setAttribute("paraValue", ""); %>
    <%@include file="../sys/jsp/each_page.jsp" %>
</body>
</html>