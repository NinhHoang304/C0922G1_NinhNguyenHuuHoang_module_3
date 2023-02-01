<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/2/2023
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Calculator</h1>
<form action="/result" method="post">
    <input type="number" name="number1">
    <input type="number" name="number2">
    <p>
        <button type="submit" value="+" name="operation">Addition</button>
        <button type="submit" value="-" name="operation">Subtraction</button>
        <button type="submit" value="*" name="operation">Multi</button>
        <button type="submit" value="/" name="operation">Division</button>
    </p>
</form>
<p>${mess} ${result}</p>
</body>
</html>
