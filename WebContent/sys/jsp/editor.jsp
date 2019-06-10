<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
          <tr><td>${applicationScope.codePageMap['STR_NAME']}:</td><td><input type="text" name="linkName" id="linkName" value="" style="width:300px"/></td></tr>
          <tr><td>${applicationScope.codePageMap['STR_LINK']}:</td><td><input type="text" name="linkValue" id="linkValue" value="" style="width:300px"/></td></tr>
          <tr>
          <td align="center"><button type="button" onclick='insertLink()'>${applicationScope.codePageMap['STR_COMMIT']}</button></td>
          <td align="center"><button type="button" onclick='clearLink()'>${applicationScope.codePageMap['STR_CLEAR']}</button></td>
          </tr>
          </table>
        </div>
    </div>
    <input type="button"  value="${applicationScope.codePageMap['STR_EMOJI']}" onclick="addEmoji()"/>
    <input type="button"  value="${applicationScope.codePageMap['STR_LINK']}" onclick="preInsertLink()"/>
    <input type="button"  value="${applicationScope.codePageMap['STR_AUDIO']}" onclick="insertAudio()"/>
    <input type="button"  value="${applicationScope.codePageMap['STR_VIDEO']}" onclick="insertVideo()"/>
    <input type="button"  value="${applicationScope.codePageMap['STR_IMAGE']}" onclick="insertImage()"/>
    <input type="reset"  value="${applicationScope.codePageMap['STR_CLEAR']}" onclick="clearDiv()"/>