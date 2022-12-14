<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/1/2023
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Contract Manager</title>
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
<c:import url="../view/home/navbar.jsp"></c:import>
<div style="width: 96%;height: 500px; margin: 0 auto">
    <div id="title">
        <h3>Contract Management</h3>
    </div>
    <div id="add">
        <div id="add-content">
            <button class="btn btn-success">
                <a href="/contract?action=create">Create new contract</a>
            </button>
            <span style="color: #146c43; float: right">${mess}</span>
        </div>
    </div>
    <div id="list">
        <table id="tablePaging" class="table table-striped table-hover table-bordered" style="width: 100%;">
            <thead>
            <tr>
                <th>ID</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Deposit</th>
                <th>Employee Id</th>
                <th>Customer Id</th>
                <th>Facility Id</th>
                <th>Add New Attach</th>
                <th>Attach Facility List</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items='${contractList}' var="facilityList">
                <tr>
                    <td>${facilityList.id}</td>
                    <td>${facilityList.startDate}</td>
                    <td>${facilityList.endDate}</td>
                    <td>${facilityList.deposit}</td>
                    <td>${facilityList.employeeId}</td>
                    <td>${facilityList.customerId}</td>
                    <td>${facilityList.facilityId}</td>
                    <td>
                        <a href="/contract?action=edit&id=${facilityList.id}">
                            <button class="btn btn-sm btn-primary">+</button>
                        </a>
                    </td>
                    <td>
                        <a href="/contract?action=edit&id=${facilityList.id}">
                            <button class="btn btn-sm btn-primary">Attach Facility List</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:import url="../view/home/footer.jsp"></c:import>
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
