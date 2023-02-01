<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/2/2023
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Simple Dictionary</h1>
<form action="/translate" method="post">
    <input type="text" placeholder="Nhập từ cần dịch" name="character">
    <button type="submit">Translate</button>
    <p>Result: ${rs}</p>
</form>
</body>
</html>
