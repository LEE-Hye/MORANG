<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="resources/css/diarywrite.css">
  <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
  <title>일기장</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->
</head>
<body>
<div class="stars">
    </div>
    
	<div class="write_Content">
      
        <form class="form-horizontal" action="diarywrite.do" method="post" enctype="multipart/form-data"
          onsubmit="checkNull()"id="ajaxafter">
          <div class="form-group">
            <div class="headline">제목 :</div>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="title" placeholder="Enter title" name="diary_title">
            </div>
          </div>

          <div class="form-group">
            <div class="headline">음성인식</div>
            <div class="col-sm-10">
              <button type="button" id="speech" class="modal-diary" onclick="speech_to_text()">Start STT</button>
              <button type="button" id="stop" class="modal-diary" onclick="stop()">Stop</button>
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
                  <input type="hidden" id="pos" name="pos">
                  <input type="hidden" id="neg" name="neg">
                </ul>
              
              </div>
              

            </div>
            <div id="data1"></div>

            <div id="data2"></div>
          </div>

          <div class="form-group">
            <div class="col-sm-10">
            <div class="headline">사진 :</div>
          </div>
            <div class="col-sm-10">
              <input type="file" class="form-control" name="filename1">
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-10">
              <button type="button" class="modal-diary"id="test_Check">저장하기</button>
            </div>
          </div>
        </form>
      

    </div>
	
	
	

<script type="text/javascript">
		$(document).on('click', '#test_Check', function(){
			
         var text = $('#diary_test').val()
         var postdata = {
            'msg' : text
         }

         $.ajax({
            type : 'POST',
            url : 'http://222.102.104.182:8084/sentiment',
            async : false,
            data : JSON.stringify(postdata),
            dataType : 'JSON',
            contentType : "application/json",
            success : function(data) {
            	let pos = data.result2['pos'];
                let neg = data.result2['neg'];
				console.log(pos);
				$('#pos').val(pos);
				$('#neg').val(neg);
                
				
                let pos2=$('#pos').val()
                console.log(pos2);
                document.getElementById('ajaxafter').submit();
               //location.href = "diarywriteCon.do/" + pos + "/" + neg
            },

            error : function(request, status, error) {
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
         } catch(e){
             console.error(e);
         }

        recognition.lang = 'ko-KR'; // 언어선택 .
         recognition.interimResults = false;
         recognition.maxAlternatives = 5;
         //recognition.continuous = true;


         function speech_to_text(){
            
             recognition.start();
             isRecognizing = true;

            recognition.onstart = function(){
                 console.log("음성인식이 시작 되었습니다. 이제 마이크에 무슨 말이든 하세요.")
                 message.innerHTML = "음성인식 시작...";
                 button.innerHTML = "Listening...";
                 button.disabled = true;
             }
            

            recognition.onspeechend = function(){
                 message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
                 button.disabled = false;
                 button.innerHTML = "Start STT";
             }

            recognition.onresult = function(event) {
                 console.log('You said: ', event.results[0][0].transcript);
                 // 결과를 출력
                 var resText = event.results[0][0].transcript;
                 korea.innerHTML = resText;

                //text to sppech
                 text_to_speech(resText);
                
             };

            recognition.onend = function(){
                 message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
                 button.disabled = false;
                 button.innerHTML = "Start STT";
                 isRecognizing = false;

            }
         }

        function stop(){
             recognition.stop();
             message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
             button.disabled = false;
             button.innerHTML = "Start STT";
             isRecognizing = false;
         }



        // Text to speech
         function text_to_speech(txt){
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

            msg.onend = function(e) {
                 if(isRecognizing == false){
                     recognition.start();   
                 }
                   console.log('Finished in ' + event.elapsedTime + ' seconds.');
             };
             window.speechSynthesis.speak(msg);
         }

    </script>
    
     <script>
      $(document).ready(function () {
        var stars = 800;
        var $stars = $(".stars");
        var r = 800;
        for (var i = 0; i < stars; i++) {
          var $star = $("<div/>").addClass("star");
          $stars.append($star);
        }
        $(".star").each(function () {
          var cur = $(this);
          var s = 0.2 + (Math.random() * 1);
          var curR = r + (Math.random() * 300);
          cur.css({
            transformOrigin: "0 0 " + curR + "px",
            transform: " translate3d(0,0,-" + curR + "px) rotateY(" + (Math.random() * 360) + "deg) rotateX(" + (Math.random() * -50) + "deg) scale(" + s + "," + s + ")"

          })
        })
      })
    </script>
	
	
	
</body>

</html>