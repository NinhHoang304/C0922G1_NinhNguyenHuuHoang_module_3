<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/1/2023
  Time: 6:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h1>Edit User</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<button type="button" class="btn btn-primary"><a href="/users">List user</a></button>
<form method="post">
    <p>User information</p>
    <table class="table table-striped" style="width: 80%">
        <tbody>
        <tr>
            <td>Id: </td>
            <td><input class="form-control" name="id" value="${user.id}" type="number" readonly placeholder="Name input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><input class="form-control" name="name" value="${user.name}" type="text" placeholder="Name input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input class="form-control" name="email" value="${user.email}" type="text" placeholder="Email input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td>Country: </td>
            <td><input class="form-control" name="country" value="${user.country}" type="text" placeholder="Country input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit" class="btn btn-outline-success">Submit</button></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
