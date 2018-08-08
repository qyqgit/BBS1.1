<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
</style>
<script type="text/javascript">
	function replyFunction(floor,pageId,messageId) {
		var url = 'MyPageSvl?id=****&pageNumber=***&pageLength=**#*';
		var pageLength = 30;
		var pageNumber = floor % pageLength == 0 ? parseInt (floor / pageLength) : parseInt(floor / pageLength) + 1;
		url = url.replace("****", pageId);
		url = url.replace("***", pageNumber);
		url = url.replace("**", pageLength);
		url = url.replace("*", floor);
		window.location.href = url;
		return false;
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
		<a href="index">Index</a>
		<span style="float:right;">Sessions:${applicationScope.numMembers}</span>
	</div>
	<div id="main">
 		<table id="main_tb">
			<c:forEach var="replyList" items="${requestScope.replyList }" >
			<tr><td colspan="5"><h1>${replyList.myPage.title }</h1></td></tr>
			<tr><td colspan="5"><a name="${replyList.floorNumber }"></a></td></tr>
			<tr>
				<td colspan="5"><c:out value="${replyList.text }" escapeXml="false"/></td>
			</tr>
			<tr>
			    <td></td>
			    <td  style="vertical-align:bottom;">
				    <c:url value="Home?id=${replyList.user.id}" var="url"></c:url>
					<a href="${url }"><c:out value="${replyList.user.name}"></c:out></a>
				</td>
			    <td style="vertical-align:bottom;"><c:out value="${replyList.date }"/></td>
			    <td width="50px" style="vertical-align:bottom;">
			    	<c:out value="${replyList.floorNumber }"/>
			    </td>
			    <td width="50px" style="vertical-align:bottom;">
			    	<a href="${replyList.id}" onclick="return replyFunction(${replyList.floorNumber },${replyList.myPage.id},${replyList.id })"><c:out value="${replyList.id == null?'':'Search' }"></c:out></a>
			    </td>
		    </tr>
		    <tr><td colspan="5"><hr></td></tr>
			</c:forEach>
		</table>
	</div>
	<div id="foot">
		<span style="float:right;">Connections:${applicationScope.numConn}</span>
	</div>
</body>
</html>