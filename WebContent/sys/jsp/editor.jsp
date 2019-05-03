<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <link href="sys/css/editor.css" rel="stylesheet" type="text/css"/>
    <script src="sys/js/editor.js"></script>
    <div id="text" onkeyup="inputLength()"  contentEditable="true" style="width:580px;height:220px;border:1px solid black;overflow:auto; ">
    </div>
    <input type="hidden" name="textarea" id="textarea" value="">
    <span id="len">0</span>
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
    <div id="box">
        <div id="cont">
          <table>
          <tr><td>Name:</td><td><input type="text" name="linkName" id="linkName" value="" style="width:300px"/></td></tr>
          <tr><td>Value:</td><td><input type="text" name="linkValue" id="linkValue" value="" style="width:300px"/></td></tr>
          <tr>
          <td align="center"><button type="button" onclick='insertLink()'>Commit</button></td>
          <td align="center"><button type="button" onclick='clearLink()'>Clear</button></td>
          </tr>
          </table>
        </div>
    </div>
    <input type="button"  value="Emoji" onclick="addEmoji()"/>
    <input type="button"  value="Link" onclick="preInsertLink()"/>
    <input type="button"  value="Audio" onclick="insertAudio()"/>
    <input type="button"  value="Video" onclick="insertVideo()"/>
    <input type="button"  value="Image" onclick="insertImage()"/>
    <input type="reset"  value="Clear" onclick="clearDiv()"/>