<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.smhrd.domain.note"%>
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
					List<note> list = (List<note>) request.getAttribute("list");
				%>
				<table class="table table-bordered table-hover">
					<tr>
						<td>글번호</td>
						<td>제목</td>
						<td>본문</td>
						<td>아이디</td>
						<td>사진</td>
						<td>날짜</td>

					</tr>
					<%
						for (note note : list) {
					%>
					<tr>
						<td><%=note.getSeq()%></td>
						<td><%=note.getTitle()%></td>
						<td><%=note.getContent()%></td>
						<td><%=note.getId()%></td>
						<td><%=note.getFilename1()%></td>
						<td><%=note.getDate()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<button onclick="location.href='noteInsert.do'"
					class="btn btn-sm btn-success">작성</button>
					
			</div>
			<div class="panel-footer">빅데이터 12차 이혜빈</div>
		</div>
	</div>
	<img alt="" src="<%=list.get(13).getFilename1()%>">
</body>
</html>