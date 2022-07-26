<%@page import="com.smhrd.domain.diary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감정 일기장</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="resources/css/Main/style.css">
	<link rel="stylesheet" href="resources/css/calendar.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="resources/css/Main/calendar.css">
  <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- 차트 js -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->
  <script src="resources/js/Main/calendar.js"></script>
  <link href="resources/css/Main/main.css" rel="stylesheet" id="main-css">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="resources/js/Main/bootstrap.js" type="text/javascript"></script>
  <script src="resources/js/Main/bootstrap.min.js" type="text/javascript"></script>
  <script src="resources/js/Main/main.js" type="text/javascript"></script>
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
   <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="Main.do">MoRang.</a>
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
        <span></span>
        <span></span>
        <span></span>
      </div>

      <h1>Menu</h1>
      <nav class="menu">
        <a href="Main.do" class="menu-item">HOME</a>
        <a href="depressionTest.do" class="menu-item">우울증 자가진단</a>
        <a href="diary.do" class="menu-item">감정 일기장</a>
        <a href="shareNote.do" class="menu-item">공유수첩</a>
        <a href="boardList.do" class="menu-item">게시판</a>
      </nav>
    </nav>
    
        <div class="container">
           
            <div class="panel panel-default">
                <div class="panel-heading" style="font-size: 20px ; background-color: #e4beb3;">오늘의 기분을 적어보세요~</div>
                <div class="panel-body">
				<%
				List<diary> list = (List<diary>) request.getAttribute("list");
				%>
				<table class="table table-bordered table-hover">
					<tr>
						<td>글번호</td>
						<td>제목</td>
						<td>본문</td>
						<td>아이디</td>
						<td>날씨</td>
						<td>날짜</td>
						<td>딥러닝 결과</td>
						<td>사진</td>

					</tr>
					<%
						for (diary diary : list) {
					%>
					<tr>
						<td><%=diary.getDiary_seq()%></td>
						<td><a href="/web/diaryContent.do/<%=diary.getDiary_seq()%>"><%=diary.getDiary_title()%></td>
						<td><%=diary.getDiary_content()%></td>
						<td><%=diary.getU_id()%></td>
						<td>
							<%if(diary.getWeather().equals("sun")){
							%><i class="fa-solid fa-sun"></i>
							<% }else if(diary.getWeather().equals("cloud")){
							%><i class="fa-solid fa-cloud"></i>
							<% }else if(diary.getWeather().equals("rain")){
							%><i class="fa-solid fa-cloud-showers-heavy"></i>
							<% }else if(diary.getWeather().equals("snow")){
							%><i class="fa-solid fa-snowflake"></i>
							<%} %>
						</td>

						<td><%=diary.getDiary_date()%></td>
						<td><%=diary.getDiary_pos()%> <%=diary.getDiary_neg()%></td>
						<td><%=diary.getFilename1()%></td>
					</tr>
					<%} %>
				</table>
				<button onclick="location.href='diarywrite.do'"
					class="btn btn-sm btn-danger" style="width: 100px; height: 50px;">작성</button>
                </div>
                <div class="panel+footer" style="background-color:Green; color:yellow;">스마트인재개발원 최종프로젝트 팀 우산</div>
		</div>
	</div>
</body>

</html>