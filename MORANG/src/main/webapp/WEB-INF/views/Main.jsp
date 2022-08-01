<%@page import="com.smhrd.domain.chatbotEmotion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>

<body>
  <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="Main.do"><img class="pic_morang" src="./resources/img/morang2.png"></a>
    </div>

    <ul class="navbar_menu">
       <div id="login" style="display:none">${loginMember.u_nick}</div>
      <li>
      <c:choose>
      <c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
      <a href="">${loginMember.u_id}님 환영합니다!!</a>
      		
      </c:when>
      <c:otherwise>
      	<a href="">${protectorMember.p_id}님 환영합니다!!</a>
      </c:otherwise>
      </c:choose>
      </li>
      <li><c:if test="${loginMember.u_id eq 'admin'}">
      <a href="joinList.do">회원목록보기</a>
      </c:if></li>
      <li><a href="joinGoUpdate.do">개인정보수정</a></li>
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
        <a href="Main.do" class="menu-item" id="nowpage">HOME</a>
        <a href="depressionTest.do" class="menu-item">우울증 자가진단</a>
        <c:if test='${protectorMember.p_id eq "soohyeonempty" }'>
        <a href="diary.do" class="menu-item">감정 일기장</a>
        </c:if>
        
      		
      
        
        <a href="shareNote.do" class="menu-item">공유수첩</a>
        <a href="boardList.do" class="menu-item">게시판</a>
      </nav>
    </nav>
    
    <section id="soohyeonchatbotarea" style="display: none;">
      <!-- <img src="resources/img/soohyeon.gif" alt="실패" width="400px" height="320px" id="soohyeonbot"> -->
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
        <div class="bottom_wrapper clearfix" style="display:flex">
          <div class="message_input_wrapper">
            <input class="message_input" placeholder="내용을 입력하세요." />
          </div>

         

			
            <img alt="" src="resources/img/mic.png" width="52px"height="52px" id="Sttsend_message">
         

        
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
                <div class='dateTitle'></div>
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

          <!-- <div id="modal" class="modal_Wrap">
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
          </div> -->
        </div>
        
        
        
        <div>
          <div class="flex_sh">
            <div class="yesterday-graph">
              <div class="card-header" style="text-align: center">긍정</div>
              <div class="pie-chart_pie-chart1"><span class="center">'${diaryyesterdayemotion.diary_pos}'%</span></div>

            </div>
            <div class="today-graph">
              <div class="card-header" style="text-align: center">부정</div>
              <div class="pie-chart_pie-chart2"><span class="center">'${diaryyesterdayemotion.diary_neg}'%</span></div>
            </div>
          </div>
          <div class="flex_sh">
            <div class="yesterday-graph">
              <div class="card-header" style="text-align: center">오늘의 대화</div>
              <canvas id="doughnut-chart" width="262px" height="320px"></canvas>

            </div>
            <div class="today-graph">
              <div class="card-header"style="text-align: center">어제와 오늘</div>
              <canvas id="radar-chart" width="262px" height="320px"></canvas>
            </div>
          </div>
          </div>
       

   </article>
   <article>
   <div>
            <canvas id="Week-Chart" width="1200%"height="300%"></canvas>
        </div>
   </article>
       </section>
      
    
  
    <div>
      <c:choose>
      <c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
      <img src="resources/img/chatbottest.gif" alt="실패" id="chatbot_close" width="10%" height="10%" >
      		
      </c:when>
      <c:otherwise>
      	<img src="resources/img/chatbottest.gif" alt="실패" id="chatbot_close" width="10%" height="10%" style="display:none">
      </c:otherwise>
      </c:choose>
      
    </div>
