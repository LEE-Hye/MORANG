<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    <style>
    th, td{
	    font-size:25px
   		width : 30%
    }
    </style>
</head>

<body>
    <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="Main.do"><img class="pic_morang" src="./resources/img/morang2.png"></a>
    </div>

    <ul class="navbar_menu">
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
        <a href="depressionTest.do" class="menu-item" id="nowpage">우울증 자가진단</a>
        <c:if test='${protectorMember.p_id eq "soohyeonempty" }'>
        <a href="diary.do" class="menu-item">감정 일기장</a>
        </c:if>
        <a href="shareNote.do" class="menu-item">공유수첩</a>
        <a href="boardList.do" class="menu-item">게시판</a>
      </nav>
    </nav>
        <main class="content">
            <div class="channel-introduce">
                <img src='resources/img/6460.jpg' width="700px" height="400px" />
                <h1 class=test-title>
                    자가진단 결과
                    <br>
                    자가진단 점수가 10점 이상인 경우 상담받을 것을 권유드립니다.
                    <div class="score-result">자가진단 점수 총합은?</div>
                </h1>
               <table class="score-length" align="center">
                    <th>점수</th>
                    <th>상태</th>
                    <th>온라인 상담 사이트</th>
                    <th>전화상담</th>
                    <tr>
                        <td>0~8점</td>
                        <td>정상</td>
                        <td>[마음온라인]<br><a href="https://www.on-maum.com/">https://www.on-maum.com/</a></td>
                        <td>[허그맘허그인]<br>1600-6226</td>
                    </tr>
                    <tr>
                        <td>9~11점</td>
                        <td>경도 우울증</td>
                        <td>[밝은희망]<br><a href="http://brightdepression.com/">http://brightdepression.com/</a></td>
                        <td>[자살예방상담전화]<br>1393</td>
                    </tr>
                    <tr>
                        <td>12~13점</td>
                        <td>주요 우울증</td>
                        <td>[MiNDCAFE]<br><a href="http://www.mindcafe.co.kr/">http://www.mindcafe.co.kr/</a></td>
                        <td>[한국생명의전화]<br>1588-9191</td>
                    </tr>
                    <tr>
                        <td>14점 이상</td>
                        <td>고도 우울증</td>
                        <td>[CHEEU]<br><a href="https://www.cheeu.co.kr/home">https://www.cheeu.co.kr/home</a></td>
                        <td>[정신건강복지센터]<br>1577-0199</td>
                    </tr>
                    
                    <% request.setCharacterEncoding("UTF-8");
				int sum = 0;
				int fav = 0;
			for(int i=1; i<=10; i++){
			
				
			fav = Integer.parseInt(request.getParameter("fav"+i));
			
			sum += fav;
			}
			
			out.print("<h1 style='color: red;'>"+sum+"점"+"</h1>");
			
			%>
                </table>
            </div>
        </main>
    </div>
        
        
        
        
      
		







        <!--     <script>
                if (sum >= 0 && sum <= 8) {
                    document.write('귀하의 점수는' + total_sum + '점으로 정상입니다.')
                } else if (sum >= 9 && sum <= 11) {
                    document.write('귀하의 점수는' + total_sum + '점으로 경도우울증입니다.')
                } else if (sum >= 12 && sum <= 13) {
                    document.write('귀하의 점수는' + total_sum + '점으로 주요우울증입니다.')
                } else {
                    document.write('귀하의 점수는' + total_sum + '점으로 고도의우울증입니다.')
                }
            </script>  -->
</body>

</html>