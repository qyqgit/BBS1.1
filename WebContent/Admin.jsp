<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
    #nav {
        line-height:70px;
        width:100px;
        float:left;
        padding:0px;          
    }
    #section {
        width:1000px;
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
    <div  style="width:1100px;margin:0 auto;">
        <div id="nav">
          <a href="adminPage" target="iframe_a">Pages<br></a>
          <a href="adminMessage" target="iframe_a">Messages<br></a>
          <a href="adminMedia" target="iframe_a">Media<br></a>
          <a href="adminUser" target="iframe_a">User<br></a>
          <a href="adminAdmin" target="iframe_a">Admin<br></a>
          <a href="adminLog" target="iframe_a">Log<br></a>
        </div>
        <div id="section">
          <iframe id="iframepage" src="adminPage" name="iframe_a" width="1000px" frameborder="0px" scrolling="auto" onload="changeFrameHeight()"></iframe>
        </div>
    </div>
</body>
</html>