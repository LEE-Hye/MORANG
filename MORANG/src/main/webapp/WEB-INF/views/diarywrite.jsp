<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/calendar.js"></script>
<link rel="stylesheet" href="resources/css/calendar.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>캘린더</title>
</head>
<body>
	<div class="container">
		<div class='rap'>
			<div class="header">
				<div class="btn prevDay"></div>
				<h2 class='dateTitle'></h2>
				<div class="btn nextDay"></div>
			</div>
			<div class="to_btn">
				<button class="today_btn">오늘</button>
			</div>
			<div class="grid dateHead">
				<div>일</div>
				<div>월</div>
				<div>화</div>
				<div>수</div>
				<div>목</div>
				<div>금</div>
				<div>토</div>
			</div>

			<div class="grid dateBoard"></div>
		</div>
	</div>

	<div id="modal" class="modal_Wrap">
		<div class="modal_Content">
			<span class="close">&times;</span>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">일기 적을래?</li>

			</ul>
			<form action="diarywrite.do" method="post">
				<div id="tab-1" class="tab-content current">
					<div>
					<!-- 나중에 작성자 자동으로 나오게 해야해 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="writer">작성자:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="writer"
									placeholder="Enter writer" name="u_id">
							</div>
						</div>
						
						<div>
							<textarea name="diary_title" rows="1.5" cols="80"
								placeholder="여기가 제목이야" class="title"></textarea>
						</div>
						<div>
							<textarea name="diary_content" rows="20" cols="80"
								placeholder="여기는 본문 내용 써" class="content"></textarea>
						</div>
						<div class="weather">
							<div>
								<ul class="icon">
									<span class="weather_text"> 날씨: </span>
									<li class="test_obj"><input type="radio" value="sun"
										name="weather" id="sun"><label for="sun"
										class="fa-solid fa-sun"></label></li>
									<li class="test_obj"><input type="radio" value="cloud"
										name="weather" id="cloud"><label for="cloud"
										class="fa-solid fa-cloud"></label></li>
									<li class="test_obj"><input type="radio" value="rain"
										name="weather" id="rain"><label for="rain"
										class="fa-solid fa-cloud-showers-heavy"></label></li>
									<li class="test_obj"><input type="radio" value="snow"
										name="weather" id="snow"><label for="snow"
										class="fa-solid fa-snowflake"></label></li>
								</ul>
							</div>
						</div>

						<div id="btn_group">
							<button type="submit" class="sub_btn">작성</button>
						</div>
					</div>
				</div>
			</form>


		</div>
	</div>
</body>
</html>