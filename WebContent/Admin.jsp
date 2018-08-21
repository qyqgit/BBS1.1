<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
    #nav {
        line-height:30px;
        background-color:yellow;
        width:100px;
        float:left;
        padding:0px;	      
    }
    #section {
        width:900px;
        float:left;
        padding:0px;
       
    }
</style>
<script type="text/javascript">
	function changeFrameHeight(){
	    var ifm= document.getElementById("iframepage"); 
	    ifm.height=document.documentElement.clientHeight - 10;
	}
	window.onresize=function(){  
	     changeFrameHeight();  
	} 
</script>
<title>Insert title here</title>
</head>
<body>
	<div  style="width:1100px">
		<div id="nav">
	      <a href="adminPage" target="iframe_a">Pages<br></a>
	      <a href="demo_iframe2.htm" target="iframe_a">Paris<br></a>
	      <a href="demo_iframe3.htm" target="iframe_a">Tokyo<br></a>
	    </div>
		<div id="section">
	      <iframe id="iframepage" src="adminPage" name="iframe_a" width="1000px" frameborder="0px" scrolling="auto" onload="changeFrameHeight()"></iframe>
	    </div>
	</div>
</body>
</html>