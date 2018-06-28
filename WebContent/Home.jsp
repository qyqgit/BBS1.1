<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="sys/js/clipboard.js"></script>
<script type="text/javascript">
	window.onload = function(){
		
    var edit = getQueryString("edit");
    if(edit == "1"){
    	document.getElementById("viewTable").style.display ="none";
    	document.getElementById("editLink").style.display ="none";
    	document.getElementById("clearLink").style.display ="block";
    	document.getElementById("submitLink").style.display ="block";
    	
    } else {
    	document.getElementById("editTable").style.display ="none";
    		
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
	  
	  function inputCheck(){
		if(document.getElementById("name").value == null || document.getElementById("name").value == ""){
			alert("name can't be empty.");
			document.getElementById("name").focus();
			return false;
		}
		if(document.getElementById("password").value == null || document.getElementById("password").value == ""){
			alert("password can't be empty.");
			document.getElementById("password").focus();
			return false;
		}
		if(document.getElementById("oldPassword").value == null || document.getElementById("oldPassword").value == ""){
			alert("Old Password can't be empty.");
			document.getElementById("oldPassword").focus();
			return false;
		}

		return true;
	  }
	  function formatDate(){
		if(!(document.getElementById("birthday").value == null || document.getElementById("birthday").value == "")){
			var regExp = /^\d{4}\/\d{2}\/\d{2}$/;
			var regExp2 = /^\d{4}\-\d{2}\-\d{2}$/;
			if(regExp.test(document.getElementById("birthday").value)||regExp2.test(document.getElementById("birthday").value)){
				var intYear = document.getElementById("birthday").value.substring(0,4)
				var intMonth = document.getElementById("birthday").value.substring(5,7)
				var intDay = document.getElementById("birthday").value.substring(8,10)
				if(isDate(intYear,intMonth,intDay))
					return;
				else{
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
			if(document.getElementById("birthday").value.length!=8){
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
	  function isDate(intYear,intMonth,intDay){ 
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
	 function editLinkFun(){
		 window.location.href="Home?id=" +${user.id}+ '&edit=1';
	 }
	 function clearLinkFun(){
		 window.location.href="Home?id=" +${user.id}+ '&edit=0';
	 }
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="head">
		<a href="index">Index</a>
		Id:
		<c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
		<a href="${url }"><c:out value="${sessionScope.user.id}"></c:out></a>
		Name:
		<c:url value="Home?id=${sessionScope.user.id}" var="url"></c:url>
		<a href="${url }"><c:out value="${sessionScope.user.name}"></c:out></a>
		
		${sessionScope.user.id == null?'<a href="Login.jsp">Login</a>':''}
		${sessionScope.user.id == null?'<a href="Register.jsp">Register</a>':''}
		${sessionScope.user.id == null?'':'<a href="Logout">Logout</a>'}
	</div>
	<div id="main">
		<table id="viewTable" border="0">
			<tr>
			<td>Id:</td>
			<td>${user.id }</td>
			</tr>
			<tr>
			<td>Name:</td>
			<td>${user.name }</td>
			</tr>
			<tr>
			<td>Password:</td>
			<td>${user.password }</td>
			</tr>
			<tr>
			<td>Birthday:</td>
			<td>${user.age==null ?'unknow':user.age }</td>
			</tr>
			<tr>
			<td>Sex:</td>
			<td>${user.sex==2 ?'unknow':''}${user.sex==1 ?'boy':''}${user.sex==0 ?'girl':''}</td>
			</tr>
			<tr>
			<td>Date:</td>
			<td>${user.date }</td>
			</tr>
		</table>
		<form name="editForm"   method="post"  action="Home?id=${user.id}&submit=1" onsubmit="return inputCheck()">
			<table id="editTable" border="0">
				<tr>
				<td>Id:</td>
				<td>${user.id }</td>
				</tr>
				<tr>
				<td>Name:</td>
				<td><input id="name" name="name" type="text" value="${user.name }"></td>
				</tr>
				<tr>
				<td>New Password:</td>
				<td><input id="password" name="password" type="password" value="5f4dcc3b5aa765d61d8327deb882cf99"></td>
				</tr>
				<tr>
				<td>Birthday:</td>
				<td><input id="birthday" name="birthday" type="text" value="${user.age }" onBlur="formatDate()"></td>
				</tr>
				<tr>
				<td>Sex:</td>
				<td><input id="sex" type="hidden" value="${user.sex }" />
				<input id="null" name="sex" type="radio" value="2"/>null
				<input id="boy" name="sex" type="radio" value="1"/>boy
				<input id="girl" name="sex" type="radio" value="0"/>girl</td>
				</tr>
				<tr>
				<td>Date:</td>
				<td>${user.date }</td>
				</tr>
				<tr>
				<td>Old Password:</td>
				<td><input id="oldPassword" name="oldPassword" type="password" value="" /></td>
				</tr>
			</table>
			
			<table id="" border="0">
			<c:set value="<input id='editLink'  type='button' value='Edit' onclick='editLinkFun()'/>" var="editUrl"></c:set>
			<c:set value="<input id='clearLink' type='button' style='display:none;' value='Clear' onclick='clearLinkFun()'/>" var="clearUrl"></c:set>
			<c:set value="<input id='submitLink' type='submit' style='display:none;' value='Submit'/>" var="submitUrl"></c:set>
				<tr>
				<td>${sessionScope.user.id == user.id ? editUrl:''}</td>
				<td>${sessionScope.user.id == user.id ? clearUrl:''}</td>
				<td>${sessionScope.user.id == user.id ? submitUrl:''}</td>
				</tr>
			</table>
		</form>
		<table>
				<c:forEach var="mediaList" items="${requestScope.mediaList }" >
				<tr>
				    <td><c:out value="${mediaList.id }"/></td>
				    <td><c:out value="${mediaList.name }"/></td>
				    <td>
					    <c:url value="${mediaList.url}" var="url"></c:url>
						<a href="${url }"><c:out value="${mediaList.name}"></c:out></a>
					</td>
				    <td><c:out value="${mediaList.date }"/></td>
				    <td>
				    	<input style="width:1px;height:1px;opacity:0.0;" id="_${mediaList.id }" type="text" value="${mediaList.url}">
				    	<button class="btn" data-clipboard-action="copy" data-clipboard-target="#_${mediaList.id }" onclick="encodeUrl('_${mediaList.id }','${mediaList.url}')">URL</button>
				    </td>
				    <td>
				    <c:set value = '<a href="deleteFile?id=${mediaList.id}" >Delete</a>' var = "delete"></c:set>
				    <c:out value="${sessionScope.user.id == user.id ? delete:''}" escapeXml="false"/>
				    </td>
			    </tr>
				</c:forEach>
		</table>
		<c:set value ='<form action="FileUploadServlet" method="post" enctype="multipart/form-data" onsubmit="return uploadCheck()"><input id="file" type="file" name="file" accept="/*"><input type="submit" value="submit"></form>' var = "upload"></c:set>
		${sessionScope.user.id == user.id ? upload:''}
	</div>
	<div id="foot">
	</div>
</body>
</html>