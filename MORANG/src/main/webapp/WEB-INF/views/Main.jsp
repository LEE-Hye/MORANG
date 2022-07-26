<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setHeader("Access-Control-Allow-Origin","http://222.102.104.182:8082/ajax"); %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="resources/css/Main/style.css">
  <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
  <title>morang</title>
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
</head>

<body>
  <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="메인 페이지.html">MoRang.</a>
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
    
    <section id="soohyeonchatbotarea" style="display: none;">
      <img src="resources/img/soohyeon.gif" alt="실패" width="400px" height="320px" id="soohyeonbot">
      <div class="chat_window">
        <div class="top_menu">
          <div class="buttons">
            <div class="button close_button"></div>
            <div class="button minimize"></div>
            <div class="button maximize"></div>
          </div>
          <div class="title">모랑</div>
        </div>
        <ul class="messages"></ul>
        <div class="bottom_wrapper clearfix">
          <div class="message_input_wrapper">
            <input class="message_input" placeholder="내용을 입력하세요." />
          </div>

          <div class="send_message" id="send_message">


            <div class="text">보내기</div>
          </div>

        </div>
      </div>
      <div class="message_template">
        <li class="message">
          <div class="avatar"></div>
          <div class="text_wrapper">
            <div class="text"></div>
          </div>
        </li>
      </div>
    </section>
    
    <section class="content-main">
      <div class="good-text">
        ${mot}
      </div>
		
      <article>
        <div class="calender">
          <div class="container3">
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
              <form action="#">
                <div id="tab-1" class="tab-content current">
                  <div>
                    <div>
                      <textarea name="title" rows="1.5" cols="80" placeholder="여기가 제목이야" class="title" name="#"
                        id="content_id"></textarea>
                    </div>
                    <div>
                      <textarea name="content" rows="20" cols="60" placeholder="여기는 본문 내용 써" class="content" name="#"
                        id="content_sh"></textarea>
                    </div>
                    <div class="weather">
                      <div>
                        <ul class="icon">
                          <li><i class="fa-solid fa-sun"></i></li><input type="radio" value="sun" name="weather">
                          <li><i class="fa-solid fa-cloud"></i></li><input type="radio" value="cloud" name="weather">
                          <li><i class="fa-solid fa-cloud-showers-heavy"></i></li><input type="radio" value="rain" name="weather">
                          <li><i class="fa-solid fa-snowflake"></i></li><input type="radio" value="snow" name="weather">

                        </ul>
                      </div>
                    </div>


                    <button type="submit" class="sub_btn">저장</button>
                  </div>
                </div>
              </form>

              <div id="tab-2" class="tab-content">
                <div>
                  <div>
                    <textarea name="title" rows="1.5" cols="80" class="title">오늘은 기분이 별로였다.
                      </textarea>
                  </div>
                  <div>
                    <textarea name="content" rows="20" cols="80" class="content">왜냐하면 별로였기 때문이다.
                      </textarea>
                  </div>
                  <button class="next_diary">다른 날짜 일기 더 보러 갈래?</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        
        <div>
          <div class="flex_sh">
            <div class="yesterday-graph">
              <div class="card-header">긍정</div>
              <div class="pie-chart_pie-chart1"><span class="center">60%</span></div>

            </div>
            <div class="today-graph">
              <div class="card-header">부정</div>
              <div class="pie-chart_pie-chart2"><span class="center">40%</span></div>
            </div>
          </div>
          <div class="flex_sh">
            <div class="yesterday-graph">
              <div class="card-header">긍정</div>
              <div class="pie-chart_pie-chart1"><span class="center">60%</span></div>

            </div>
            <div class="today-graph">
              <div class="card-header">부정</div>
              <div class="pie-chart_pie-chart2"><span class="center">40%</span></div>
            </div>
          </div>
          </div>
       

	</article>
	
	<div>
            <canvas id="Week-Chart" width="500%"height="150%"></canvas>
        </div>
	
		 </section>
		
    
  
    <div>
      <!--<img src="soohyeon.gif" alt="실패" id="shbot" width="130px" height="130px">-->
      <img src="resources/img/soohyeon.gif" alt="실패" id="chatbot_close" width="130px" height="130px">
    </div>
</div>




    <!--                        스크립트 해놓은 거야                                                            -->

    <!-- 그래프 차트 스크립트 -->
    <script>
      var ctx = document.getElementById('Week-Chart').getContext('2d');
      var chart = new Chart(ctx, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
          labels: ['월', '화', '수', '목', '금', '토', '일'],
          datasets: [{
            label: '주간 감정 데이터 비교',
            backgroundColor: 'transparent',
            borderColor: '#FFA7A7',
            data: [0, 10, 5, 2, 20, 30, 45]
          }]
        },
        // 옵션
        options: {
          legend: {
            display: false
          }
        },
        title: {
          display: true,
          text: '주간 데이터 분석'
        }

      });
    </script>

    <!-- 파이차트 스크립트 -->
    <script>
      $(window).ready(function () {
        draw(80, '.pie-chart_pie-chart1', '#81F781');
        draw(50, '.pie-chart_pie-chart2', '#8b22ff');
      });

      function draw(max, classname, colorname) {
        var i = 1;
        var func1 = setInterval(function () {
          if (i < max) {
            color1(i, classname, colorname);
            i++;
          } else {
            clearInterval(func1);
          }
        }, 10);
      }
      function color1(i, classname, colorname) {
        $(classname).css({
          "background": "conic-gradient(" + colorname + " 0% " + i + "%, #ffffff " + i + "% 100%)"
        });
      }

    </script>
    <!-- 메뉴 토글 -->
    <script>
      const menu_toggle = document.querySelector('.menu-toggle');
      const sidebar = document.querySelector('.sidebar');

      menu_toggle.addEventListener('click', () => {
        menu_toggle.classList.toggle('is-active');
        sidebar.classList.toggle('is-active');
      })


    </script>



</body>

</html>