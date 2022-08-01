<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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


<script type="text/javascript">
	function goList(){
		location.href = "shareNote.do";
	}		
	
	function goDelete(note_seq){
		
		location.href = "/web/shareNoteDelete.do?note_seq=" + note_seq;
		
	}
	
	function goUpdate(note_seq){
		location.href = "/web/shareNoteGoUpdate.do?note_seq=" + note_seq;
	}
	function nouser(){
		alert('자신이 작성한 메모만 삭제 하실수 있습니다!')
	}
	
</script>
<style>
body {
	margin: 0;
	font-family: 'Dongle', sans-serif;
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<i class="fa-thin fa-hands-holding-child"></i> <a href="Main.do"><img class="pic_morang" src="./resources/img/morang2.png"></a>
		</div>

		<ul class="navbar_menu">
			<li>
			  <c:choose>
		      <c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
		      <a href="">${loginMember.u_id}님 환영합니다!!</a>
		      		
		      </c:when>
		      <c:otherwise>
		      	<a href="">${protectorMember.p_id}님 환영합니다!!</a>
		      </c:otherwise>
		      </c:choose>
			</li>
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
					href="diary.do" class="menu-item" >감정 일기장</a> <a href="shareNote.do"
					class="menu-item" id="nowpage">공유수첩</a> <a href="boardList.do" class="menu-item">게시판</a>
			</nav>
		</nav>

		<div class="share_note">
		<c:choose>
			<c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
				<c:choose>
				<c:when test='${loginMember.u_id eq shareNote.u_id}'>
					<i onclick="goDelete(${shareNote.note_seq})" class="fa-solid fa-thumbtack fa-2x" id="thumbtack"></i>
				</c:when>
				<c:otherwise>
					<i onclick="nouser()" class="fa-solid fa-thumbtack fa-2x" id="thumbtack"></i>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test='${protectorMember.p_id eq shareNote.u_id}'>
					<i onclick="goDelete(${shareNote.note_seq})" class="fa-solid fa-thumbtack fa-2x" id="thumbtack"></i>
				</c:when>
				<c:otherwise>
					<i onclick="nouser()" class="fa-solid fa-thumbtack fa-2x" id="thumbtack"></i>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>

			<div class="share_note_detail" style="background-color:${shareNote.note_color}">
				<form action="shareNoteUpdate.do" method="post">
					<input type="hidden" name="note_seq" value="${shareNote.note_seq}">
					<div class="share_title">
						<textarea name="note_title" rows="1.5" cols="32" class="note_alter_title" style="background-color:${shareNote.note_color}">${shareNote.note_title}</textarea>
					</div>
					<div class="share_content">
					
						<textarea name="note_content" rows="12" cols="42"
							class="note_alter_content" style="background-color:${shareNote.note_color}">${shareNote.note_content } </textarea>
					</div>

					<div class="share_btn">
						  <c:choose>
					      <c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
					      	  <c:if test='${loginMember.u_id eq shareNote.u_id}'>
					   			<button class="w-btn-outline w-btn-gray-outline" type="button" style="margin-top:10px" id="modal-open">글 수정</button>
						      </c:if>
					      </c:when>
					      <c:otherwise>
					      	  <c:if test='${protectorMember.p_id eq shareNote.u_id}'>
					   			<button class="w-btn-outline w-btn-gray-outline" type="button" style="margin-top:10px" id="modal-open">글 수정</button>
						      </c:if>
					      </c:otherwise>
					      </c:choose>
						
						<button class="w-btn-outline w-btn-gray-outline" type ="button" onclick="goList()">돌아가기</button>
					</div>
				</form>
			</div>

		</div>
	 

	</div>
		<div class="popup-wrap" id="popup3">

		<div class="popup">

			<div class="popup-head">

				<span class="head-title">공유 수첩 수정</span>
			</div>
			<form action="shareNoteUpdate.do" method="post">
			 <c:choose>
				  <c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
			      <input name="u_id" class="form-control" id="writer" type="hidden"
							value="${loginMember.u_id}" >
			      		
			      </c:when>
			      <c:otherwise>
			      	<input name="u_id" class="form-control" id="writer" type="hidden"
							value="${protectorMember.p_id}" >
			      </c:otherwise>
			      </c:choose>
				<input name="note_seq" type="hidden" value="${shareNote.note_seq }">
				<div class="popup-body">
					<div class="body-content">
						<div class="body-titlebox">
							<textarea name="note_title" rows="2" cols="40"class="note_title">${shareNote.note_title}</textarea>
						</div>
						<div class="body-contentbox">
							<p>
								<textarea name="note_content" rows="5" cols="43"class="note_content">${shareNote.note_content }</textarea>
							</p>
						</div>
						<p>
						메모지 색깔을 고르세요:
						<input type="color" class="bgColor" name="note_color" value="${shareNote.note_color}">
						</p>
					</div>
				</div>
				<div class="popup-foot">
					<button class="pop-btn confirm" id="confirm3" type="submit">저장</button>
					<button class="pop-btn close" id="close3" type="reset" type="button">창닫기</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		$(function() {

			$("#modal-open").click(function() {
				$("#popup3").css('display', 'flex').hide().fadeIn();
			});
			$("#close3").click(function() {
				modalClose();
			});
            function modalClose() {
                $("#popup3").fadeOut();
            }
		});
	</script>
</body>
</html>