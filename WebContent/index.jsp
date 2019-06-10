<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
</style>
<script type="text/javascript">
  function inputCheck() {
    if(document.getElementById("textarea").value.length > 1024){
        alert("Word count is " + document.getElementById("textarea").value.length + " > 1024.");
        return false;
    }
    if(document.getElementById("textarea").value.length == 0)
        return false;
    if(document.getElementById("title").value.length == 0)
        return false;
    return true;
  }
</script>
<title>fishcc.org</title>
<link href="sys/pic/fish58.png" rel="icon"/>
</head>
<body>
    <div id="head">
        ${applicationScope.codePageMap['STR_ID']}:
        <c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
        <a href="${url }"><c:out value="${sessionScope.user.id}"></c:out></a>
        ${applicationScope.codePageMap['STR_NAME']}:
        <c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
        <a href="${url }"><c:out value="${sessionScope.user.name}"></c:out></a>
        
        ${sessionScope.user.id == null?'<a href="Login.jsp">'.concat(applicationScope.codePageMap["STR_LOGIN"]).concat("</a>"):''}
        ${sessionScope.user.id == null?'<a href="Register.jsp">'.concat(applicationScope.codePageMap["STR_REG"]).concat("</a>"):''}
        ${sessionScope.user.id == null?'':'<a href="Logout">'.concat(applicationScope.codePageMap["STR_LOGOUT"]).concat("</a>")}
        ${sessionScope.user.id == null?'':'<a href="MyReply">'.concat(applicationScope.codePageMap["STR_REPLY"]).concat('(').concat(sessionScope.count[0]).concat(')</a>')}
        <span style="float:right;">${applicationScope.codePageMap['STR_SESSION']}:${applicationScope.numMembers}</span>
        <img src="sys/pic/default_head20141014.png">
    </div>
    <br>
    <div id="main">
        <table id="main_tb">
            <tr bgcolor="#EEEEEE">
                <td>${applicationScope.codePageMap['STR_NUM']}</td>
                <td>${applicationScope.codePageMap['STR_TITLE']}</td>
                <td>${applicationScope.codePageMap['STR_AUTHOR']}</td>
                <td><c:out value="&nbsp;&nbsp;&nbsp;&nbsp;" escapeXml="false"/></td>
                <td colspan="2">${applicationScope.codePageMap['STR_REPLY']}</td>
            </tr>
            <c:forEach var="myPageList" items="${requestScope.myPageList }" varStatus="loop">
            <tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
                <td><c:out value="${myPageList.messageNumber}" /></td>
                <td>
                    <c:url value="MyPageSvl?id=${myPageList.id}&timeStamp=${myPageList.date }" var="url"></c:url>
                    <a href="${url }" style="text-decoration:none;"><c:out value="${myPageList.title} " escapeXml="false"></c:out></a>
                </td>
                <td>
                    <c:url value="Home?id=${myPageList.user.id}" var="url"></c:url>
                    <a href="${url }"><c:out value="${myPageList.user.name}"></c:out></a>
                </td>
                <td><c:out value="&nbsp;&nbsp;&nbsp;&nbsp;" escapeXml="false"/></td>
                <td>
                    <c:url value="Home?id=${lastSendMessageUserList[loop.index].id}" var="url"></c:url>
                    <a href="${url }"><c:out value="${lastSendMessageUserList[loop.index].name}"></c:out></a>
                </td>
                <td><c:out value="${fn:substring(myPageList.date, 0, 11)}"></c:out></td>
            </tr>
            <tr><td colspan="6"><hr></td></tr>
            </c:forEach>
        </table>
        <% pageContext.setAttribute("urlName", "index"); %>
        <% pageContext.setAttribute("paraName", ""); %>
        <% pageContext.setAttribute("paraValue", ""); %>
        <%@include file="sys/jsp/each_page.jsp" %>
        <br>
        <form id="form1" method="post"  action="sendPage" onsubmit="return inputCheck()">
            <input id="title" name="title" type="text" style="width:570px" maxlength="40"/>
            <br>
            <br>
            <%@include file="sys/jsp/editor.jsp" %>
            <input type="button"  value="${applicationScope.codePageMap['STR_SENDPAGE']}" onclick="Submit()"/>
        </form>
    </div>
    <div id="foot">
        <span style="float:right;">${applicationScope.codePageMap['STR_CONNECTION']}:${applicationScope.numConn}</span>
    </div>
</body>
</html>