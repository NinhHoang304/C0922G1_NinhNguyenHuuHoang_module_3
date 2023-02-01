<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<div style="text-align: center">
    <h1>CurrenCy Conversion</h1>
    <form action="/convert" method="post">
        <input type="number" name="number" placeholder="Nhập tiền muốn đổi (USD)">
        <p>Tỷ giá: 1 USD = 23 000 VND</p>
        <p>${result}</p>
        <button type="submit">Quy đổi</button>
    </form>
</div>
</body>
</html>