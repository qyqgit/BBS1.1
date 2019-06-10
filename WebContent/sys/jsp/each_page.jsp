<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <table>
        <tr>
            <td>
                <c:url value="${pageScope.urlName}?${pageScope.paraName}=${pageScope.paraValue }&pageNumber=${requestScope.pageNumber - 1 < 1 ? 1:requestScope.pageNumber - 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }"><c:out value="${applicationScope.codePageMap['STR_PAGEUP']}"></c:out></a>
            </td>
            <c:forEach var="eachPageList" items="${requestScope.eachPageList }" varStatus="loop">
                    <td>
                        <c:url value="${pageScope.urlName}?${pageScope.paraName}=${pageScope.paraValue }&pageNumber=${eachPageList.pageNumber}&pageLength=${eachPageList.pageLength }" var="url"></c:url>
                        <a href="${url }" <c:if test="${eachPageList.pageNumber == requestScope.pageNumber}">style="color:red"</c:if>><c:out value="${eachPageList.pageNumber}"></c:out></a>
                    </td>
            </c:forEach>
            <td>
                <c:url value="${pageScope.urlName}?${pageScope.paraName}=${pageScope.paraValue }&pageNumber=${requestScope.pageNumber + 1 > requestScope.howManyPage ?requestScope.howManyPage:requestScope.pageNumber + 1}&pageLength=${requestScope.eachPageList[0].pageLength }" var="url"></c:url>
                <a href="${url }"><c:out value="${applicationScope.codePageMap['STR_NEXTPAGE']}"></c:out></a>
            </td>
        </tr>
    </table>