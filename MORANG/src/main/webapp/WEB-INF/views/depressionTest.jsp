<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/Main/style.css">
    <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
    <title>main</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="resources/css/calendar.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- 차트 js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->
    <script src="calendar.js"></script>
    <link href="resources/css/Main/main.css" rel="stylesheet" id="main-css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="bootstrap.js" type="text/javascript"></script>
    <script src="bootstrap.min.js" type="text/javascript"></script>
    <script src="main.js" type="text/javascript"></script>
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
		        <a href="note.do" class="menu-item">공유수첩</a>
		        <a href="board.do" class="menu-item">게시판</a>
      </nav>
        </nav>
        <main class="content">
            <div class="channel-introduce">
                <img src='resources/img/5301.jpg' width="700px" height="400px" />
                <h1 class="test-title">
                    산전 우울증 자가진단
                    <br>
                    <strong>함께 확인해볼까요?</strong>
                </h1>
                <form action='depressionTestResult.do' method="post">
                    <h1 class="question-title">1. 어떤 것을 봐도 웃음이 잘 나지 않는다.</h1>
                    <ul class="question-answer">
                        <label><input type="radio" name="fav1" value="0">전혀 그렇지 않다.</label>
                        <label><input required="required" type="radio" name="fav1" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav1" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav1" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">2. 예전에 비해 즐거운 일이 생긴다는 기대감이 줄었다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav2" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav2" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav2" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav2" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">3. 일이 잘못되면 필요 이상으로 자신을 탓하는 것 같다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav3" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav3" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav3" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav3" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">4. 별 이유 없이 불안해지거나 걱정이 된다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav4" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav4" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav4" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav4" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">5. 별 이유 없이 겁이 나거나 공포에 휩싸인다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav5" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav5" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav5" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav5" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">6. 처리할 일들이 쌓여만 있다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav6" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav6" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav6" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav6" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">7. 불안한 기분이 들어서 잠을 잘 못 잤다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav7" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav7" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav7" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav7" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">8. 슬프거나 비참한 느낌이 들었다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav8" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav8" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav8" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav8" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">9. 너무나 불행한 기분이 들어 울었다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav9" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav9" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav9" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav9" value="3">매우 그렇다.</label>
                    </ul>
                    <br><br>
                    <h1 class="question-title">10. 나 자신을 해치고 싶은 생각이 들었다.</h1>
                    <ul class="question-answer">
                        <label><input required="required" type="radio" name="fav10" value="0">전혀 그렇지 않다.</label>
                        <label><input type="radio" name="fav10" value="1">거의 그렇지 않다.</label>
                        <label><input type="radio" name="fav10" value="2">때때로 그렇다.</label>
                        <label><input type="radio" name="fav10" value="3">매우 그렇다.</label>
                    </ul>


                    <button type="submit" class="btn-3"><span>결과확인</span></button>
                </form>
            </div>
        </main>

			



       

</body>

</html>