<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%@page import="com.smhrd.domain.diary"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="resources/css/diaryMain.css">
  <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
  <title>일기장</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- 차트 js -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->

 



</head>

<body>
  <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="main.do">MoRang.</a>
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
        <a href="shareNote.do" class="menu-item">공유수첩</a>
        <a href="boardList.do" class="menu-item">게시판</a>
      </nav>
    </nav>


    <div class="bookcover">
      <div class="bookcover-body">
        <% List<diary> list = (List<diary>) request.getAttribute("list");
            %>
            <table class="bookcover-list">
              <tr>
                <td class="bookcover-head">글번호</td>
                <td class="bookcover-head">제목</td>
                <td class="bookcover-head">아이디</td>
                <td class="bookcover-head">날씨</td>
                <td class="bookcover-head">날짜</td>
                <td class="bookcover-head">딥러닝 결과</td>
                <td class="bookcover-head">사진</td>

              </tr>
              <% for (diary diary : list) { %>
                <tr>
                  <td>
                    <%=diary.getDiary_seq()%>
                  </td>
                  <td><a href="/web/diaryContent.do/<%=diary.getDiary_seq()%>">
                      <%=diary.getDiary_title()%>
                  </td>

                  <td>
                    <%=diary.getU_id()%>
                  </td>
                  <td>
                    <%if(diary.getWeather().equals("sun")){ %><i class="fa-solid fa-sun"></i>
                      <% }else if(diary.getWeather().equals("cloud")){ %><i class="fa-solid fa-cloud"></i>
                        <% }else if(diary.getWeather().equals("rain")){ %><i
                            class="fa-solid fa-cloud-showers-heavy"></i>
                          <% }else if(diary.getWeather().equals("snow")){ %><i class="fa-solid fa-snowflake"></i>
                            <%} %>
                  </td>
                  <td>
                    <%=diary.getDiary_date()%>
                  </td>
                  <td>
                    <%=diary.getDiary_pos()%>
                      <%=diary.getDiary_neg()%>
                  </td>
                  <td>
                    <%=diary.getFilename1()%>
                  </td>
                </tr>
                <%} %>
            </table>
            <button class="modal-diary" id="diary_write" style="width: 100px; height: 50px;">일기
              작성</button>
             

      </div>

    </div>

    <div id="modal" class="modal_Wrap">
      <div class="modal_Content">
        
          <form class="form-horizontal" action="diarywrite.do" method="post" enctype="multipart/form-data"
            onsubmit="checkNull()">
            <div class="form-group">
              <div class="headline">제목 :</div>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="title" placeholder="Enter title" name="diary_title">
              </div>
            </div>

            <div class="form-group">
              <div class="headline">음성인식 :</div>
              <div class="col-sm-10">
                <button type="button" id="speech" onclick="speech_to_text()">Start STT</button>
                <button type="button" id="stop" onclick="stop()">Stop</button>
              </div>
            </div>

            <div class="form-group">
              <div class="headline">내용 :</div>
              <div class="col-sm-10">
                <textarea name="diary_content" id="diary_test" rows="10" class="form-control"></textarea>
              </div>
            </div>
            <div class="form-group">
              <div class="headline">작성자 :</div>
              <div class="col-sm-10">
                <input name="u_id" class="form-control" id="writer" type="text" value="${loginMember.u_id}" readonly>
              </div>
            </div>
            <div class="form-group">

              <div class="weather">
                <div class="headline">날씨 :</div>
                <div>
                  <ul class="icon">
                    <li><i class="fa-solid fa-sun"></i></li><input type="radio" value="sun" name="weather">
                    <li><i class="fa-solid fa-cloud"></i></li><input type="radio" value="cloud" name="weather">
                    <li><i class="fa-solid fa-cloud-showers-heavy"></i></li><input type="radio" value="rain" name="weather">
                    <li><i class="fa-solid fa-snowflake"></i></li><input type="radio" value="snow" name="weather">
                  </ul>
                </div>
                <input type="hidden" id="pos" name="pos">
                <input type="hidden" id="neg" name="neg">
                <div class="headline"><input type="button" value="감정 확인" id="test"></div>

              </div>
              <div id="data1"></div>

              <div id="data2"></div>
            </div>

            <div class="form-group">
              <div class="headline">사진 :</div>
              <div class="col-sm-10">
                <input type="file" class="form-control" name="filename1">
              </div>
            </div>

            
              
              
            

            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn-finish" id="diary_Check">저장하기</button>
                <button type="submit" class="btn-finish" id="diary_close">창 닫기</button>
              </div>
            </div>
          </form>
        

      </div>
    </div>

    <script>
      $(function() {
        $("#test_Check").click(function() {
          modalClose();
        });
        $("#diary_write").click(function() {
          $("#modal").css('display', 'flex').hide().fadeIn();
        });
        $("#diary_close").click(function() {
          modalClose();
        });
              function modalClose() {
                  $("#modal").fadeOut();
              }
      });
    </script>

    <script type="text/javascript">
      $('#test').click(function () {
        var text = $('#diary_test').val()
        var postdata = {
          'msg': text
        }

        $.ajax({
          type: 'POST',
          url: 'http://127.0.0.7:9999/sentiment',
          async: false,
          data: JSON.stringify(postdata),
          dataType: 'JSON',
          contentType: "application/json",
          success: function (data) {
            let pos = data.result2['pos'];
            let neg = data.result2['neg'];
            //        $('#morang').append(pos);
            //        $('#morang').append(neg);
            document.getElementById("data1").innerHTML = pos;
            document.getElementById("data2").innerHTML = neg;
            $('#pos').val(pos);
            $('#neg').val(neg);
          },

          error: function (request, status, error) {
            alert('ajax 통신 실패')
            alert(error);
          }
        });
      })
    </script>

    <script type="text/javascript">
      $('#test_Check').click(function () {
        var text = $('#diary_test').val()
        var postdata = {
          'msg': text
        }

        $.ajax({
          type: 'POST',
          url: 'http://127.0.0.7:9999/sentiment',
          async: false,
          data: JSON.stringify(postdata),
          dataType: 'JSON',
          contentType: "application/json",
          success: function (data) {
            let pos = data.result2['pos'];
            let neg = data.result2['neg'];

            //location.href = "diarywriteCon.do/" + pos + "/" + neg
          },

          error: function (request, status, error) {
            alert('ajax 통신 실패')
            alert(error);
          }
        });
      })
    </script>
    <script type="text/javascript">

      var message = document.querySelector("#message");
      var button = document.querySelector("#speech");
      var korea = document.querySelector("#diary_test");
      var english = document.querySelector("#english");
      var isRecognizing = false;

      if ('SpeechRecognition' in window) {
        // Speech recognition support. Talk to your apps!
        console.log("음성인식을 지원하는 브라우저입니다.")
      }

      try {
        var recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition || window.mozSpeechRecognition || window.msSpeechRecognition)();
      } catch (e) {
        console.error(e);
      }

      recognition.lang = 'ko-KR'; // 언어선택 .
      recognition.interimResults = false;
      recognition.maxAlternatives = 5;
      //recognition.continuous = true;


      function speech_to_text() {

        recognition.start();
        isRecognizing = true;

        recognition.onstart = function () {
          console.log("음성인식이 시작 되었습니다. 이제 마이크에 무슨 말이든 하세요.")
          message.innerHTML = "음성인식 시작...";
          button.innerHTML = "Listening...";
          button.disabled = true;
        }


        recognition.onspeechend = function () {
          message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
          button.disabled = false;
          button.innerHTML = "Start STT";
        }

        recognition.onresult = function (event) {
          console.log('You said: ', event.results[0][0].transcript);
          // 결과를 출력
          var resText = event.results[0][0].transcript;
          korea.innerHTML = resText;

          //text to sppech
          text_to_speech(resText);

        };

        recognition.onend = function () {
          message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
          button.disabled = false;
          button.innerHTML = "Start STT";
          isRecognizing = false;

        }
      }

      function stop() {
        recognition.stop();
        message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
        button.disabled = false;
        button.innerHTML = "Start STT";
        isRecognizing = false;
      }



      // Text to speech
      function text_to_speech(txt) {
        // Web Speech API - speech synthesis
        if ('speechSynthesis' in window) {
          // Synthesis support. Make your web apps talk!
          console.log("음성합성을 지원하는  브라우저입니다.");
        }
        var msg = new SpeechSynthesisUtterance();
        var voices = window.speechSynthesis.getVoices();
        //msg.voice = voices[10]; // 두번째 부터 완전 외국인 발음이 됨. 사용하지 말것.
        msg.voiceURI = 'native';
        msg.volume = 1; // 0 to 1
        msg.rate = 1.3; // 0.1 to 10
        //msg.pitch = 2; //0 to 2
        msg.text = txt;
        msg.lang = 'ko-KR';

        msg.onend = function (e) {
          if (isRecognizing == false) {
            recognition.start();
          }
          console.log('Finished in ' + event.elapsedTime + ' seconds.');
        };
        window.speechSynthesis.speak(msg);
      }

    </script>

</body>

</html>