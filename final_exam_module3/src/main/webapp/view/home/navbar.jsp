<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/1/2023
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row" id="header-link">
    <div id="content-body">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/home">Giới Thiệu</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/sach">Danh sách sách</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Danh sách học sinh</a>
                        </li>
<%--                        <li class="nav-item dropdown">--%>
<%--                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                                Dịch Vụ--%>
<%--                            </a>--%>
<%--                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="padding: 0;margin-top: 7px;">--%>
<%--                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Danh sách khách hàng</a></li>--%>
<%--                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Thêm mới Villa</a></li>--%>
<%--                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Thêm mới Room</a></li>--%>
<%--                                <li><a class="dropdown-item" style="background-color: #046056" href="#">Thêm mới House</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
                        <li class="nav-item">
                            <a class="nav-link" href="/muon_sach">Danh sách mượn sách</a>
                        </li>
                    </ul>
                    <form class="d-flex" style="margin: 0">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit" style="color: white">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</div>
</body>
</html>
