<%@page import="com.smhrd.domain.Board"%>
<%@page import="com.smhrd.domain.comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>morang</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
	element.style {
    background-color: gray;
    padding-left: 10px;
}
</style>
  	<script type="text/javascript">
  		function goList() {
			// boardList 페이지로 이동
			// PathVariable을 사용중인 페이지에서는 /ContextPath/를 붙이자.
			// / == http://localhost:8083/
  			location.href = '/web/boardList.do';
		}
  		
  		function goDelete(c_seq) {
  			// controller가 가진 boardDelete.do 호출
  			location.href = '/web/boardDelete.do?c_seq=' + c_seq;
		}
  		
  		function goUpdate(c_seq) {
  			
  			location.href = '/web/boardGoUpdate.do?c_seq=' + c_seq;
		}
  		function goCommentDelete(cmt_seq) {
  			// controller가 가진 boardDelete.do 호출
  			location.href = '/web/commentDelete.do?cmt_seq=' + cmt_seq;
		}
  	</script>
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

<div class="container">
  <h2>임산부 자유게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading" style="background-color:#e4beb3; color:aliceblue;">자유글</div>
    <div class="panel-body">

    <table class="table table-hover">
       <tr>
          <td> 제목 : </td>
          <td> ${ board.c_title } </td>
       </tr>
       <tr>
          <td> 작성자 : </td>
          <td>${ board.u_id } </td>
       </tr>
       <tr>
          <td> 내용 : </td>
          <% pageContext.setAttribute("newLine", "\n"); %>
          <td> ${ fn:replace(board.c_content, newLine, "<br>" ) } </td>
          <% pageContext.setAttribute("newLine", "\n"); %>
          <td><img src="${board.c_file}"> </td>
       </tr>
       <tr>
          <td> 작성일 : </td>
          <td> ${ fn:split( board.c_date, " ")[0] }</td>
       </tr>

       	<tr>
       		<td colspan="2" align="center">
       		<c:choose>
			<c:when test='${protectorMember.p_id eq "soohyeonempty" }'>
				<c:if test='${loginMember.u_id eq board.u_id}'>
					<button onClick ="goUpdate(${board.c_seq})" class="btn btn-sm btn-info">수정</button>
       				<button onClick ="goDelete(${board.c_seq})" class="btn btn-sm btn-warning">삭제</button>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test='${protectorMember.u_id eq board.u_id}'>
					<button onClick ="goUpdate(${board.c_seq})" class="btn btn-sm btn-info">수정</button>
       				<button onClick ="goDelete(${board.c_seq})" class="btn btn-sm btn-warning">삭제</button>
				</c:if>
			</c:otherwise>
			</c:choose>
       			
       			<button onClick ="goList()" class="btn btn-sm btn-success">목록</button>
       		</td>
      	</tr>
    </table>
    </div>


<!-- Comments Form -->
	<form action="/web/commentInsert.do" method="post" style="margin-left: 30px; margin-bottom:30px">
				<input type="hidden" value="${board.c_seq}" name="c_seq">
			ID : <input class="form-control" type="hidden" value="${loginMember.u_id}" name="u_id">
			댓글 작성 :	<input class="form-control" type="text" name="cmt_content" placeholder="댓글을 작성해주세요">
			<input class="btn btn-warning btn-sm" type="submit" value="댓글 작성">
	
      
       </form>
       <div> <span style="font-size:30px;">전체 댓글</span>
       <hr>
  		<c:forEach var="cmt_comment" items="${commentlist}">
  		<table>
					<tr>
						<td width="500px" style="font-size:20px;"> 아이디 : ${cmt_comment.u_id}</td></tr>
						<tr><td width="100px" style="background-color:rgb(207, 207, 207);"><span style="margin-left:10px">댓글 : ${cmt_comment.cmt_content}</span></td></tr>
						<tr>
						<td width="200px" style="color: gray;">${cmt_comment.cmt_date}</td>
						

						<c:if test="${cmt_comment.u_id eq loginMember.u_id}">
						<td><a  onClick ="goCommentDelete(${cmt_comment.cmt_seq})">삭제</a></td>
						
						</c:if>
						
						</tr>
						
					
		</table>
		<br>
		</c:forEach>
		
       </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>