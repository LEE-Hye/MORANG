<%@page import="com.smhrd.domain.diary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">뀨</div>
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

					</tr>
					<%
						for (diary diary : list) {
					%>
					<tr>
						<td><%=diary.getDiary_seq()%></td>
						<td><%=diary.getDiary_title()%></td>
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
					</tr>
					<%} %>
				</table>
				<button onclick="location.href='diarywrite.do'"
					class="btn btn-sm btn-success">작성</button>
			</div>
			<div class="panel-footer">빅데이터 12차 이혜빈</div>
		</div>
	</div>
</body>
</html>