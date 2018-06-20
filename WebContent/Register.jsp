<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
  
  function inputCheck(){
	if(document.getElementById("name").value == null || document.getElementById("name").value == "" ||document.getElementById("password").value == null || document.getElementById("password").value == ""){
		alert("name or password can't be empty.");
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
				  document.getElementById("birthday").value = "";
				  return;
			}
		}
			
		var reg = /^[0-9]+.?[0-9]*$/;
		if (!(reg.test(document.getElementById("birthday").value))) {
		  alert("birthday need to be eight number(yyyymmdd or yyyy/mm/dd).");
		  //document.getElementById("birthday").focus();
		  document.getElementById("birthday").value = "";
		  return;
		}
		if(document.getElementById("birthday").value.length!=8){
		  alert("birthday need to be eight number(yyyymmdd or yyyy/mm/dd).");
		  //document.getElementById("birthday").focus();
		  document.getElementById("birthday").value = "";
		  return;
		}
		var year = document.getElementById("birthday").value.substring(0,4)
		var month = document.getElementById("birthday").value.substring(4,6)
		var day = document.getElementById("birthday").value.substring(6,8)
		if(!isDate(year,month,day)) {
	      alert("input date error.");
		  //document.getElementById("birthday").focus();
		  document.getElementById("birthday").value = "";
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
  function getQueryString(name) {  
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
	var r = window.location.search.substr(1).match(reg);  
	if (r != null) return unescape(r[2]);  
	return null;  
  }
</script>
<title>Insert title here</title>
</head>
<body>
	<form   name="register"   method="post"  action="register" onsubmit="return inputCheck()">    
        <table border="1">    
        <tr>    
           <td>name</td>    
           <td><input id="name" name="name" type="text" maxlength="8"/></td>           
        </tr>    
        <tr>    
           <td>password</td>    
           <td><input id="password" name="password" type="password" maxlength="12"/></td>    
        </tr>    
        <tr>    
           <td>birthday</td>    
           <td><input id="birthday" name="birthday" type="text" value="" onBlur="formatDate()" /></td>    
        </tr>    
        <tr>    
           <td>sex</td>    
           <td><input name="sex" type="radio" value="2" checked="checked"/>null<input name="sex" type="radio" value="1"/>boy<input name="sex" type="radio" value="0"/>girl</td>    
        </tr>    
        <tr>    
           <td></td>    
           <td><input type="submit"  value="Register"  /></td>    
        </tr>    
        </table>    
    </form>
</body>
</html>