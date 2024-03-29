<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Devcolibri.com</title>
</head>
<body>
    <h1>${date}</h1>
    <h2><a href="http://localhost:8080/files?path=${parent}"><image src ="../static/images/previous.png" width="50" height="50"></a></h2>
    <h3>${path}<h3>
    <table border="1" cellpadding="5">
        <tr>
            <th>Type</th>
            <th>FileName</th>
            <th>Size</th>
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
        <td><image src="${list.isDirectory() ? '../static/images/directory.png' : '../static/images/file.png'}" width="50" height="50"></td>
        <td>
            <c:choose>
                <c:when test="${list.isDirectory()}">
                    <a href="http://localhost:8080/files?path=${path}/${list.getName()}">${list.getName()}</a>
                </c:when>
                <c:otherwise>
                    <a href="http://localhost:8080/download?path=${path}/${list.getName()}" download="${list.getName()}">${list.getName()}</a>
                </c:otherwise>
            </c:choose>
        </td>
        <td><c:out value = "${list.length()} Bytes"/></td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
