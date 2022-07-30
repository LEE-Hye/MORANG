<%@page import="com.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
   @font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
font-family: 'BMJUA';
}
.container {
    width: 500px;
}
   </style>
<body>

   <div class="container">
      <h2>회원정보 수정</h2>
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color:#e4beb3; color:aliceblue;">개인 정보 수정하기</div>
				<form action="joinUpdate.do" method="post" >
					<br>
				<div class="name" style="margin-left: 110px;">
						ID : 변경 불가능한 부분 입니다<br> <input id="u_id" type="text" name="u_id"
							value="${loginMember.u_id}" readonly="readonly" class="inputList" size="30"
							style="color:red;">
						<div id="nameError1" class="error"></div>
						<br>
					</div>
				<div class="nick" style="margin-left: 110px;">
						이름 : <br> <input id="name" type="text" name="u_name"
							value="${loginMember.u_name}" size="30" class="inputList">
						<div id="nameError" class="error"></div>
						<br>
					</div>
					<div class="nick" style="margin-left: 110px;">
						닉네임 :<br> <input id="nick" type="text" name="u_nick"
							value="${loginMember.u_nick}" size="30" class="inputList">
						<div id="nickError" class="error"></div>
						<br>
					</div>
					<div class="password" style="margin-left: 110px;">
						비밀번호 :<br> <input id="password" type="password" name="u_pw"
							value="${loginMember.u_pw}" size="30" class="inputList">
						<div id="passwordError" class="error"></div>
						<br>
					</div>
					<div class="passwordCheck" style="margin-left: 110px;">
						비밀번호 확인 : <br>
						<input id="passwordCheck" type="password"
							value="${loginMember.u_pw}" size="30" class="inputList">
						<div id="passwordCheckError" class="error"></div>
						<br>
					</div>
					<div class="phone" style="margin-left: 110px;">
						휴대폰 번호 :<br> <input id="phone" type="text" size="30"
							name="u_phone" maxlength="11" value="${loginMember.u_phone}"
							class="inputList">
					</div>
					<br>
					<div class="line">
						<hr>
					</div>
					<div align="center">
						<input type="submit" value="회원정보 수정" class="btn-3" style="margin-right:40px;">
						<input type="submit" value="회원 탈퇴" class="btn-3">
					</div>
				</form>
			</div>
			<div class="panel-footer">모랑모랑</div>
      </div>

</body>
</html> 