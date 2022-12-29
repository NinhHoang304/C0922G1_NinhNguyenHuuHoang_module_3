<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Discount Calculator</h1>
<br/>
<form action="/calculator" method="post">
    <table>
        <tr>
            <th>Product Description</th>
            <th>List Price</th>
            <th>Discount Percent</th>
            <th>Calculator</th>
        </tr>
        <tr>
            <td><input type="text" name="txtDes"></td>
            <td><input type="number" name="price"></td>
            <td><input type="number" name="discount"></td>
            <td><button type="submit">Submit</button></td>
        </tr>
    </table>
</form>
</body>
</html>