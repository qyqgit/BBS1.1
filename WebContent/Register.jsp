<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="sys/js/format_date.js"></script>
<script type="text/javascript">
  function inputCheck(){
    if(document.getElementById("name").value == null || document.getElementById("name").value == "" ||document.getElementById("password").value == null || document.getElementById("password").value == ""){
        alert("name or password can't be empty.");
        return false;
    }
    return true;
  }
</script>
<link href="sys/pic/fish58.png" rel="icon"/>
<title>fishcc.org</title>
</head>
<body>
    <form   name="register"   method="post"  action="register" onsubmit="return inputCheck()">    
        <table border="1">    
        <tr>    
           <td>${applicationScope.codePageMap['STR_NAME']}</td>    
           <td><input id="name" name="name" type="text" maxlength="8"/></td>           
        </tr>    
        <tr>    
           <td>${applicationScope.codePageMap['STR_PASSWORD']}</td>    
           <td><input id="password" name="password" type="password" maxlength="12"/></td>    
        </tr>    
        <tr>    
           <td>${applicationScope.codePageMap['STR_BIRTHDAY']}</td>    
           <td><input id="birthday" name="birthday" type="text" value="" onBlur="formatDate('birthday')" /></td>    
        </tr>    
        <tr>    
           <td>${applicationScope.codePageMap['STR_SEX']}</td>    
           <td>
	           <input name="sex" type="radio" value="2" checked="checked"/>${applicationScope.codePageMap['STR_NULL']}
	           <input name="sex" type="radio" value="1"/>${applicationScope.codePageMap['STR_BOY']}
	           <input name="sex" type="radio" value="0"/>${applicationScope.codePageMap['STR_GIRL']}
           </td>    
        </tr>    
        <tr>    
           <td></td>    
           <td><input type="submit"  value="Register"  /></td>    
        </tr>    
        </table>    
    </form>
</body>
</html>