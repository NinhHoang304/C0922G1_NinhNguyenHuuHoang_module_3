<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/1/2023
  Time: 6:01 PM
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
        <h3>Facility Management</h3>
    </div>
    <div id="add">
        <div id="add-content">
            <button class="btn btn-success">
                <a href="">Create</a>
            </button>
        </div>
    </div>
    <div id="list">
        <table class="table table-hover border" style="margin: 0; padding: 0">
            <thead class="border">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Area</th>
                <th>Cost</th>
                <th>Max People</th>
                <th>Rent Type Id</th>
                <th>Facility Type Id</th>
                <th>Standard Room</th>
                <th>Description</th>
                <th>Pool Area</th>
                <th>Number Of Floors</th>
                <th>Facility Free</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <tbody class="border">
            <c:forEach items='${facilityList}' var="facility">
                <tr>
                    <td>${facility.id}</td>
                    <td>${facility.name}</td>
                    <td>${facility.area}</td>
                    <td>${facility.cost}</td>
                    <td>${facility.maxPeople}</td>
                    <td>${facility.rentTypeId}</td>
                    <td>${facility.facilityTypeId}</td>
                    <td>${facility.standardRoom}</td>
                    <td>${facility.descriptionOtherConvenience}</td>
                    <td>${facility.poolArea}</td>
                    <td>${facility.numberOfFloors}</td>
                    <td>${facility.facilityFree}</td>
                    <td><a href="/facility?action=edit&id=${facility.id}">
                        <button class="btn btn-sm btn-primary">Edit</button>
                    </a></td>
                    <td><a href="/facility?action=delete&id=${facility.id}">
                        <button class="btn btn-sm btn-danger">Delete</button>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script src="../view/home/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<script src="https://kit.fontawesome.com/b9122f2b4f.js" crossorigin="anonymous"></script>
</html>
