<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.obj.MyPage" %>
<%@ page import="com.obj.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
  function insertAudio() {
  	  var url = prompt("audio url:");
	  if(url != null && url.length != 0) {
	  		document.getElementById("text").value = document.getElementById("text").value +"$audio src='" + url +"' audio$";
	  }
  }
  function insertVideo() {
	  var url = prompt("video url:");
	  if(url != null && url.length != 0) {
	  		document.getElementById("text").value = document.getElementById("text").value +"$video src='" + url +"' video$";
	  }
  }
  function insertImage() {
	  var url = prompt("image url:");
	  if(url != null && url.length != 0) {
	  		document.getElementById("text").value = document.getElementById("text").value +"$image src='" + url +"' image$";
	  }
  }
  function inputCheck(){
	if(document.getElementById("text").value.length > 511){
		alert("Word count is " + document.getElementById("text").value.length + " > 511.");
		return false;
	}
	if(document.getElementById("text").value.length == 0)
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
		Id:
		<c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
		<a href="${url }"><c:out value="${sessionScope.user.id}"></c:out></a>
		Name:
		<c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
		<a href="${url }"><c:out value="${sessionScope.user.name}"></c:out></a>
		
		${sessionScope.user.id == null?'<a href="Login.jsp">Login</a>':''}
		${sessionScope.user.id == null?'<a href="Register.jsp">Register</a>':''}
		${sessionScope.user.id == null?'':'<a href="Logout">Logout</a>'}
		${sessionScope.user.id == null?'':'<a href="MyReply'.concat('">Reply('.concat(sessionScope.count[0]).concat(')</a>'))}
	</div>
	<br>
	<div id="main">
		<table border=0>
		<c:forEach var="myPageList" items="${requestScope.myPageList }" varStatus="loop">
			<tr>
				<td><c:out value="${myPageList.messageNumber}" /></td>
				<td>
				    <c:url value="MyPageSvl?id=${myPageList.id}&timeStamp=${myPageList.date }" var="url"></c:url>
					<a href="${url }"><c:out value="${myPageList.title} " escapeXml="false"></c:out></a>
				</td>
				<td>
				    <c:url value="Home?id=${myPageList.user.id}" var="url"></c:url>
					<a href="${url }"><c:out value="${myPageList.user.name}"></c:out></a>
				</td>
				<td><c:out value="${myPageList.createDate }"></c:out></td>
				<td><c:out value="&nbsp&nbsp&nbsp&nbsp" escapeXml="false"/></td>
				<td>
				    <c:url value="Home?id=${lastSendMessageUserList[loop.index].id}" var="url"></c:url>
					<a href="${url }"><c:out value="${lastSendMessageUserList[loop.index].name}"></c:out></a>
				</td>
				<td><c:out value="${fn:substring(myPageList.date, 0, 11)}"></c:out></td>
			</tr>
		</c:forEach>
		</table>
		<table>
			<tr>
				<td>
					<c:url value="index?pageNumber=${requestScope.pageNumber - 1 < 1 ? 1:requestScope.pageNumber - 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
					<a href="${url }"><c:out value="PageUp"></c:out></a>
				</td>
				<c:forEach var="eachPageList" items="${requestScope.eachPageList }" varStatus="loop">
						<td>
						    <c:url value="index?pageNumber=${eachPageList.pageNumber}&pageLength=${eachPageList.pageLength }" var="url"></c:url>
							<a href="${url }"><c:out value="${eachPageList.pageNumber}"></c:out></a>
						</td>
				</c:forEach>
				<td>
					<c:url value="index?pageNumber=${requestScope.pageNumber + 1 > requestScope.howManyPage ?requestScope.howManyPage:requestScope.pageNumber + 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
					<a href="${url }"><c:out value="NextPage"></c:out></a>
				</td>
			</tr>
		</table>
		<br>
		<form method="post"  action="sendPage" onsubmit="return inputCheck()">
			<input id="title" name="title" type="text" style="width:352px" maxlength="20"/>
			<br>
			<br>
			<textarea id="text" name="textarea" rows="10" cols="20" style="height:200px;width:352px;color:green;font-size:18px;resize:none;" ></textarea>
			<br>
			<br>
			<input type="button"  value="Audio" onclick="insertAudio()"/>
			<input type="button"  value="Video" onclick="insertVideo()"/>
			<input type="button"  value="Image" onclick="insertImage()"/>
			<input type="reset"  value="Clear"/>
			<input type="submit"  value="SendPage"/>
		</form>
	</div>
	<div id="foot">
	</div>
	
</body>
</html>