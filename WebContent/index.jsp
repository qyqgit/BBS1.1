<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	#more{
	  position: relative;
	}
	#morein{
	  position: absolute;
	  left: 25px;
	  bottom: 25px;
      border-collapse:collapse;
      background-color: white;
      display:none;
	}
    .td{
      border: 1px solid black;
    }
</style>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('morein').style.display = 'none';
  }
  
  function addEmoji(){
    if(document.getElementById('morein').style.display == 'none')
      document.getElementById('morein').style.display='block';
    else
      document.getElementById('morein').style.display='none';
  }
  function emojiFun(emoji) {
      var log = document.execCommand("insertimage", false, emoji);
      console.log(log);
      addEmoji();
  }

  function Submit(){
      document.getElementById("textarea").value=document.getElementById("text").innerHTML;
	  if(inputCheck())
      	document.getElementById("form1").submit();
  }
  
  function insertAudio() {
  	  var url = prompt("audio url:");
	  if(url != null && url.length != 0) {
	      var log = document.execCommand("inserthtml", false, "&nbsp;<audio src='" + url + "' controls='controls' loop='loop'></audio>&nbsp;");
	      console.log(log);
	  }
  }
  function insertVideo() {
	  var url = prompt("video url:");
	  if(url != null && url.length != 0) {
	      var log = document.execCommand("inserthtml", false, "&nbsp;<video src='" + url + "' controls='controls' style='max-width:1024px;max-height:576px'></video>&nbsp;");
	      console.log(log);
	  }
  }
  function insertImage() {
	  var url = prompt("image url:");
	  if(url != null && url.length != 0) {
	      var log = document.execCommand("insertimage", false, url);
	      console.log(log);
	  }
  }
  function clearDiv() {
	  document.getElementById("text").innerHTML = "";
  }
  function inputCheck(){
	if(document.getElementById("textarea").value.length > 511){
		alert("Word count is " + document.getElementById("textarea").value.length + " > 511.");
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
		<span style="float:right;">Members:${applicationScope.numMembers}</span>
		<img src="sys/pic/default_head20141014.png">
	</div>
	<br>
	<div id="main">
		<table id="main_tb">
			<tr bgcolor="#EEEEEE">
				<td>Num</td>
				<td>Title</td>
				<td>Author</td>
				<td><c:out value="&nbsp;&nbsp;&nbsp;&nbsp;" escapeXml="false"/></td>
				<td colspan="2">Reply</td>
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
				<td><c:out value="&nbsp;&nbsp;&nbsp;&nbsp" escapeXml="false"/></td>
				<td>
				    <c:url value="Home?id=${lastSendMessageUserList[loop.index].id}" var="url"></c:url>
					<a href="${url }"><c:out value="${lastSendMessageUserList[loop.index].name}"></c:out></a>
				</td>
				<td><c:out value="${fn:substring(myPageList.date, 0, 11)}"></c:out></td>
			</tr>
			<tr><td colspan="6"><hr></td></tr>
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
		<form id="form1" method="post"  action="sendPage" onsubmit="return inputCheck()">
			<input id="title" name="title" type="text" style="width:352px" maxlength="30"/>
			<br>
			<br>
			<div id="text"  contentEditable="true" style="width:358px;height:206px;border:1px solid black;overflow:auto; ">
			</div>
			<input type="hidden" name="textarea" id="textarea" value="">
			<br>
			<br>
			<div id="more">
		      <table id="morein" >
		        <c:forEach var="emojiList" items="${applicationScope.emojiList }" varStatus="loop" step="10">
		        <tr>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+1].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+1].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+2].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+2].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+3].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+3].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+4].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+4].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+5].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+5].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+6].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+6].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+7].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+7].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+8].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+8].emojiUrl}" />
		        </td>
		        <td class="td" onclick='emojiFun("${applicationScope.emojiList[loop.index+9].emojiUrl}")'>
		          <img src = "${applicationScope.emojiList[loop.index+9].emojiUrl}" />
		        </td>
		        </tr>
		        </c:forEach>
		      </table>
			</div>
			<input type="button"  value="Emoji" onclick="addEmoji()"/>
			<input type="button"  value="Audio" onclick="insertAudio()"/>
			<input type="button"  value="Video" onclick="insertVideo()"/>
			<input type="button"  value="Image" onclick="insertImage()"/>
			<input type="reset"  value="Clear" onclick="clearDiv()"/>
			<input type="button"  value="SendPage" onclick="Submit()"/>
		</form>
	</div>
	<div id="foot">
		<span style="float:right;">Connections:${applicationScope.numConn}</span>
	</div>
</body>
</html>