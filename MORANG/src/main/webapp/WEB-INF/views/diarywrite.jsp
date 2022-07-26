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

	<style>
		
	   button{
			padding: 8px;
			/*border-radius: 6px;*/
		}
		
	</style>

</head>
<body>
	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			 <div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<form class="form-horizontal" action="diarywrite.do" method="post" enctype="multipart/form-data"  onsubmit="checkNull()">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="Enter title" name="diary_title">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="title">음성인식</label>
						<div class="col-sm-10">
							<button type="button" id="speech" onclick="speech_to_text()">Start STT</button>
     						<button type="button" id="stop" onclick="stop()">Stop</button>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea name="diary_content" id="diary_test" rows="10"
								class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input name="u_id" class="form-control" id="writer" type="text" value="${loginMember.u_id}" readonly>
						</div>
					</div>
					<div class="form-group">
					
					<div class="weather">
					<label class="control-label col-sm-2" for="content">날씨:</label>
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
						 <input type="button" value="감정 확인" id="test">
						 
					</div>
					<div id="data1"></div>

     				 <div id="data2"></div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="filename1">사진:</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" name="filename1">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" id="test_Check">글작성</button>
						</div>
					</div>
				</form>
			</div>
			
		</div>
	
	
	<script type="text/javascript">
      $('#test').click(function() {
         var text = $('#diary_test').val()
         var postdata = {
            'msg' : text
         }

         $.ajax({
            type : 'POST',
            url : 'http://127.0.0.7:9999/sentiment',
            async : false,
            data : JSON.stringify(postdata),
            dataType : 'JSON',
            contentType : "application/json",
            success : function(data) {
               let pos = data.result2['pos'];
               let neg = data.result2['neg'];
               //        $('#morang').append(pos);
               //        $('#morang').append(neg);
               document.getElementById("data1").innerHTML = pos;
               document.getElementById("data2").innerHTML = neg;
				$('#pos').val(pos);
				$('#neg').val(neg);
            },

            error : function(request, status, error) {
               alert('ajax 통신 실패')
               alert(error);
            }
         });
      })
   </script>

<script type="text/javascript">
      $('#test_Check').click(function() {
         var text = $('#diary_test').val()
         var postdata = {
            'msg' : text
         }

         $.ajax({
            type : 'POST',
            url : 'http://127.0.0.7:9999/sentiment',
            async : false,
            data : JSON.stringify(postdata),
            dataType : 'JSON',
            contentType : "application/json",
            success : function(data) {
               let pos = data.result2['pos'];
               let neg = data.result2['neg'];

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
	
	
	
</body>

</html>