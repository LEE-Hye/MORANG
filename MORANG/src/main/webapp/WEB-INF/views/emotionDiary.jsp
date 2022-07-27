<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/Main/style.css">
    <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
    <title>일기장</title>
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
      <a href="메인 페이지.html">MoRang.</a>
    </div>

    <ul class="navbar_menu">
      <li><a href="">개인정보수정</a></li>
      <li><a href="">로그아웃</a></li>
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
        <a href="메인 페이지.html" class="menu-item">HOME</a>
        <a href="산전 우울증.html" class="menu-item">우울증 자가진단</a>
        <a href="감정일기장.html" class="menu-item">감정 일기장</a>
        <a href="공유수첩.html" class="menu-item">공유수첩</a>
        <a href="게시판.html" class="menu-item">게시판</a>
      </nav>
    </nav>
    <div class="bookcover">
      <div class="bookdot">
        <!--note-->
        <div class="main-content">
          <div class="note">
            yyyy년 mm월
            <input type="date" id="birthday" name="birthday">
          </div>
          <button class="modal-diary">일기작성</button>
              
        </div>
        <div class="diary">
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.10.10</div>
            <div class="card">
              <img class="card-img-top" src="신생아.jpg" alt="아기사진">
              <div class="card-body">
                <span class="card-text">아이가 나를 보고 '오' 라고 말했다. 너무
                  귀여워워워워워워우어ㅜ어ㅜ어워워워우어ㅜ어ㅜ어ㅜ어워워워워워워워워워ㅜ워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워워</span>
              </div>
            </div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.10.14</div>
            <div class="card">
              <img class="card-img-top" src="잼민이.png" alt="초음파사진">
              <div class="card-body">
                <span class="card-text">어느 새 너무 커버려 잼민이가
                  되었다.ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</span>
              </div>
            </div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.10.20</div>
            <div class="card">
              <img class="card-img-top" src="무지개.jpg" alt="Card image cap">
              <div class="card-body">
                <span class="card-text">무지개를 봐서 기분이 매우매우매우매우매우 좋았다. 근데 우산을 안가지고 나가서 옷이 홀딱 젖었다. 다시 생각해보니 기분이 정말
                  꿉꿉하다.</span>
              </div>
            </div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.11.01</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.11.10</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.11.25</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.11.30</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.12.10</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.12.14</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.12.16</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
          <div class="diary-box">
            <div class="diary-date" id="bold-text">2022.12.20</div>
            <div class="diary-text" id="basic-text"></div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <div id="modal" class="modal_Wrap">
    <div class="modal_Content">
      <span class="close"></span>
      <form action="#">
        <div id="tab-1" class="tab-content current">
          <div>
            <div>
              <form method="post" enctype="multipart/form-data">
                <div class="button">
                    <label for="chooseFile">
                        👉 사진 업로드! 👈
                    </label>
                </div>
                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
            </form>
            </div>
            <div>
              <textarea name="content" rows="20" cols="80" placeholder="내용을 입력하세요" class="content"
                name="#"></textarea>
            </div>
            <div class="weather">
              <div>

                <ul class="icon">
                  <span class="weather_text">
                    날씨:
                  </span>
                  <li class="test_obj"><input type="radio" value="sun" name="weather" id="sun"><label for="sun"
                      class="fa-solid fa-sun"></label></li>
                  <li class="test_obj"><input type="radio" value="cloud" name="weather" id="cloud"><label for="cloud"
                      class="fa-solid fa-cloud"></label></li>
                  <li class="test_obj"><input type="radio" value="rain" name="weather" id="rain"><label for="rain"
                      class="fa-solid fa-cloud-showers-heavy"></label></li>
                  <li class="test_obj"><input type="radio" value="snow" name="weather" id="snow"><label for="snow"
                      class="fa-solid fa-snowflake"></label></li>
                </ul>
              </div>
            </div>
            <button type="submit" class="sub_btn">저장</button>
          </div>
        </div>
      </form>
    </div>
  </div>



  <script>
    $(document).on('click', '.modal-diary', function () {
      let i = $(this).text()

      console.log(i)
      const modal = document.getElementById('modal');
      // id값이 modal인 속성을 찾아서 modal변수에 할당

      const button = document.getElementById('btn');
      // id값이 btn인 속성을 찾아서 button변수에 할당

      const span = document.querySelector('.close');
      // class값이 close인 속성을 찾아 span변수에 할당


      //날짜를 클릭했을때 modal창을 보여준다.
      modal.style.display = 'block';


      //X버튼을 클릭했을때 modal창을 닫는다.(안보이게 한다.)
      span.onclick = function () {
        modal.style.display = 'none';
      }

      //사용자가 모달창 외부의 아무 곳이나 클릭하면 모달창을 닫는다.(안보이게 한다.)
      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = 'none';
        }
      }

    })
  </script>
</body>
</html>