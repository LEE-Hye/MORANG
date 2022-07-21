<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/Main/style.css">
    <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
    <title>일기장</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="resources/css/calendar.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- 차트 js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->
    <script src="calendar.js"></script>
    <link href="resources/css/Main/main.css" rel="stylesheet" id="main-css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="bootstrap.js" type="text/javascript"></script>
    <script src="bootstrap.min.js" type="text/javascript"></script>
    <script src="main.js" type="text/javascript"></script>
</head>
<body>
	<nav class="navbar">
        <div class="navbar_logo">
            <i class="fa-thin fa-hands-holding-child"></i>
            <a href="메인 페이지.html">MoRang.</a>
        </div>

        <ul class="navbar_menu">
            <li><a href="">개인정보수정</a></li>
            <li><a href="">로그아웃</a></li>
        </ul>
    </nav>
    <div class="app">
        <div class="menu-toggle">
            <div class="hamburger">
                <span></span>
            </div>
        </div>
        <nav class="sidebar">
            <div class="toggle-btn">
                <span></span>
                <span></span>
                <span></span>
            </div>

            <h1>Menu</h1>
            <nav class="menu">
                <a href="메인 페이지.html" class="menu-item">HOME</a>
                <a href="산전 우울증.html" class="menu-item">우울증 자가진단</a>
                <a href="감정일기장.html" class="menu-item">감정 일기장</a>
                <a href="공유수첩.html" class="menu-item">공유수첩</a>
                <a href="게시판.html" class="menu-item">게시판</a>
            </nav>
        </nav>
    
    </div>    
</body>
</html>