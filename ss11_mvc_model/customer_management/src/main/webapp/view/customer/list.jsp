<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/1/2023
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customers</h1>
<p>
  <a href="/customers?action=create">Create new customer</a>
</p>
<table style="border: 1px solid black">
  <tr>
    <td>Name</td>
    <td>Email</td>
    <td>Address</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach var="customer" items="${customers}">
    <tr>
      <td><a href="/customers?action=view&id=${customer.getId()}">${customer.name}</a></td>
      <td>${customer.getEmail()}</td>
      <td>${customer.getAddress()}</td>
      <td><a href="/customers?action=edit&id=${customer.getId()}">edit</a></td>
      <td><a href="/customers?action=delete&id=${customer.getId()}">delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
