<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/1/2023
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Manager</title>
    <link rel="stylesheet" href="home/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="home/media_style.css">
    <link rel="stylesheet" href="../view/home/home_style.css">
    <link rel="stylesheet" href="../view/style.css">
    <%--    phân trang--%>
    <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<c:import url="home/header.jsp"></c:import>
<c:import url="home/navbar.jsp"></c:import>
<div style="width: 96%; margin: 0 auto">
    <div id="title">
        <h3>Mượn sách</h3>
    </div>
    <div id="list">
        <form action="/sach?action=insert" method="post">
            <table class="table table-striped" style="width: 60%; margin: 0 auto;">
                <tbody>
                <tr>
                    <td>Mã mượn sách:</td>
                    <td><input class="form-control" name="maMuonSach" type="text" placeholder=""
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Tên sách:</td>
                    <td><input class="form-control" name="tenSach" type="text" placeholder=""
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Tên học sinh:</td>
                    <td>
                        <select class="form-select" aria-label="Default select example" name="customerType">
                            <option value="0">Choose customer type</option>
                            <c:forEach var="hocSinh" items="${hocSinhList}">
                                <option value="${hocSinh.maHocSinh}">${hocSinh.hoTen}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Ngày mượn:</td>
                    <td><input class="form-control" name="ngayMuon" type="date"
                               aria-label="default input example"></td>
                </tr>
                <tr>
                    <td>Ngày trả:</td>
                    <td><input class="form-control" name="ngayTra" type="date"
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
<c:import url="home/room_type.jsp"></c:import>
</body>
<script src="home/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/b9122f2b4f.js" crossorigin="anonymous"></script>
</html>
