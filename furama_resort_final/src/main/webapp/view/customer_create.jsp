<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/1/2023
  Time: 8:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Customer Manager</title>
  <link rel="stylesheet" href="../view/home/bootstrap-5.1.3-dist/css/bootstrap.css">
  <link rel="stylesheet" href="../view/home/furama_style.css">
  <link rel="stylesheet" href="../view/home/media_style.css">
  <link rel="stylesheet" href="../view/facility_style.css">
  <%--    phân trang--%>
  <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css">
  <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<c:import url="home/header.jsp"></c:import>
<c:import url="home/navbar.jsp"></c:import>
<div style="margin: 20px 0 80px 0;">
  <div id="title">
    <h3>Create new customer</h3>
  </div>
  <div id="list">
    <form action="/customer?action=create" method="post">
      <table class="table table-striped" style="width: 60%; margin: 0 auto;">
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
  </div>
</div>
<c:import url="home/footer.jsp"></c:import>
</body>
<script src="home/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/b9122f2b4f.js" crossorigin="anonymous"></script>
</html>
