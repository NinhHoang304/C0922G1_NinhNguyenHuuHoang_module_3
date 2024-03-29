<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/1/2023
  Time: 11:02 PM
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
    <link rel="stylesheet" href="../view/home/home_style.css">
    <link rel="stylesheet" href="../view/style.css">
    <%--    phân trang--%>
    <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>

<div style="width: 96%; margin: 0 auto">
    <div id="title">
        <h3>Edit new customer</h3>
    </div>
    <div id="list">
        <form action="/customer?action=update" method="post">
            <table class="table table-striped" style="width: 60%; margin: 0 auto;">
                <tbody>
                <tr>
                    <td>Id:</td>
                    <td><input class="form-control" value="" name="id" type="text"
                               aria-label="default input example" readonly></td>
                </tr>
                <tr>
                    <td>Customer Type:</td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="customerTypeId">
                            <option value=""></option>
<%--                            foreach--%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input class="form-control" value="" name="name" type="text" placeholder="Name input"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Day of birth:</td>
                    <td><input class="form-control" value="" name="dayOfBirth" type="date"
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
                    <td><input class="form-control" value="" name="idCard" type="text" placeholder="Id card input"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Phone number:</td>
                    <td><input class="form-control" value="" name="phoneNumber" type="text" placeholder="Phone number input"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="form-control" value="" name="email" type="text" placeholder="Email input"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input class="form-control" value="" name="address" type="text" placeholder="Address input"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" class="btn btn-outline-success" style="margin-left: 40%">Submit</button>
                    </td>
                    <td>
                        <p style="color: red">mess</p>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

</body>
<script src="home/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/b9122f2b4f.js" crossorigin="anonymous"></script>
</html>
