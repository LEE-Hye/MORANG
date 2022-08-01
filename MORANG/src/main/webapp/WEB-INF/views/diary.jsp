<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<style type="text/css">
	
	.prev{
		border: 2px solid #e4beb3;
    background-color: white;
    color: #e4beb3;
    padding: 10px;
    border-radius: 10px;
    margin-left:8%;
    margin-right: 5%;
    font-size: 20px;
	}
	.next{
	border: 2px solid #e4beb3;
    background-color: white;
    color: #e4beb3;
    padding: 10px;
    border-radius: 10px;
    margin-left: 5%;
    font-size: 20px;
   
	}
	
	.nowpagenum{
	border: 1px solid #e4beb3;
    background-color: #e4beb3;
    color: white;
	padding: 10px;
    border-radius: 10px;
	}
	.prev:hover {
    color: white;
    background-color: #e4beb3;
	}
	.next:hover {
    color: white;
    background-color: #e4beb3;
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
        <a href="depressionTest.do" class="menu-item">우울증 자가진단</a>
        <a href="diary.do" class="menu-item" id="nowpage">감정 일기장</a>
        <a href="shareNote.do" class="menu-item">공유수첩</a>
        <a href="boardList.do" class="menu-item">게시판</a>
      </nav>
    </nav>


    <div class="bookcover">
      <div class="bookcover-body">
        <% List<diary> list = (List<diary>) request.getAttribute("list");
        	int num=0;
        %>
            <table class="bookcover-list">
              <tr>
                <td class="bookcover-head">글번호</td>
                <td class="bookcover-head">제목</td>
                <td class="bookcover-head">아이디</td>
                <td class="bookcover-head">날씨</td>
                <td class="bookcover-head">날짜</td>
                <td class="bookcover-head">감정</td>
               

              </tr>
              <% for (diary diary : list) { %>
                <tr id="page<%=num%>">
                  <td>
                    <%=diary.getDiary_seq()%>
                  </td>
                  <td><a href="/web/diaryContent.do?diary_seq=<%=diary.getDiary_seq()%>"></a>
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
                                        긍정 : <%=diary.getDiary_pos()%>%
                    <br>                    
                                        부정 : <%=diary.getDiary_neg()%>%
                  </td>
                   
                </tr>
                <%
              num++;  
              } %>
            </table>
            <br>
               <button onclick="location.href='diarywrite.do'"class="modal-diary" style="width: 100px; height: 50px;">일기작성</button>  
            
            <br><br>  
            <div class="pageNumarea">
            <button class="prev" style="width: 100px; height: 50px;">&lt;</button>            
            <button class="nowpagenum" style="width: 100px; height: 50px;">1</button>     
            <button class="modal-diary" style="width: 100px; height: 50px;">2</button>     
            <button class="modal-diary" style="width: 100px; height: 50px;">3</button>
            <button class="modal-diary" style="width: 100px; height: 50px;">4</button>
            <button class="modal-diary" style="width: 100px; height: 50px;">5</button>
            <button class="modal-diary" style="width: 100px; height: 50px;">6</button>
            <button class="next" style="width: 100px; height: 50px;">&gt;</button>   
            </div>   
      </div>
	</div>
</div>
    <script type="text/javascript">
    
    <%
    for(int i=6;i<list.size();i++){%>
    $('#page<%=i%>').css('display', 'none')	
    <%}
    %>
    
    $(document).on('click','.next',function(){
        $('.nowpagenum').next(0).addClass('nowpagenum');
        $('.nowpagenum').prev().removeClass('nowpagenum');
        $('.nowpagenum').prev().addClass('modal-diary');
        
        let number = $('.nowpagenum').text();
        if(number==2){
        	 <%
        	    for(int i=0;i<list.size();i++){%>
        	    $('#page<%=i%>').css('display', 'none')	
        	    <%}
        	    %>
        	    <%
        	    for(int i=6;i<12;i++){%>
        	    $('#page<%=i%>').css('display', 'table-row')	
        	    <%}
        	    %>
        }
        if(number==3){
       	 <%
       	    for(int i=0;i<list.size();i++){%>
       	    $('#page<%=i%>').css('display', 'none')	
       	    <%}
       	    %>
       	    <%
       	    for(int i=12;i<18;i++){%>
       	    $('#page<%=i%>').css('display', 'table-row')	
       	    <%}
       	    %>
       }
        
        if(number==4){
       	 <%
       	    for(int i=0;i<list.size();i++){%>
       	    $('#page<%=i%>').css('display', 'none')	
       	    <%}
       	    %>
       	    <%
       	    for(int i=18;i<24;i++){%>
       	    $('#page<%=i%>').css('display', 'table-row')	
       	    <%}
       	    %>
       }
        if(number==5){
          	 <%
          	    for(int i=0;i<list.size();i++){%>
          	    $('#page<%=i%>').css('display', 'none')	
          	    <%}
          	    %>
          	    <%
          	    for(int i=24;i<30;i++){%>
          	    $('#page<%=i%>').css('display', 'table-row')	
          	    <%}
          	    %>
          }
        if(number==6){
          	 <%
          	    for(int i=0;i<list.size();i++){%>
          	    $('#page<%=i%>').css('display', 'none')	
          	    <%}
          	    %>
          	    <%
          	    for(int i=30;i<list.size();i++){%>
          	    $('#page<%=i%>').css('display', 'table-row')	
          	    <%}
          	    %>
          }
    })
    
   
    
    </script>
    <script type="text/javascript">
    $(document).on('click','.prev',function(){
        $('.nowpagenum').prev().addClass('nowpagenum');
        $('.nowpagenum').next().removeClass('nowpagenum');
        $('.nowpagenum').next().addClass('modal-diary');
        
        let number = $('.nowpagenum').text();
        
        
        if(number==1){
       	 <%
       	    for(int i=0;i<list.size();i++){%>
       	    $('#page<%=i%>').css('display', 'none')	
       	    <%}
       	    %>
       	    <%
       	    for(int i=0;i<6;i++){%>
       	    $('#page<%=i%>').css('display', 'table-row')	
       	    <%}
       	    %>
       }
        if(number==2){
        	 <%
        	    for(int i=0;i<list.size();i++){%>
        	    $('#page<%=i%>').css('display', 'none')	
        	    <%}
        	    %>
        	    <%
        	    for(int i=6;i<12;i++){%>
        	    $('#page<%=i%>').css('display', 'table-row')	
        	    <%}
        	    %>
        }
        if(number==3){
       	 <%
       	    for(int i=0;i<list.size();i++){%>
       	    $('#page<%=i%>').css('display', 'none')	
       	    <%}
       	    %>
       	    <%
       	    for(int i=12;i<18;i++){%>
       	    $('#page<%=i%>').css('display', 'table-row')	
       	    <%}
       	    %>
       }
        
        if(number==4){
       	 <%
       	    for(int i=0;i<list.size();i++){%>
       	    $('#page<%=i%>').css('display', 'none')	
       	    <%}
       	    %>
       	    <%
       	    for(int i=18;i<24;i++){%>
       	    $('#page<%=i%>').css('display', 'table-row')	
       	    <%}
       	    %>
       }
        if(number==5){
          	 <%
          	    for(int i=0;i<list.size();i++){%>
          	    $('#page<%=i%>').css('display', 'none')	
          	    <%}
          	    %>
          	    <%
          	    for(int i=24;i<30;i++){%>
          	    $('#page<%=i%>').css('display', 'table-row')	
          	    <%}
          	    %>
          }
        if(number==6){
          	 <%
          	    for(int i=0;i<list.size();i++){%>
          	    $('#page<%=i%>').css('display', 'none')	
          	    <%}
          	    %>
          	    <%
          	    for(int i=30;i<list.size();i++){%>
          	    $('#page<%=i%>').css('display', 'table-row')	
          	    <%}
          	    %>
          }
    })
    
    </script>

   
</body>

</html>