</div>



    <!--                        스크립트 해놓은 거야                                                            -->

    <!-- 그래프 차트 스크립트 -->
    <script>
       var ctx3 = document.getElementById('Week-Chart');
       
        let pos1day = Number('${diaryyesterdayemotion.diary_pos}')
         let neg1day = Number('${diaryyesterdayemotion.diary_neg}')
         
         let pos2day = Number('${diary2emotion.diary_pos}')
         let neg2day = Number('${diary2emotion.diary_neg}')
         
         let pos3day = Number('${diary3emotion.diary_pos}')
         let neg3day = Number('${diary3emotion.diary_neg}')
         
         let pos4day = Number('${diary4emotion.diary_pos}')
         let neg4day = Number('${diary4emotion.diary_neg}')
         
         let pos5day = Number('${diary5emotion.diary_pos}')
         let neg5day = Number('${diary5emotion.diary_neg}')
         
         let pos6day = Number('${diary6emotion.diary_pos}')
         let neg6day = Number('${diary6emotion.diary_neg}')
         
         let pos7day = Number('${diary7emotion.diary_pos}')
         let neg7day = Number('${diary7emotion.diary_neg}')
         
         
        	 
        
         const date = new Date();
		 const year = date.getFullYear();
		 const month = ('0' + (date.getMonth() + 1)).slice(-2);
		 const day1 = ('0' + (date.getDate()-1)).slice(-2);
		 const todaydate1 = year + '-' + month + '-' + day1;
		 
		 const day2 = ('0' + (date.getDate()-2)).slice(-2);
		 const todaydate2 = year + '-' + month + '-' + day2;
		 
		 const day3 = ('0' + (date.getDate()-3)).slice(-2);
		 const todaydate3 = year + '-' + month + '-' + day3;
		 
		 const day4 = ('0' + (date.getDate()-4)).slice(-2);
		 const todaydate4 = year + '-' + month + '-' + day4;
		 
		 const day5 = ('0' + (date.getDate()-5)).slice(-2);
		 const todaydate5 = year + '-' + month + '-' + day5;
		 
		 const day6 = ('0' + (date.getDate()-6)).slice(-2);
		 const todaydate6 = year + '-' + month + '-' + day6;
		 
		 const day7 = ('0' + (date.getDate()-7)).slice(-2);
		 const todaydate7 = year + '-' + month + '-' + day7;

		
         if (pos1day>0||neg1day>0){
             
       }
         else{
            pos1day=55;
            neg1day=45;
         }
        if (pos2day>0||neg2day>0){
          
        }
          else{
             pos2day=55;
             neg2day=45;
          }
        if (pos3day>0||neg3day>0){
          
        }
          else{
             pos3day=55;
             neg3day=45;
          }
        if (pos4day>0||neg4day>0){
          
        }
          else{
             pos4day=55;
             neg4day=45;
          }
        if (pos5day>0||neg5day>0){
          
        }
          else{
             pos5day=55;
             neg5day=45;
          }
        if (pos6day>0||neg6day>0){
          
        }
          else{
             pos6day=55;
             neg6day=45;
          }
        if (pos7day>0||neg7day>0){
           
         }
           else{
              pos7day=55;
              neg7day=45;
           }
        
      var config3 = {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: {
         labels: [ // Date Objects
            todaydate7,
            todaydate6,
            todaydate5,
            todaydate4,
            todaydate3,
            todaydate2,
            todaydate1
         ],
         datasets: [{
            label: 'pos',
            backgroundColor: 'rgba(75, 192, 192, 1)',
            borderColor: 'rgba(75, 192, 192, 1)',
            fill: false,
            data: [
               pos7day,
               pos6day,
               pos5day,
               pos4day,
               pos3day,
               pos2day,
               pos1day
            ],
         }, {
            label: 'neg',
            backgroundColor: 'rgba(255, 99, 132, 1)',
            borderColor: 'rgba(255, 99, 132, 1)',
            fill: false,
            data: [
               neg7day,
               neg6day,
               neg5day,
               neg4day,
               neg3day,
               neg2day,
               neg1day
            ],
         }]
      },
      options: {
         maintainAspectRatio: false,
         title: {
            text: 'Chart.js Time Scale'
         },
         scales: {
            yAxes: [{
               scaleLabel: {
                  display: true,
                  labelString: '긍 부정'
               }
            }]
         },
      }
   };
    
   //차트 그리기
   var myChart3 = new Chart(ctx3, config3);
    </script>

    <!-- 파이차트 스크립트 -->
    <script>
    let pos = Number('${diaryyesterdayemotion.diary_pos}')
     let neg = Number('${diaryyesterdayemotion.diary_neg}')
    
    
      $(window).ready(function () {
        draw(pos, '.pie-chart_pie-chart1', '#81F781');
        draw(neg, '.pie-chart_pie-chart2', '#8b22ff');
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
    
   <script>
   let fear2 = Number('${todayemotion.fear}');
   let surprise2 = Number('${todayemotion.surprise}');
   let angry2 = Number('${todayemotion.angry}');
   let sadness2 = Number('${todayemotion.sadness}');
   let neutral2 = Number('${todayemotion.neutral}');
   let happiness2 = Number('${todayemotion.happiness}');
   let disgust2 = Number('${todayemotion.disgust}');
   var ctx1 = document.getElementById('doughnut-chart')
   var config1 = {
      type: 'doughnut',
       data: {
         labels: ["공포", "놀람", "분노", "슬픔", "중립","행복","혐오"],
         datasets: [
           {
             label: "Population (millions)",
             backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850",'#81F781','#8b22ff'],
             data: [1,1,1,1,1,1,1]
           }
         ]
       },
       options: {
         title: {
           display: true,
           
         }
       }
   };
   
   var myChart1 = new Chart(ctx1, config1);
   
    console.log(happiness);
   
   if (happiness2 >0||fear2>0||surprise2>0||angry2>0||sadness2>0||neutral2>0||disgust2>0){
      
      //데이터셋 수 만큼 반복
      var dataset1 = config1.data.datasets;
      for(var i=0; i<dataset1.length; i++){
         console.log(dataset1);
       
         var data1 = dataset1[i].data;
         data1[0]=fear2;
         data1[1]=surprise2;
         data1[2]=angry2;
         data1[3]=sadness2;
         data1[4]=neutral2;
         data1[5]=happiness2;
         data1[6]=disgust;
      }
      
      myChart1.update();   //차트 업데이트
   }
</script>
<script type="text/javascript">
let fear3 = Number('${yesterdayemotion.fear}');
let surprise3 = Number('${yesterdayemotion.surprise}');
let angry3 = Number('${yesterdayemotion.angry}');
let sadness3 = Number('${yesterdayemotion.sadness}');
let neutral3 = Number('${yesterdayemotion.neutral}');
let happiness3 = Number('${yesterdayemotion.happiness}');
let disgust3 = Number('${yesterdayemotion.disgust}');


var ctx2 = document.getElementById('radar-chart')
 var config2 = {
    type: 'radar',
       data: {
       labels: ["공포", "놀람", "분노", "슬픔", "중립","행복","혐오"],
         datasets: [
           {
             label: "어제",
             fill: true,
             backgroundColor: "rgba(179,181,198,0.2)",
             borderColor: "rgba(179,181,198,1)",
             pointBorderColor: "#fff",
             pointBackgroundColor: "rgba(179,181,198,1)",
             data: [fear3,surprise3,angry3,sadness3,neutral3,happiness3,disgust3]
           }, {
             label: "오늘",
             fill: true,
             backgroundColor: "rgba(255,99,132,0.2)",
             borderColor: "rgba(255,99,132,1)",
             pointBorderColor: "#fff",
             pointBackgroundColor: "rgba(255,99,132,1)",
             pointBorderColor: "#fff",
             data: [5,5,5,5,5,5,5]
           }
         ]
       },
       options: {
         title: {
           display: true
         }
       }
   };

var myChart2 = new Chart(ctx2, config2);



if (happiness2 >0||fear2>0||surprise2>0||angry2>0||sadness2>0||neutral2>0||disgust2>0){
   
   //데이터셋 수 만큼 반복
   var dataset2 = config2.data.datasets;
   
      console.log(dataset2);
     
      var data2 = dataset2[1].data;
      data2[0]=fear2;
      data2[1]=surprise2;
      data2[2]=angry2;
      data2[3]=sadness2;
      data2[4]=neutral2;
      data2[5]=happiness2;
      data2[6]=disgust;
   
   
   myChart2.update();   //차트 업데이트
}



</script>


<script type="text/javascript">
   
   
   let dayday=0;
   let monthpos=0;
   let monthneg=0;
   
    setTimeout(function() {
       <c:forEach items='${Monthemotionlist}' var='item'>
         for (let i2 = 1; i2 <= 31; i2++) {
            dayday=$('#day20').text();
            if(i2==Number('${item.diary_date}')){
               monthpos=Number('${item.diary_pos}')
               monthneg=Number('${item.diary_neg}')
               if(monthpos>=monthneg){
                  $('#day'+i2).append('<br><img alt="" src="resources/img/sun2.png" width="150%" height="150%" class="seal">');
               }
               else{
                  $('#day'+i2).append('<br><img alt="" src="resources/img/usan2.png" width="150%" height="150%" class="seal">');
               }
            }
            else{}
         }
         </c:forEach>
     },100);
   
</script>



</body>

</html>