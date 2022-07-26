<%@page import="com.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@ 
page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/Main/style.css">
    <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
    <title>자가진단</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="resources/css/calendar.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- 차트 js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->
	<style>
    th, td{
	    font-size:25px
    }
    .btn-3{
        border: 1px solid rgb(240, 129, 129);
        background-color: rgba(0, 0, 0, 0);
        color: rgb(240, 129, 129);;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 10px;
       }
       .btn-3:hover{
        color: white;
        background-color: rgb(240, 129, 129);
       }
    </style>
</head>
<body>
   <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="Main.do">MoRang.</a>
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
    
        <div class="container">
            
            <div class="panel panel-default" style="margin-left: 30px; margin-top: 30px;">
            <h1 style="color: rgb(139, 42, 42);">임산부 자유게시판</h1>
                <div class="panel-heading" style="font-size: 20px ; background-color: #e4beb3;">자유롭게 글을 써보아요^^</div>
                <div class="panel-body">
                    
                    
                    <%
                        // request 영역에 저장된 list 꺼내오기
                    List<Board> list = (List<Board>) request.getAttribute("list");
                    %>
                    <table class="table table-bordered table-hover">
                        <tr style="background-color:#e4beb3; color:aliceblue;">
                            <td>글번호</td>
                            <td>제목</td>
                            <td>작성자</td>
                            <td>날짜</td>
                            <td>조회수</td>
                        </tr>
                        <%for (Board board : list) {%>
                        <tr>
                            <td><%=board.getC_seq()%></td>
                            
                            <td><a href = "/web/boardContent.do/<%=board.getC_seq()%>">
                            <%=board.getC_title()%></a></td>
                            <td><%=board.getU_id()%></td>
                            <td><%=board.getC_date()%></td>
                            <td><%=board.getC_likes()%></td>
                        </tr>
                        <% } %>

                    </table>
                    <button onclick="location.href='boardInsert.do'"
                    class="btn-3" style="width: 100px; height: 50px; font-size:20px">작성</button>
                </div>
                <div class="panel+footer" style="background-color:#e4beb3; color:white; font-size:30px">스마트인재개발원 최종프로젝트 팀 우산</div>
            </div>
        </div>
    </div>
</body>

</html>
</body>
</html> 