<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/1/2023
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h1>Create new product</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span>${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/product">Back to product list</a>
</p>
<form action="/product?action=create" method="post">
  <p>Product information</p>
  <table class="table table-striped">
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
        <td>Price: </td>
        <td><input class="form-control" name="price" type="text" placeholder="Price input" aria-label="default input example"></td>
      </tr>
      <tr>
        <td>Description: </td>
        <td><input class="form-control" name="description" type="text" placeholder="Description input" aria-label="default input example"></td>
      </tr>
      <tr>
        <td>Brand: </td>
        <td><input class="form-control" name="brand" type="text" placeholder="Brand input" aria-label="default input example"></td>
      </tr>
    <tr>
      <td></td>
      <td><button type="submit" class="btn btn-outline-success">Submit</button></td>
    </tr>
    </tbody>
  </table>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
