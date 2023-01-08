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
    <title>Facility Manager</title>
    <link rel="stylesheet" href="../view/home/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../view/home/furama_style.css">
    <link rel="stylesheet" href="../view/home/media_style.css">
    <link rel="stylesheet" href="../view/facility_style.css">
</head>
<body>
<c:import url="../view/home/header.jsp"></c:import>
<c:import url="../view/home/navbar.jsp"></c:import>
<div style="margin-top: 5px">
    <div id="title">
        <h3>Customer Management</h3>
    </div>
    <div id="add">
        <div id="add-content">
            <button class="btn btn-success">
                <a href="/facility?action=create">Create new customer</a>
            </button>
            <span style="color: #146c43; float: right">${mess}</span>
        </div>
    </div>
    <div id="list">
        <table class="table table-hover border" style="margin: 0; padding: 0">
            <thead class="border">
            <tr>
                <th>ID</th>
                <th>Customer Type Id</th>
                <th>Name</th>
                <th>Day Of Birth</th>
                <th>Gender</th>
                <th>Id Card</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <tbody class="border">
            <c:forEach items='${customerList}' var="employee">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.customerTypeId}</td>
                    <td>${employee.name}</td>
                    <td>${employee.dayOfBirth}</td>
                    <c:if test="${employee.gender}">
                        <td>Nam</td>
                    </c:if>
                    <c:if test="${!employee.gender}">
                        <td>Nữ</td>
                    </c:if>
                    <td>${employee.idCard}</td>
                    <td>${employee.phoneNumber}</td>
                    <td>${employee.email}</td>
                    <td>${employee.address}</td>
                    <td>
                        <a href="/customer?action=edit&id=${employee.id}">
                            <button class="btn btn-sm btn-primary">Edit</button>
                        </a>
                    </td>
                    <td>
                            <%--Modal Delete--%>
                        <button onclick="infoDelete('${employee.id}','${employee.name}')" class="btn btn-sm btn-danger" type="button" data-bs-toggle="modal"
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
</html>
