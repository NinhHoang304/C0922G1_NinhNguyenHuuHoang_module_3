<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/1/2023
  Time: 6:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<button type="button" class="btn btn-primary"><a href="/users">List user</a></button>
<form action="/users?action=create" method="post">
    <p>User information</p>
    <table class="table table-striped" style="width: 80%">
        <tbody>
        <tr>
            <td>Id: </td>
            <td><input class="form-control" name="id" type="text" placeholder="Id input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><input class="form-control" name="name" type="text" placeholder="Name input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input class="form-control" name="email" type="text" placeholder="Email input" aria-label="default input example"></td>
        </tr>
        <tr>
            <td>Country: </td>
            <td><input class="form-control" name="country" type="text" placeholder="Country input" aria-label="default input example"></td>
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
