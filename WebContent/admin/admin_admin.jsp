<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
    #box{
        width: 100%;
        height: 100%;
        background: rgba(37,37,37,0.5);
        position: fixed;
        top: 0;
        left: 0;
        display: none;
    }
    #cont{
        background: #fff;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    #box2{
        width: 100%;
        height: 100%;
        background: rgba(37,37,37,0.5);
        position: fixed;
        top: 0;
        left: 0;
        display: none;
    }
    #cont2{
        background: #fff;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>
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
    }
          
     function getQueryString(name) {  
         var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
         var r = window.location.search.substr(1).match(reg);  
         if (r != null) return unescape(r[2]);  
         return null;  
     }
      
     function addCheck() {
        if(document.getElementById("addName").value == null || document.getElementById("addName").value == "") {
            alert("name can't be empty.");
            document.getElementById("addName").focus();
            return false;
        }
        if(document.getElementById("addPassword").value == null || document.getElementById("addPassword").value == "") {
            alert("password can't be empty.");
            document.getElementById("addPassword").focus();
            return false;
        }
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
      function add() {
          document.getElementById('box2').style.display='block';
          document.getElementById("addName").focus();
      }
      function preSubmit() {
          document.getElementById('box').style.display='block';
          document.getElementById("oldPassword").focus();
      }
      function addSubmit() {
          if(addCheck())
                  document.getElementById("addForm").submit();
      }
      function formSubmit() {
          if(inputCheck())
                  document.getElementById("editForm").submit();
      }
      function clearAddSubmit() {
          document.getElementById('box2').style.display='none';
      }
      function clearSubmit() {
          document.getElementById('box').style.display='none';
      }
     function editLinkFun() {
         window.location.href="adminAdmin?id=" +${sessionScope.admin.id}+ '&edit=1';
     }
     function clearLinkFun() {
         window.location.href="adminAdmin?id=" +${sessionScope.admin.id}+ '&edit=0';
     }
</script>
<title>Insert title here</title>
</head>
<body>
    <table id="viewTable" style="border-collapse:collapse;width:960px">
        <tr bgcolor="#EEEEEE">
            <td>ID</td>
            <td>Name</td>
            <td>Password</td>
            <td>Date</td>
        </tr>
        <tr>
            <td>${sessionScope.admin.id }</td>
            <td>${sessionScope.admin.name }</td>
            <td>**</td>
            <td>${fn:substring(sessionScope.admin.date, 0, 16)}</td>
        </tr>
    </table>
    <form id="editForm" name="editForm"   method="post"  action="adminAdmin?id=${sessionScope.admin.id}&submit=1">
        <table id="editTable" style="border-collapse:collapse;width:960px;display:none">
            <tr bgcolor="#EEEEEE">
                <td>ID</td>
                <td>Name</td>
                <td>Password</td>
                <td>Date</td>
            </tr>
            <tr>
                <td>${sessionScope.admin.id }</td>
                <td><input id="name" name="name" type="text" value="${sessionScope.admin.name }"></td>
                <td><input id="password" name="password" type="password" value="5f4dcc3b5aa765d61d8327deb882cf99"></td>
                <td>${sessionScope.admin.date }</td>
            </tr>
        </table>
        <div id="box">
            <div id="cont">
              <table>
              <tr><td>Old Password:</td><td><input type="password" name="oldPassword" id="oldPassword" value="" /></td></tr>
              <tr>
              <td align="center"><button type="button" onclick='formSubmit()'>Commit</button></td>
              <td align="center"><button type="button" onclick='clearSubmit()'>Clear</button></td>
              </tr>
              </table>
            </div>
        </div>
        
        <table>
        <c:set value="<input id='editLink'  type='button' value='Edit' onclick='editLinkFun()'/>" var="editUrl"></c:set>
        <c:set value="<input id='clearLink' type='button' style='display:none;' value='Clear' onclick='clearLinkFun()'/>" var="clearUrl"></c:set>
        <c:set value="<input id='submitLink' type='button' style='display:none;' value='Submit' onclick='preSubmit()'/>" var="submitUrl"></c:set>
            <tr>
            <td>${editUrl}</td>
            <td>${clearUrl}</td>
            <td>${submitUrl}</td>
            </tr>
        </table>
    </form>
    <table style="border-collapse:collapse;width:960px">
        <tr bgcolor="#EEEEEE">
            <td>ID&nbsp;</td>
            <td>Name&nbsp;</td>
            <td>Password&nbsp;</td>
            <td>Invalid&nbsp;</td>
            <td>Date&nbsp;</td>
            <td>Invalid&nbsp;</td>
            <td>Valid&nbsp;</td>
            <td>Delete&nbsp;</td>
        </tr>
        <c:forEach var="adminList" items="${requestScope.adminList }" varStatus="loop">
        <tr <c:if test="${loop.count%2==0}">bgcolor="#FFFFFF"</c:if>>
            <td><c:out value="${adminList.id}" /></td>
            <td>
                <c:url value="" var="url"></c:url>
                <a href="${url }"><c:out value="${adminList.name}"></c:out></a>
            </td>
            <td><c:out value="${adminList.password}" /></td>
            <td><c:out value="${adminList.invalid}"></c:out></td>
            <td>
                <c:out value="${fn:substring(adminList.date, 0, 16)}"></c:out>
            </td>
            <td>
                <c:url value="adminAdmin?id=${adminList.id}&method=invalid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }"><button type="button">Invalid</button></a>
            </td>
            <td>
                <c:url value="adminAdmin?id=${adminList.id}&method=valid&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }"><button type="button">Valid</button></a>
            </td>
            <td>
                <c:url value="adminAdmin?id=${adminList.id}&method=delete&pageNumber=${requestScope.pageNumber}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }">Delete</a>
            </td>
        </tr>
        <tr><td colspan="8"><hr></td></tr>
        </c:forEach>
    </table>
    <form id="addForm" name="addForm"   method="post"  action="adminAdmin?id=${sessionScope.admin.id}&add=1" style="width:960px">
        <button type="button" onclick="add()" style="float:right">Add</button>
        <div id="box2">
            <div id="cont2">
              <table>
              <tr><td>Name:</td><td><input type="text" name="addName" id="addName" value="" /></td></tr>
              <tr><td>Password:</td><td><input type="password" name="addPassword" id="addPassword" value="" /></td></tr>
              <tr>
              <td align="center"><button type="button" onclick='addSubmit()'>Commit</button></td>
              <td align="center"><button type="button" onclick='clearAddSubmit()'>Clear</button></td>
              </tr>
              </table>
            </div>
        </div>
    </form>
    <% pageContext.setAttribute("urlName", "adminAdmin"); %>
    <% pageContext.setAttribute("paraName", ""); %>
    <% pageContext.setAttribute("paraValue", ""); %>
    <%@include file="../sys/jsp/each_page.jsp" %>
</body>
</html>