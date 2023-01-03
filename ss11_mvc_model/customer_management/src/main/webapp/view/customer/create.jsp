<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/1/2023
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create New Customer</title>
</head>
<body>
<h1>Create New Customer</h1>
<p>
    <c:if test="${message} != null">
        <span>${"message"}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form action="" method="post">
    <table>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Address: </td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="Create customer"></td>
        </tr>
    </table>
</form>
</body>
</html>
