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
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-thin fa-hands-holding-child"></i> <a href="메인 페이지.html">MoRang.</a>
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
				<span></span> <span></span> <span></span>
			</div>

			<h1>Menu</h1>
			<nav class="menu">
				<a href="메인 페이지.html" class="menu-item">HOME</a> <a
					href="산전 우울증.html" class="menu-item">우울증 자가진단</a> <a
					href="감정일기장.html" class="menu-item">감정 일기장</a> <a href="공유수첩.html"
					class="menu-item">공유수첩</a> <a href="게시판.html" class="menu-item">게시판</a>
			</nav>
		</nav>

		<div class="share_note">

			<div class="share_note_detail">


				<form action="shareNoteUpdate.do" method="post">
				<input type = "hidden" name = "note_seq" value="${shareNote.note_seq}">
					<div class="share_title">
						<textarea name="note_title" rows="2" cols="40" class="note_title">${shareNote.note_title}</textarea>
					</div>
					<div class="share_content">
						<textarea name="note_content" rows="5" cols="43"
							class="note_content">${shareNote.note_content }</textarea>
					</div>

					<div class="share_btn">
						<button type="submit">글 수정</button>
					</div>
				</form>
			</div>

		</div>






	</div>
</body>
</html>