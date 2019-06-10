<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
</style>
<script type="text/javascript">
  function replyFunction(floor,messageId,pageNumber,pageLength,userName,pageId) {
      clearDiv();
      document.getElementById("text").focus();
      var log = document.execCommand("inserthtml", false, "<a href='MyPageSvl?id="+ pageId +"&replyId="+ messageId +"&pageNumber="+ pageNumber +"&pageLength="+ pageLength +"#"+ floor +"' >"+"${applicationScope.codePageMap['STR_REPLY']}"+"</a> "+ userName +"(#"+ floor +"):");
      if(!log) {
          var range = window.getSelection().getRangeAt(0);
          var a = document.createElement("a");
          a.setAttribute("href", "MyPageSvl?id="+ pageId +"&replyId="+ messageId +"&pageNumber="+ pageNumber +"&pageLength="+ pageLength +"#"+ floor);
          a.innerHTML = "Reply";
            var txt = document.createTextNode(" "+ userName +"(#"+ floor +"):");
            range.insertNode(txt);
            range.insertNode(a);
      }
      return false;//necessary
  }
  function inputCheck() {
    if(document.getElementById("textarea").value.length > 1024){
        alert("Word count is " + document.getElementById("textarea").value.length + " > 1024.");
        return false;
    }
    if(document.getElementById("textarea").value.length == 0)
        return false;
    return true;
  }
  function back() {
      window.location.href="index";
  }
</script>
<link href="sys/pic/fish58.png" rel="icon"/>
<title>${requestScope.myPage.title}</title>
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
        <a href="index">${applicationScope.codePageMap['STR_INDEX']}</a>
        <span style="float:right;">${applicationScope.codePageMap['STR_SESSION']}:${applicationScope.numMembers}</span>
    </div>
    <div id="main">
        <h1>${requestScope.myPage.title}</h1>
        <table id="main_tb">
            <tr><td colspan="5"><h2>${requestScope.myPage.text}</h2></td></tr>
            <tr>
                <td></td>
                <td width="200px"  style="vertical-align:bottom;">
                    <h2>
                    <c:url value="Home?id=${requestScope.myPage.user.id}" var="url"></c:url>
                    <a href="${url }"><c:out value="${requestScope.myPage.user.name}"></c:out></a>
                    </h2>
                </td>
                <td width="220px" style="vertical-align:bottom;"><h2>${requestScope.myPage.date}</h2></td>
            </tr>
            <c:forEach var="messageList" items="${requestScope.messageList }" >
            <tr><td colspan="5"><a name="${messageList.floorNumber }"></a></td></tr>
            <tr>
                <td colspan="5"><c:out value="${messageList.text }" escapeXml="false"/></td>
            </tr>
            <tr>
                <td></td>
                <td  style="vertical-align:bottom;">
                    <c:url value="Home?id=${messageList.user.id}" var="url"></c:url>
                    <a href="${url }"><c:out value="${messageList.user.name}"></c:out></a>
                </td>
                <td  style="vertical-align:bottom;"><c:out value="${messageList.date }"/></td>
                <td width="50px" style="vertical-align:bottom;">
                    <c:out value="${messageList.floorNumber }"/>
                </td>
                <td width="50px" style="vertical-align:bottom;">
                    <a href="${messageList.id}" onclick="return replyFunction(${messageList.floorNumber },${messageList.id},${requestScope.pageNumber},${requestScope.eachPageList[0].pageLength},'${messageList.user.name}',${requestScope.pageId })"><c:out value="${messageList.id == null?'':applicationScope.codePageMap['STR_REPLY'] }"></c:out></a>
                </td>
            </tr>
            <tr><td colspan="5"><hr></td></tr>
            </c:forEach>
        </table>
        <% pageContext.setAttribute("urlName", "MyPageSvl"); %>
        <% pageContext.setAttribute("paraName", "id"); %>
        <% pageContext.setAttribute("paraValue", request.getAttribute("pageId")); %>
        <%@include file="sys/jsp/each_page.jsp" %>
        <form id="form1" method="post"  action="sendMessage?id=${requestScope.pageId}&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength}" onsubmit="return inputCheck()">
            <%@include file="sys/jsp/editor.jsp" %>
            <input type="button"  value="${applicationScope.codePageMap['STR_SENDMESSAGE']}" onclick="Submit()"/>
            <input type="button"  value="${applicationScope.codePageMap['STR_BACK']}" onclick="back()"/>
        </form>
    </div>
    <div id="foot">
        <span style="float:right;">${applicationScope.codePageMap['STR_CONNECTION']}:${applicationScope.numConn}</span>
    </div>
</body>
</html>