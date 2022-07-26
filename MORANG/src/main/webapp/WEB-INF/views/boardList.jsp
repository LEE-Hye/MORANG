<%@page import="com.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@ 
page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
   @font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
font-family: 'BMJUA';
}
   </style>
</head>
<body>
    <nav class="navbar">
    <div class="navbar_logo">
      <i class="fa-thin fa-hands-holding-child"></i>
      <a href="메인 페이지.html">MoRang.</a>
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
                <form action="Main.do"><a href="Main.do" class="menu-item">HOME</a></form>
        <a href="산전 우울증.html" class="menu-item">우울증 자가진단</a>
        <a href="감정일기장.html" class="menu-item">감정 일기장</a>
        <a href="공유수첩.html" class="menu-item">공유수첩</a>
        <form action="boardList.do"><a href="boardList.do" class="menu-item">게시판</a></form>
            </nav>
        </nav>
        <div class="container">
            <h2 style=color:red;">임산부 자유게시판</h2>
            <div class="panel panel-default">
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
                    class="btn btn-sm btn-danger" style="width: 100px; height: 50px;">작성</button>
                </div>
                <div class="panel+footer" style="background-color:Green; color:yellow;">스마트인재개발원 최종프로젝트 팀 우산</div>
            </div>
        </div>
    </div>
</body>

</html>
</body>
</html> 