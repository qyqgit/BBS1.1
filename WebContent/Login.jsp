<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
  
  function getUserId(){
    var userId = getQueryString("userId");
    document.getElementById("userId").value = userId;

  }
  function showPassCode(){
    var passCodeNeed = document.getElementById("passCodeNeed").value;
    if(passCodeNeed == 1){
    	document.getElementById("passcode").style.display ="table-row";
    } else {
    	document.getElementById("passcode").style.display ="none";
    }

  }
  
  function getQueryString(name) {  
      var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
      var r = window.location.search.substr(1).match(reg);  
      if (r != null) return unescape(r[2]);  
      return null;  
  }
  function refresh() {

	  var url = "GetPassCode.jpg?number="+Math.random();
	  document.getElementById("img").src = url;
  }  
  window.onload = function(){
	  getUserId();
	  showPassCode();
  }
</script>
<title>Insert title here</title>
</head>
<body>
	<form   name="login"   method="post"  action="login">    
        <table border="1">    
        <tr>    
           <td>Id</td>    
           <td><input id="userId" name="id" type="text" value="" maxlength="8"/></td>           
        </tr>    
        <tr>    
           <td>Password</td>    
           <td><input name="password" type="password" maxlength="12"/></td>    
        </tr>    
        <tr id="passcode" style="display:none;">    
           <td><img id="img" src="GetPassCode.jpg" onclick="refresh()"> </td>    
           <td><input name="passcode" type="text" /></td>    
        </tr>
        <tr>    
           <td></td>    
           <td><input type="submit"  value="Login"/></td>    
        </tr>    
        </table>    
    </form>
	<input id="passCodeNeed" type="hidden" value="${sessionScope.passCodeNeed }" />
</body>
</html>