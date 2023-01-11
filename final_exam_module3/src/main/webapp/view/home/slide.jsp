<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/1/2023
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row" id="slide">
    <div id="content-slide">
        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="../view/home/img/Vietnam_Danang_Furama_Resort_Exterior-Furama-girl-with-pink-hat.jpg"
                         class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Furama Resort</h5>
                        <p>Khu nghỉ dưỡng toạ lạc tại bãi biển Đà Nẵng. Top 6 bãi biển đẹp nhất Thế Giới</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="../view/home/img/Vietnam_Danang_Furama_Resort_Exterior_Courtyard.jpg" class="d-block w-100"
                         alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Furama Resort</h5>
                        <p>Khu nghỉ dưỡng toạ lạc tại bãi biển Đà Nẵng. Top 6 bãi biển đẹp nhất Thế Giới</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../view/home/img/Vietnam_Danang_Furama_Resort_Exterior_Ocean-Pool-6.jpg" class="d-block w-100"
                         alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Furama Resort</h5>
                        <p>Khu nghỉ dưỡng toạ lạc tại bãi biển Đà Nẵng. Top 6 bãi biển đẹp nhất Thế Giới</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>
</body>
</html>
