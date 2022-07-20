<<<<<<< HEAD
<%@page import="com.smhrd.domain.diary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 템플릿만 저장하는 용도 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function goList(){
		// boardList 페이지로 이동
		// PathVariable을 사용중인 페이지에는 /ContextPath/ 를 붙이자.
		// / == http://localhost:8083/
		location.href = "/web/diary.do";
	}		
	
	function goDelete(diary_seq){
		
		location.href = '/web/diaryDelete.do?diary_seq=' + diary_seq;
		
	}
	
	function goUpdate(diary_seq){
		location.href = "/web/diaryGoUpdate.do?diary_seq=" + diary_seq;
	}

	
</script>


</head>
<body>
	<%--
	EL은 scope(pageContext, request, session, application)에서 가져옴
	.getAttribute()와 유사
	
	${scope(scope생략가능).이름.필드명} 
	=> ${이름.필드명}
	
	이름이 겹치면
	PageContext < request < session < application
	유지 시간이 짧은 scope의 것을 가져온다. 
	 --%>

	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Panel Heading</div>
			<div class="panel-body">
				<table class="table table-hover">
					<tr>
						<td>제목 :</td>
						<td>${requestScope.diary.diary_title}</td>
					</tr>
					<tr>
						<td>작성자 :</td>
						<td>${diary.u_id}</td>
					</tr>
					<tr>
						<td>내용 :</td>
						<%
							pageContext.setAttribute("newLine", "\n");
						%>
						<td>${fn:replace(diary.diary_content, newLine, "<br>") }</td>
						<%--fn:replace(대상 문자열, 바꿀 문자열, 바꾼 뒤 문자열) --%>
						<%-- \n을 replace하고 싶다면, scope에 문자열로써 담아뒀다가 꺼내서 써야됨 --%>
						<%--"el공부중\n 잘 되나 \n 확인해볼게용" --%>
					</tr>
					<tr>
						<td>작성일 :</td>
						<td>${fn:split(diary.diary_date, " ")[0] }</td>
						<%-- fn:split("대상 문자열", "구분자") --%>
						<%-- ["2022-06-21", "15:00:00"] 에서 날짜만 나오게 만들기--%>
					</tr>
					<tr>
						<td>날씨 :</td>
						<td>

						<c:choose>
							<c:when test="${diary.weather eq 'sun'}">
								<i class="fa-solid fa-sun"></i>
							</c:when>
							<c:when test="${diary.weather eq 'cloud'}">
								<i class="fa-solid fa-cloud"></i>
							</c:when>
							<c:when test="${diary.weather eq 'rain'}">
								<i class="fa-solid fa-cloud-showers-heavy"></i>
							</c:when>
							<c:when test="${diary.weather eq 'snow'}">
								<i class="fa-solid fa-snowflake"></i>
							</c:when>
							
						</c:choose>
						
						

						</td>
					</tr>
					<tr>
						<td>딥러닝결과 :</td>
						<td>${diary.diary_deep}</td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<button onclick="goUpdate(${diary.diary_seq})"
								class="btn btn-sm btn-info">수정</button>
							<button onclick="goDelete(${diary.diary_seq})"
								class="btn btn-sm btn-warning">삭제</button>
							<button onclick="goList()" class="btn btn-sm btn-success">목록</button>
						</td>

					</tr>

				</table>
			</div>
			<div class="panel-footer">빅데이터 12차 이혜빈</div>
		</div>
=======
<%@page import="com.smhrd.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 템플릿만 저장하는 용도 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function goList(){
		// boardList 페이지로 이동
		// PathVariable을 사용중인 페이지에는 /ContextPath/ 를 붙이자.
		// / == http://localhost:8083/
		location.href = "/web/diary.do";
	}		
	
	function goDelete(diary_seq){
		
		location.href = '/web/diaryDelete.do?diary_seq=' + diary_seq;
		
	}
	
	function goUpdate(diary_seq){
		location.href = "/web/diaryGoUpdate.do?diary_seq=" + diary_seq;
	}

	
</script>


</head>
<body>
	<%--
	EL은 scope(pageContext, request, session, application)에서 가져옴
	.getAttribute()와 유사
	
	${scope(scope생략가능).이름.필드명} 
	=> ${이름.필드명}
	
	이름이 겹치면
	PageContext < request < session < application
	유지 시간이 짧은 scope의 것을 가져온다. 
	 --%>

	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Panel Heading</div>
			<div class="panel-body">
				<table class="table table-hover">
					<tr>
						<td>제목 :</td>
						<td>${requestScope.diary.diary_title}</td>
					</tr>
					<tr>
						<td>작성자 :</td>
						<td>${diary.u_id}</td>
					</tr>
					<tr>
						<td>내용 :</td>
						<%pageContext.setAttribute("newLine", "\n"); %>
						<td>${fn:replace(diary.diary_content, newLine, "<br>") }</td>
						<%--fn:replace(대상 문자열, 바꿀 문자열, 바꾼 뒤 문자열) --%>
						<%-- \n을 replace하고 싶다면, scope에 문자열로써 담아뒀다가 꺼내서 써야됨 --%>
						<%--"el공부중\n 잘 되나 \n 확인해볼게용" --%>
					</tr>
					<tr>
						<td>작성일 :</td>
						<td>${fn:split(diary.diary_date, " ")[0] }</td>
						<%-- fn:split("대상 문자열", "구분자") --%>
						<%-- ["2022-06-21", "15:00:00"] 에서 날짜만 나오게 만들기--%>
					</tr>
					
					<tr>
						<td colspan="2" align ="center">
							<button onclick = "goUpdate(${diary.diary_seq})" class= "btn btn-sm btn-info">수정</button>
							<button onclick = "goDelete(${diary.diary_seq})" class= "btn btn-sm btn-warning">삭제</button>
							<button onclick = "goList()" class= "btn btn-sm btn-success">목록</button>
						</td>
					
					</tr>
					
				</table>
			</div>
			<div class="panel-footer">빅데이터 12차 이혜빈</div>
		</div>
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-5/MORANG.git
	</div>