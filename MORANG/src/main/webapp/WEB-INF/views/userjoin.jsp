<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="#">
		<table width="400px">
			<tr bgcolor="gray" height="50px">
				<th colspan="2">Step 1 : 아이디/비밀번호 입력</th>
			</tr>
			<tr bgcolor="whitesmoke" height="30px">
				<td>아이디:</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr bgcolor="whitesmoke" height="30px">
				<td>비밀번호:</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr bgcolor="whitesmoke" height="30px">
				<td>이름:</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr bgcolor="whitesmoke" height="30px">
				<td>닉네임:</td>
				<td><input type="text" name="nick"></td>
			</tr>

			<tr bgcolor="whitesmoke" height="30px">
				<td>휴대폰 번호:</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr bgcolor="whitesmoke" height="30px">
				<td>생년월일:</td>
				<td><input type="date" name="date"></td>
			</tr>

			<tr align="center">
				<td colspan="2"><input type="submit" value="제출하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>