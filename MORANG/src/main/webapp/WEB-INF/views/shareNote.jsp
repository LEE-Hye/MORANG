<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.smhrd.domain.shareNote"%>
<%@page import="java.util.List"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유수첩</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./resources/css/noteshare.css">
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>



</head>
<body>
	<nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="Main.do"><img class="pic_morang" src="./resources/img/morang2.png"></a>
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
        <span></span>
        <span></span>
        <span></span>
      </div>

      <h1>Menu</h1>
      <nav class="menu">
        <a href="Main.do" class="menu-item">HOME</a>
        <a href="depressionTest.do" class="menu-item">우울증 자가진단</a>
        <c:if test='${protectorMember.p_id eq "soohyeonempty" }'>
        <a href="diary.do" class="menu-item">감정 일기장</a>
        </c:if>
        <a href="shareNote.do" class="menu-item" id="nowpage">공유수첩</a>
        <a href="boardList.do" class="menu-item">게시판</a>
      </nav>
    </nav>


		<%
			List<shareNote> list = (List<shareNote>) request.getAttribute("list");
		%>

		<div class="share_note">
			<%
				for (shareNote shareNote : list) {
			%>
			<div class="share_note1">
				<i class="fa-solid fa-thumbtack fa-2x" id="thumbtack2"></i>
				<a href="/web/shareNotedetail.do?note_seq=<%=shareNote.getNote_seq()%>"><div class="share_content"><%=shareNote.getNote_content()%></div></a>
				<div class="share_title"><%=shareNote.getNote_title()%></div>
				<div class="share_date"><%=shareNote.getNote_date()%></div>
			</div>

			<%
				}
			%>
		</div>

	</div>

		<div id="plus_note">
			<i class="fa-solid fa-circle-plus fa-3x" id="modal-open"></i>
		</div>





	<div class="popup-wrap" id="popup3">

		<div class="popup">

			<div class="popup-head">

				<span class="head-title">공유 수첩 작성</span>
			</div>
			<form action="shareNoteInsert.do" method="post">
				<input name="u_id" class="form-control" id="writer" type="text"
							value="${loginMember.u_id}" hidden>
				<div class="popup-body">
					<div class="body-content">
						<div class="body-titlebox">
							<textarea name="note_title" rows="2" cols="40"
								placeholder="제목을 입력해주세요" class="note_title"></textarea>
						</div>
						<div class="body-contentbox">
							<p>
								<textarea name="note_content" rows="5" cols="43"
									placeholder="내용을 입력해주세요" class="note_content"></textarea>
							</p>
						</div>
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