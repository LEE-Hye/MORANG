<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 템플릿만 저장하는 용도 -->
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
</head>
<body>

	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
			<%--post방식에서도 action에  
				boardUpdate.do?idx=${board.idx}
				이렇게 쿼리 스트링을 넣어주는 건 문제가 되지 않았다.
			--%>
				<form class="form-horizontal" action="diaryUpdate.do" method="post">
					<input type = "hidden" name = "diary_seq" value="${diary.diary_seq}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="diary_title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="diary_title"
								value="${diary.diary_title }" name="diary_title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="u_id">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="u_id"
								value="${diary.u_id }" name="u_id" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="diary_content">내용:</label>
						<div class="col-sm-10">
							<textarea name ="diary_content" id = "diary_content" rows="10" class = "form-control">${diary.diary_content }</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
						<!-- button은 default가 submit이라 타입 지워도 submit이야 -->
							<button type="submit" class="btn btn-default">글쓰기</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">빅데이터 12차 이혜빈</div>
		</div>
	</div>