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
<div style="width: 96%; margin: 0 auto">
    <div id="title">
        <h3>Create new customer</h3>
    </div>
    <div id="list">
        <form action="/customer?action=insert" method="post">
            <table class="table table-striped" style="width: 60%; margin: 0 auto;">
                <tbody>
                <tr>
                    <td>Customer Type:</td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="customerType">
                            <option value="0">Choose customer type</option>
                            <c:forEach var="customerType" items="${customerTypeList}">
                                <option value="${customerType.id}">${customerType.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input required pattern="^[A-Z][a-z]*(\s[A-Z][a-z]*)+$" title="Tên chưa đúng định dạng" class="form-control" name="name" type="text" placeholder="Name input"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Day of birth:</td>
                    <td><input class="form-control" name="dayOfBirth" type="date"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                      <div class="form-check">
                        <input value="true" name="gender" class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                          Male
                        </label>
                      </div>
                      <div class="form-check">
                        <input value="false" name="gender" class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                          Female
                        </label>
                      </div>
                    </td>
                </tr>
                <tr>
                  <td>Id Card:</td>
                  <td><input class="form-control" name="idCard" type="text" placeholder="Id card input"
                             aria-label="default input example"></td>
                </tr>
                <tr>
                  <td>Phone number:</td>
                  <td><input class="form-control" name="phoneNumber" type="text" placeholder="Phone number input"
                             aria-label="default input example"></td>
                </tr>
                <tr>
                  <td>Email:</td>
                  <td><input class="form-control" name="email" type="text" placeholder="Email input"
                             aria-label="default input example"></td>
                </tr>
                <tr>
                  <td>Address:</td>
                  <td><input class="form-control" name="address" type="text" placeholder="Address input"
                             aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" class="btn btn-outline-success" style="margin-left: 40%">Submit</button>
                    </td>
                    <td>
                        <p style="color: red">${mess}</p>
                    </td>
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
