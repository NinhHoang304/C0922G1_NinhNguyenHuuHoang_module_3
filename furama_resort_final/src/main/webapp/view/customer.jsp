<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/1/2023
  Time: 3:05 AM
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
<c:import url="../view/home/header.jsp"></c:import>
<div class="row" id="header-link">
    <div id="content-body">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/furama">Giới Thiệu</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/employee">Nhân Viên</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/customer">Khách Hàng</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dịch Vụ
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="padding: 0;margin-top: 7px;">
                                <li><a class="dropdown-item" style="background-color: #046056" href="/facility">Danh sách khách hàng</a></li>
                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Thêm mới Villa</a></li>
                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Thêm mới Room</a></li>
                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Thêm mới House</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/contract">Hợp Đồng</a>
                        </li>
                    </ul>
                    <form class="d-flex" style="margin: 0" role="search" method="get">
                        <input class="form-control me-2" name="name" type="search" placeholder="Search" aria-label="Search">
                        <select class="form-select" aria-label="Default select example" name="customerType">
                            <option value="">Choose customer type</option>
                            <c:forEach var="customerType" items="${customerTypeList}">
                                <option value="${customerType.name}">${customerType.name}</option>
                            </c:forEach>
                        </select>
                        <button class="btn btn-outline-success" type="submit" name="action" value="search" style="color: white; margin-left: 5px">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</div>
<div style="width: 96%;height: 500px; margin: 0 auto">
    <div id="title">
        <h3>Customer Management</h3>
    </div>
    <div id="add">
        <div id="add-content">
            <button class="btn btn-success">
                <a href="/customer?action=create">Create new customer</a>
            </button>
            <span style="color: #146c43; float: right">${mess}</span>
        </div>
    </div>
    <div id="list">
        <table id="tablePaging" class="table table-striped table-hover table-bordered" style="width: 100%;">
            <thead class="border">
            <tr>
                <th>ID</th>
<%--                <th>Customer Type Id</th>--%>
                <th>Name</th>
                <th>Day Of Birth</th>
                <th>Gender</th>
                <th>Id Card</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody class="border">
            <c:forEach items='${customerList}' var="customerList">
                <tr>
                    <td>${customerList.id}</td>
<%--                    <td>${customerList.customerTypeId}</td>--%>
                    <td>${customerList.name}</td>
                    <td>${customerList.dayOfBirth}</td>
                    <c:if test="${customerList.gender}">
                        <td>Nam</td>
                    </c:if>
                    <c:if test="${!customerList.gender}">
                        <td>Nữ</td>
                    </c:if>
                    <td>${customerList.idCard}</td>
                    <td>${customerList.phoneNumber}</td>
                    <td>${customerList.email}</td>
                    <td>${customerList.address}</td>
                    <td>
                        <a href="/customer?action=edit&id=${customerList.id}">
                            <button class="btn btn-sm btn-primary">Edit</button>
                        </a>
                    </td>
                    <td>
                            <%--Modal Delete--%>
                        <button onclick="infoDelete('${customerList.id}','${customerList.name}')" class="btn btn-sm btn-danger" type="button" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:import url="../view/home/footer.jsp"></c:import>
<!-- Modal Delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Do you want to delete this customer </span>
                    <span style="color: red" id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
<script src="../view/home/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/b9122f2b4f.js" crossorigin="anonymous"></script>
<%--Phân trang--%>
<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function (){
        $('#tablePaging').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    });
</script>
</html>
