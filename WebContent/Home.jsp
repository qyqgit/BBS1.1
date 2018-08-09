<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="sys/css/global.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	.box{
		width: 100%;
		height: 100%;
		background: rgba(37,37,37,0.5);
		position: fixed;
		top: 0;
		left: 0;
		display: none;
	}
	.cont{
		background: #fff;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
</style>
<script src="sys/js/clipboard.js"></script>
<script type="text/javascript">
	window.onload = function() {
		
    var edit = getQueryString("edit");
    if(edit == "1"){
    	document.getElementById("viewTable").style.display ="none";
    	document.getElementById("editLink").style.display ="none";
    	document.getElementById("clearLink").style.display ="block";
    	document.getElementById("submitLink").style.display ="block";
    	document.getElementById("editTable").style.display ="table";
    }
	  if (document.getElementById("sex").value == "1")
		  document.getElementById("boy").checked = true;
	  else if(document.getElementById("sex").value =="0")
		  document.getElementById("girl").checked = true;
	  else
		  document.getElementById("null").checked = true;
	  
	  var clipboard = new Clipboard('.btn');

	  clipboard.on('success', function(e) {
		  
	  });

	  clipboard.on('error', function(e) {
	      alert("copy url fail.");
	  });
		  
	}
		  
	 function encodeUrl(id,url) {
		 var str = url;
		 url = str.split("_",1) + "_";
		 str = str.replace(url,"");
		 url = url + encodeURIComponent(str);
		 document.getElementById(id).value = url;
	 }
	 function getQueryString(name) {  
	     var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
	     var r = window.location.search.substr(1).match(reg);  
	     if (r != null) return unescape(r[2]);  
	     return null;  
	 }
	 function uploadCheck() {
		 if(document.getElementById("file").value.length == 0)
			 return false;
		 return true;
	 }
	  
	  function inputCheck() {
		if(document.getElementById("name").value == null || document.getElementById("name").value == "") {
			alert("name can't be empty.");
			document.getElementById("name").focus();
			return false;
		}
		if(document.getElementById("password").value == null || document.getElementById("password").value == "") {
			alert("password can't be empty.");
			document.getElementById("password").focus();
			return false;
		}
		if(document.getElementById("oldPassword").value == null || document.getElementById("oldPassword").value == "") {
			alert("Old Password can't be empty.");
			return false;
		}
		return true;
	  }
	  function preSubmit() {
		  document.getElementById('box').style.display='block';
	  }
	  function formSubmit() {
		  if(inputCheck())
		      	document.getElementById("editForm").submit();
	  }
	  function clearSubmit() {
		  document.getElementById('box').style.display='none';
	  }
	  function formatDate() {
		if(!(document.getElementById("birthday").value == null || document.getElementById("birthday").value == "")) {
			var regExp = /^\d{4}\/\d{2}\/\d{2}$/;
			var regExp2 = /^\d{4}\-\d{2}\-\d{2}$/;
			if(regExp.test(document.getElementById("birthday").value)||regExp2.test(document.getElementById("birthday").value)) {
				var intYear = document.getElementById("birthday").value.substring(0,4)
				var intMonth = document.getElementById("birthday").value.substring(5,7)
				var intDay = document.getElementById("birthday").value.substring(8,10)
				if(isDate(intYear,intMonth,intDay))
					return;
				else {
				      alert("input date error.");
					  //document.getElementById("birthday").focus();
					  document.getElementById("birthday").value = null;
					  return;
				}
			}
				
			var reg = /^[0-9]+.?[0-9]*$/;
			if (!(reg.test(document.getElementById("birthday").value))) {
			  alert("birthday need to be eight number(yyyymmdd or yyyy/mm/dd).");
			  //document.getElementById("birthday").focus();
			  document.getElementById("birthday").value = null;
			  return;
			}
			if(document.getElementById("birthday").value.length!=8) {
			  alert("birthday need to be eight number(yyyymmdd or yyyy/mm/dd).");
			  //document.getElementById("birthday").focus();
			  document.getElementById("birthday").value = null;
			  return;
			}
			var year = document.getElementById("birthday").value.substring(0,4)
			var month = document.getElementById("birthday").value.substring(4,6)
			var day = document.getElementById("birthday").value.substring(6,8)
			if(!isDate(year,month,day)) {
		      alert("input date error.");
		      //document.getElementById("birthday").focus();
			  document.getElementById("birthday").value = null;
			  return;
				
			}
			document.getElementById("birthday").value = year + "/" + month + "/" + day;
		}

	  }
	  function isDate(intYear,intMonth,intDay) { 
		if(isNaN(intYear)||isNaN(intMonth)||isNaN(intDay)) return false;   
		if(intMonth>12||intMonth<1) return false; 
		if ( intDay<1||intDay>31)return false; 
		if((intMonth==4||intMonth==6||intMonth==9||intMonth==11)&&(intDay>30)) return false; 
		if(intMonth==2){ 
		  if(intDay>29) return false;  
		  if((((intYear%100==0)&&(intYear%400!=0))||(intYear%4!=0))&&(intDay>28))return false; 
		}
		return true; 
	 }
	 function editLinkFun() {
		 window.location.href="Home?id=" +${user.id}+ '&edit=1';
	 }
	 function clearLinkFun() {
		 window.location.href="Home?id=" +${user.id}+ '&edit=0';
	 }
</script>
<link href="sys/pic/fish58.png" rel="icon"/>
<title>fishcc.org</title>
</head>
<body>
	<div id="head">
		ID:
		<c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
		<a href="${url }"><c:out value="${sessionScope.user.id}"></c:out></a>
		Name:
		<c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
		<a href="${url }"><c:out value="${sessionScope.user.name}"></c:out></a>
		
		${sessionScope.user.id == null?'<a href="Login.jsp">Login</a>':''}
		${sessionScope.user.id == null?'<a href="Register.jsp">Register</a>':''}
		${sessionScope.user.id == null?'':'<a href="Logout">Logout</a>'}
		${sessionScope.user.id == null?'':'<a href="MyReply'.concat('">Reply('.concat(sessionScope.count[0]).concat(')</a>'))}
		<a href="index">Index</a>
		<span style="float:right;">Sessions:${applicationScope.numMembers}</span>
	</div>
	<br>
	<div id="main">
		<table id="viewTable">
			<tr bgcolor="#EEEEEE">
				<td>ID</td>
				<td>Name</td>
				<td>Password</td>
				<td>Age</td>
				<td>Sex</td>
				<td>Date</td>
			</tr>
			<tr>
				<td>${user.id }</td>
				<td>${user.name }</td>
				<td>**</td>
				<td>${user.age==null ?'unknow':user.age }</td>
				<td>${user.sex==2 ?'unknow':''}${user.sex==1 ?'boy':''}${user.sex==0 ?'girl':''}</td>
				<td>${user.date }</td>
			</tr>
		</table>
		<form id="editForm" name="editForm"   method="post"  action="Home?id=${user.id}&submit=1">
			<table id="editTable" style="display:none">
				<tr bgcolor="#EEEEEE">
					<td>ID</td>
					<td>Name</td>
					<td>Password</td>
					<td>Age</td>
					<td>Sex</td>
					<td>Date</td>
				</tr>
				<tr>
					<td>${user.id }</td>
					<td><input id="name" name="name" type="text" value="${user.name }"></td>
					<td><input id="password" name="password" type="password" value="5f4dcc3b5aa765d61d8327deb882cf99"></td>
					<td><input id="birthday" name="birthday" type="text" value="${user.age }" onBlur="formatDate()"></td>
					<td><input id="sex" type="hidden" value="${user.sex }" />
						<input id="null" name="sex" type="radio" value="2"/>null
						<input id="boy" name="sex" type="radio" value="1"/>boy
						<input id="girl" name="sex" type="radio" value="0"/>girl
					</td>
					<td>${user.date }</td>
				</tr>
			</table>
			<div class="box" id="box">
				<div class="cont">
		          <table>
		          <tr><td>Old Password:</td><td><input type="password" name="oldPassword" id="oldPassword" value="" /></td></tr>
		          <tr>
		          <td align="center"><button onclick='formSubmit()'>Commit</button></td>
		          <td align="center"><button onclick='clearSubmit()'>Clear</button></td>
		          </tr>
		          </table>
				</div>
			</div>
			
			<table>
			<c:set value="<input id='editLink'  type='button' value='Edit' onclick='editLinkFun()'/>" var="editUrl"></c:set>
			<c:set value="<input id='clearLink' type='button' style='display:none;' value='Clear' onclick='clearLinkFun()'/>" var="clearUrl"></c:set>
			<c:set value="<input id='submitLink' type='button' style='display:none;' value='Submit' onclick='preSubmit()'/>" var="submitUrl"></c:set>
				<tr>
				<td>${sessionScope.user.id == user.id ? editUrl:''}</td>
				<td>${sessionScope.user.id == user.id ? clearUrl:''}</td>
				<td>${sessionScope.user.id == user.id ? submitUrl:''}</td>
				</tr>
			</table>
		</form>
		<br>
		<table id="main_tb">
				<tr bgcolor="#EEEEEE">
					<td>ID</td>
					<td>Name</td>
					<td>Download</td>
					<td>Date</td>
					<td>URL</td>
					<td>${sessionScope.user.id == user.id ? 'Delete':''}</td>
				</tr>
				<c:forEach var="mediaList" items="${requestScope.mediaList }" >
				<tr>
				    <td><c:out value="${mediaList.id }"/></td>
				    <td style="max-width:550px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><c:out value="${mediaList.name }"/></td>
				    <td>
					    <c:url value="${mediaList.url}" var="url"></c:url>
						<a href="${url }"><c:out value="Download"></c:out></a>
					</td>
				    <td style="white-space:nowrap;"><c:out value="${mediaList.date }"/></td>
				    <td>
				    	<input style="width:1px;position:absolute;z-index:-1;opacity:0.0;" id="_${mediaList.id }" type="text" value="${mediaList.url}">
				    	<button class="btn" data-clipboard-action="copy" data-clipboard-target="#_${mediaList.id }" onclick="encodeUrl('_${mediaList.id }','${mediaList.url}')">URL</button>
				    </td>
				    <td>
				    <c:set value = '<a href="deleteFile?id=${mediaList.id}" >Delete</a>' var = "delete"></c:set>
				    <c:out value="${sessionScope.user.id == user.id ? delete:''}" escapeXml="false"/>
				    </td>
			    </tr>
				<tr><td colspan="6"><hr></td></tr>
				</c:forEach>
		</table>
		<c:set value ='<form action="FileUploadServlet" method="post" enctype="multipart/form-data" onsubmit="return uploadCheck()"><input id="file" type="file" name="file" accept="/*"><input type="submit" value="submit"></form>' var = "upload"></c:set>
		${sessionScope.user.id == user.id ? upload:''}
	</div>
	<div id="foot">
		<span style="float:right;">Connections:${applicationScope.numConn}</span>
	</div>
</body>
</html>