<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 1/3/2023
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới sinh viên</h1>
<a href="/student">Quay lại danh sách</a>
<p style="color: red">${mess}</p>
<form action="/student" method="post">
    <input name="action" value="create" hidden>

    <input oninput="checkName(this.value)" name="name" placeholder="nhập tên">
    <span id="errorName"></span>
    <br>

    <input type="radio" name="gender" value="true"> Nam
    <input type="radio" name="gender" value="false"> Nữ<br>
    <input type="number" name="point" placeholder="nhập điểm" required><br>
    <select name="classId">
        <option value="0">Chon lớp</option>
        <c:forEach var="clazz" items="${clazzList}">
            <option value="${clazz.id}">${clazz.name}</option>
        </c:forEach>
    </select>><br>
    <button disabled id="btnSave" type="submit">Save</button>
</form>
<script>
    function checkName(name) {
        let regName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
        let checkedName = regName.exec(name);
        if (!checkedName) {
            document.getElementById("errorName").innerText = "Tên chưa đúng định dạng"
            document.getElementById("btnSave").disabled = true;
        } else {
            document.getElementById("btnSave").disabled = false;
            document.getElementById("errorName").innerText = ""
        }
    }
</script>
</body>
</html>
