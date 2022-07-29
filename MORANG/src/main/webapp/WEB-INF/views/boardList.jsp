<%@page import="com.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@ 
page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/noticeBoard.css">
    <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
    <title>게시판</title>
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
            <a href="Main.do">MoRang.</a>
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
                <c:if test='${protectorMember.p_id eq "soohyeonempty" }'>
        		<a href="diary.do" class="menu-item">감정 일기장</a>
        		</c:if>
                <a href="shareNote.do" class="menu-item">공유수첩</a>
                <a href="boardList.do" class="menu-item" id="nowpage">게시판</a>
            </nav>
        </nav>

        <div class="notice-board">
            <div class="notice-board-body">
                <% List<Board> list = (List<Board>) request.getAttribute("list");
                        %>
                        <table class="notice-board-list">
                            <tr>
                                <td>글번호</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>날짜</td>
                                <td>조회수</td>
                            </tr>
                            <%for (Board board : list) {%>
                                <tr>
                                    <td>
                                        <%=board.getC_seq()%>
                                    </td>

                                    <td><a href="/web/boardContent.do?c_seq=<%=board.getC_seq()%>">
                                            <%=board.getC_title()%>
                                        </a></td>
                                    <td>
                                        <%=board.getU_id()%>
                                    </td>
                                    <td>
                                        <%=board.getC_date()%>
                                    </td>
                                    <td>
                                        <%=board.getC_likes()%>
                                    </td>
                                </tr>
                                <% } %>

                        </table>
                        <br>
                        <button onclick="location.href='boardInsert.do'" class="notice-board-btn">게시글 작성</button>
            </div>
            
        </div>
        
</body>

</html>