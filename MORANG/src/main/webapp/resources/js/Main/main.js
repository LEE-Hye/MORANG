let username=null;
let fear=0;
let surprise=0;
let angry=0;
let sadness=0;
let neutral=0;
let happiness=0;
let disgust=0;



        
         
        
 
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

 function stop(){
             recognition.stop();
             
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


(function () {
    var Message;
    Message = function (arg) {
        this.text = arg.text, this.message_side = arg.message_side;
        this.draw = function (_this) {
            return function () {
                var $message;
                $message = $($('.message_template').clone().html());
                $message.addClass(_this.message_side).find('.text').html(_this.text);
                $('.messages').append($message);
                return setTimeout(function () {
                    return $message.addClass('appeared');
                }, 0);
            };
        }(this);
        return this;
    };
    $(function () {
        var getMessageText, message_side, sendMessage;
        
        getMessageText = function () {
            var $message_input;
            $message_input = $('.message_input');
            return $message_input.val();
        };
        sendMessage = function (text,message_side) {
            var $messages, message;
            if (text.trim() === '') {
                return;
            }
            $('.message_input').val('');
            
            $messages = $('.messages');
            message_side = message_side
            message = new Message({
                text: text,
                message_side: message_side
            });
            message.draw();
            
            return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
        };
        $('.send_message').click(function () {
			  recognition.start();
             isRecognizing = true;

            recognition.onstart = function(){
                 console.log("음성인식이 시작 되었습니다. 이제 마이크에 무슨 말이든 하세요.")
                
                 
             }
            

            recognition.onspeechend = function(){
                 
                
             }

            recognition.onresult = function(event) {
                 console.log('You said: ', event.results[0][0].transcript);
                 // 결과를 출력
                 var resText = event.results[0][0].transcript;
              if(username==null){
                    console.log('error')
                    
                }
                else{
                    
                    let messageText = resText;
                    if (messageText.includes('안녕')) {
                        setTimeout(function () {
                            return sendMessage("안녕하세요. 저는 모랑 임산부 케어 봇입니다.", 'left');
                        }, 1000);
                    } else if (messageText.includes('반가워')) {
                        setTimeout(function () {
                            return sendMessage("저도 반갑습니다.✧⁺⸜(･ ᗜ ･ )⸝⁺✧ ", 'left');
                        }, 1000);
                    } else if (messageText.includes('고마워')) {
                        setTimeout(function () {
                            return sendMessage("천만에요. 더 물어보실 건 없나요?", 'left');
                        }, 1000);
                    } else if (messageText.includes('없어')) {
                        setTimeout(function () {
                            return sendMessage("그렇군요. 알겠습니다!", 'left');
                        }, 1000);
            
            
                    }
            
                    else if (messageText.includes('이름')) {
                        setTimeout(function () {
                            return sendMessage("저의 이름은 모랑입니다~~＞︿＜", 'left');
                        }, 1000);
            
            
                    }
                     else if (messageText.includes('닉네임')) {
                        setTimeout(function () {
                            return sendMessage(username+"입니다!! o(*￣▽￣*)o", 'left');
                        }, 1000);
            
            
                    }
                    else{
                    	let msg= resText
                        var postdata = {
                            'msg':msg
                        }
                        $.ajax({
                            type: 'POST',
                            url: 'http://222.102.104.182:8082/answer',
                            data: JSON.stringify(postdata),
                            dataType : 'JSON',
                            contentType: "application/json",
                            success: function(data){
                            	console.log(data.result2['msg']);
                            	console.log(data.result2['emotion']);
                            	
                            	switch (data.result2['emotion']) {
								  case '공포':
								    fear=fear+10;
								    break;
								  case '놀람':
								    surprise=surprise+10;
								    break;
								  case '분노':
								    angry = angry+10;
								    break;
								  case '슬픔':
								    sadness = sadness+10;
								    break;
								  case '중립':
								    neutral = neutral+10;
								    break;
								  case '행복':
								    happiness = happiness+10;
								    break;
								  case '혐오':
								    disgust = disgust+10;
								    break;
								  default:
								    alert( "어떤 값인지 파악이 되지 않습니다." );
								}
                            	console.log(happiness);
                                return sendMessage(data.result2['msg'],'left');
                            },
                            
                            error: function(request, status, error){
                                alert('ajax 통신 실패')
                                alert(error);
                            }
                        });

                    }
                    return sendMessage(resText,'right');
                }
              stop();

                //text to sppech
                 text_to_speech(resText);
             };

            recognition.onend = function(){
                 
                 isRecognizing = false;

            }
                
           
        });
        
        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
                if(username==null){
                    console.log('error')
                    
                }
                else{
                    
                    let messageText = getMessageText();
                    if (messageText.includes('안녕')) {
                        setTimeout(function () {
                            return sendMessage("안녕하세요. 저는 모랑 임산부 케어 봇입니다.", 'left');
                        }, 1000);
                    } else if (messageText.includes('반가워')) {
                        setTimeout(function () {
                            return sendMessage("저도 반갑습니다.✧⁺⸜(･ ᗜ ･ )⸝⁺✧ ", 'left');
                        }, 1000);
                    } else if (messageText.includes('고마워')) {
                        setTimeout(function () {
                            return sendMessage("천만에요. 더 물어보실 건 없나요?", 'left');
                        }, 1000);
                    } else if (messageText.includes('없어')) {
                        setTimeout(function () {
                            return sendMessage("그렇군요. 알겠습니다!", 'left');
                        }, 1000);
            
            
                    }
            
                    else if (messageText.includes('이름')) {
                        setTimeout(function () {
                            return sendMessage("저의 이름은 모랑입니다~~＞︿＜", 'left');
                        }, 1000);
            
            
                    }
                     else if (messageText.includes('닉네임')) {
                        setTimeout(function () {
                            return sendMessage(username+"입니다!! o(*￣▽￣*)o", 'left');
                        }, 1000);
            
            
                    }
                    else{
                    	let msg=getMessageText()
                        var postdata = {
                            'msg':msg
                        }
                        $.ajax({
                            type: 'POST',
                            url: 'http://222.102.104.182:8082/answer',
                            data: JSON.stringify(postdata),
                            dataType : 'JSON',
                            contentType: "application/json",
                            success: function(data){
                            	console.log(data.result2['msg']);
                            	console.log(data.result2['emotion']);
                            	
                            	switch (data.result2['emotion']) {
								  case '공포':
								    fear=fear+10;
								    break;
								  case '놀람':
								    surprise=surprise+10;
								    break;
								  case '분노':
								    angry = angry+10;
								    break;
								  case '슬픔':
								    sadness = sadness+10;
								    break;
								  case '중립':
								    neutral = neutral+10;
								    break;
								  case '행복':
								    happiness = happiness+10;
								    break;
								  case '혐오':
								    disgust = disgust+10;
								    break;
								  default:
								    alert( "어떤 값인지 파악이 되지 않습니다." );
								}
                            	console.log(happiness);
                                return sendMessage(data.result2['msg'],'left');
                            },
                            
                            error: function(request, status, error){
                                alert('ajax 통신 실패')
                                alert(error);
                            }
                        });

                    }
                    return sendMessage(getMessageText(),'right');
                }
                
            }
        });
        $(document).on("click", "#chatbot_close",function(){
        	username=$('#login').text();
            $('#soohyeonchatbotarea').css("display" ,"block");
            $('.content-main').css("display" ,"none");
            $('#chatbot_close').attr("id","chatbot_open");
            let k = $('.messages').text();
            console.log(k);
            if(k==""){
                sendMessage('우산팀 데모에 오신걸 환영합니다.','left');
                setTimeout(function () {
                    return sendMessage("반갑습니다." + username + "님.✧⁺⸜(･ ᗜ ･ )⸝⁺✧  ", 'left');
                }, 1000);
                setTimeout(function () {
                    return sendMessage("저는 임산부 감정케어봇 모랑입니다.", 'left');
                }, 2000);
                setTimeout(function () {
                    return sendMessage("오늘 기분은 어떠신가요??", 'left');
                }, 3000);
            }
            
                
          });
        
          $(document).on("click", "#chatbot_open",function(){
          	console.log(happiness);
          	 $.ajax({
 				url :'MainResult.do',
 				type : 'post',
 				data : {
 					'fear':fear,
 					'surprise':surprise,
 					'angry':angry,
 					'sadness':sadness,
 					'neutral':neutral,
 					'happiness':happiness,
 					'disgust':disgust
 				},
 				success:function(res){
 					
 					if(res==0){
 						console.log(res);
 						
 						location.replace('Main.do') 
 					}
 					else if(res==1){
 						console.log('실패');
 					}
 					
 					
 					
 				},
 				error:function(e){alert('error!')}
 			});
            $('#soohyeonchatbotarea').css("display" ,"none");
            $('.content-main').css("display" ,"block");
            $('#chatbot_open').attr("id","chatbot_close")
            
           
            
          });
        
        
    });
    
}.call(this));

