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
			<div class="panel-heading"></div>
			<div class="panel-body">
				<form class="form-horizontal" action="diarywrite.do" method="post" onsubmit="checkNull()">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="Enter title" name="diary_title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea name="diary_content" id="content" rows="10"
								class="form-control"></textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="writer"
								placeholder="Enter writer" name="u_id">
						</div>
					</div>
					
					
					<div class="form-group">

					</div>
					
					
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">글작성</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">빅데이터 12차 이혜빈</div>
		</div>
	</div>
</body>


</html>