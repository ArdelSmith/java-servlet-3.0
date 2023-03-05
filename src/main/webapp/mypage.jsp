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
    <h2><a href=$"{parent}">Previous</a></h2>
    <table border="1" cellpadding="5">
        <tr>
            <th>Type</th>
            <th>FileName</th>
            <th>Size</th>
        </tr>
        <c:forEach items="${list}" var="list">
            <tr>
                <td><image src="../static/images/directory.png" width="50" height="50"></td>
                <td><a href="${url}?path=${path}/${list.getName()}"</a>${list.getName()}</td>
                <td><c:out value = "${list.length()} Bytes"/></td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>