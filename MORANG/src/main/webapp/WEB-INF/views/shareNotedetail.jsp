<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.domain.shareNote"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/noteshare.css">
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&display=swap"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 차트 js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 자바 스크립트 -->
<style>
       button{
        border: 1px solid rgb(240, 129, 129);
        background-color: rgba(0, 0, 0, 0);
        color: rgb(240, 129, 129);;
        padding: 10px;
        border-radius: 10px;
       }
       .btn:hover{
        color: white;
        background-color: rgb(240, 129, 129);
       }
    </style>

<script type="text/javascript">
	function goList(){
		location.href = "/web/shareNote.do";
	}		
	
	function goDelete(note_seq){
		
		location.href = '/web/shareNoteDelete.do?note_seq=' + note_seq;
		
	}
	
	function goUpdate(note_seq){
		location.href = "/web/shareNoteGoUpdate.do?note_seq=" + note_seq;
	}

	
</script>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-thin fa-hands-holding-child"></i> <a href="Main.do">MoRang.</a>
		</div>

		<ul class="navbar_menu">
			<li><a href="">${loginMember.u_id}님 환영합니다!!</a></li>
			<li><a href="">개인정보수정</a></li>
			<li><a href="logout.do">로그아웃</a></li>
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
				<span></span> <span></span> <span></span>
			</div>

			<h1>Menu</h1>
			<nav class="menu">
				<a href="Main.do" class="menu-item">HOME</a> <a
					href="depressionTest.do" class="menu-item">우울증 자가진단</a> <a
					href="diary.do" class="menu-item">감정 일기장</a> <a href="shareNote.do"
					class="menu-item">공유수첩</a> <a href="boardList.do" class="menu-item">게시판</a>
			</nav>
		</nav>

		<div class="share_note">
			<i onclick="goDelete(${shareNote.note_seq})" class="fa-solid fa-x"></i>
			<div class="share_note_detail">
				<div class="share_title">${requestScope.shareNote.note_title}</div>
				<% pageContext.setAttribute("newLine", "\n"); %>
				<div class="share_content">
					${fn:replace(shareNote.note_content, newLine, "<br>") }</div>

				<div class="share_btn">
					<button class="w-btn w-btn-indigo" onclick="goUpdate(${shareNote.note_seq})">수정</button>
					<button class="w-btn w-btn-indigo" onclick="goList()">돌아가기</button>
				</div>
			</div>

		</div>

	</div>
</body>
</html>