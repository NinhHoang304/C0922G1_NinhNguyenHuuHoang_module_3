<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/2/2023
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Spice Sandwich</h1>
<form action="/save" method="post">
    <input type="checkbox" name="condiment" value="lettuce"> Lettuce
    <input type="checkbox" name="condiment" value="tomato"> Tomato
    <input type="checkbox" name="condiment" value="mustard"> Mustard
    <input type="checkbox" name="condiment" value="sprouts"> Sprouts
    <p><button type="submit">Save</button></p>
</form>
</body>
</html>
