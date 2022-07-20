let username=null;
let fear=0;
let surprise=0;
let angry=0;
let sadness=0;
let neutral=0;
let happiness=0;
let disgust=0;

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
        $('.send_message').click(function (e) {
            
            return sendMessage(getMessageText(),'right');
        });
        function setUserName(nickname) {
            username=nickname;
            if (username != null && username.replace(" ", "" !== "")) {
                setTimeout(function () {
                    return sendMessage("반갑습니다." + username + "님. 닉네임이 설정되었습니다.", 'left');
                }, 1000);
                setTimeout(function () {
                    return sendMessage("저는 임산부 감정케어봇 모랑입니다.", 'left');
                }, 2000);
                setTimeout(function () {
                    return sendMessage("오늘 기분은 어떠신가요??", 'left');
                }, 3000);
                console.log(username)
                return username;
        
            } else {
                setTimeout(function () {
                    return sendMessage("올바른 닉네임을 이용해주세요.", 'left');
                }, 1000);
        
                return null;
                }
            }
        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
                if(username==null){
                    console.log(username)
                    setUserName(getMessageText())
                    return sendMessage(getMessageText(),'right');
                }
                else{
                    
                    let messageText = getMessageText();
                    if (messageText.includes('안녕')) {
                        setTimeout(function () {
                            return sendMessage("안녕하세요. 저는 모랑 임산부 케어 봇입니다.", 'left');
                        }, 1000);
                    } else if (messageText.includes('반가워')) {
                        setTimeout(function () {
                            return sendMessage("안녕하세요. 저는 모랑 임산부 케어 봇입니다", 'left');
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
                            	if(emotion.equals("공포")){
                            	}
                            	else if(emotion.equals("공포")){
                            		
                            	}
                            	else if(emotion.equals("놀람")){
                            	}
                            	else if(emotion.equals("분노")){
                            	}
                            	else if(emotion.equals("슬픔")){
                            	}
                            	else if(emotion.equals("중립")){
                            	}
                            	else if(emotion.equals("행복")){
                            	}
                            	else if(emotion.equals("혐오")){
                            	}
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
            $('#soohyeonchatbotarea').css("display" ,"block");
            $('.content-main').css("display" ,"none");
            $('#chatbot_close').attr("id","chatbot_open");
            let k = $('.messages').text();
            console.log(k);
            if(k==""){
                sendMessage('우산팀 데모에 오신걸 환영합니다.','left');
                setTimeout(function () {
                    return sendMessage('사용할 닉네임을 알려주세요.','left');
                }, 1000);
            }
            
                
          });
        
          $(document).on("click", "#chatbot_open",function(){
            $('#soohyeonchatbotarea').css("display" ,"none");
            $('.content-main').css("display" ,"block");
            $('#chatbot_open').attr("id","chatbot_close")
          });
        
        
    });
    
}.call(this));

