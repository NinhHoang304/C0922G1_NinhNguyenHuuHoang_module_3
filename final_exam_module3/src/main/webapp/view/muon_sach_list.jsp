<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/1/2023
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Manager</title>
    <link rel="stylesheet" href="home/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="home/home_style.css">
    <link rel="stylesheet" href="../view/home/home_style.css">
    <link rel="stylesheet" href="../view/style.css">
    <%--    phân trang--%>
    <link rel="stylesheet" href="../bootstrap520/css/bootstrap.min.css">
    <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap5.min.css">
</head>
<body>
<c:import url="home/header.jsp"></c:import>
<c:import url="home/navbar.jsp"></c:import>
<div style="width: 96%;height: 500px; margin: 0 auto">
    <div id="title" style="margin-top: 10px">
        <h3 style="text-align: center">Danh sách Sách</h3>
    </div>
    <div id="list">
        <table id="tablePaging" class="table table-striped table-hover table-bordered" style="width: 100%;">
            <thead class="border">
            <tr>
                <th>Mã Mượn Sách</th>
                <th>Tên Sách</th>
                <th>Tác Giả</th>
                <th>Tên Học Sinh</th>
                <th>Lớp</th>
                <th>Ngày Mượn</th>
                <th>Ngày Trả</th>
            </tr>
            </thead>
            <tbody class="border">
            <c:forEach var="muonSach" items="${theMuonSachList}">
                <tr>
                    <td>${muonSach.maMuonSach}</td>
                    <td>
                        <c:forEach var="sach" items="${sachList}">
<%--                            <c:if test="${sach.maSach}"--%>
                        </c:forEach>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>${muonSach.ngayMuon}</td>
                    <td>${muonSach.ngayTra}</td>
                    <td>
                        <button class="btn btn-primary">
                            <a href="/sach?action=create" style="color:white; text-decoration: none;">Trả sách</a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:import url="home/footer.jsp"></c:import>
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
<script src="home/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
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
