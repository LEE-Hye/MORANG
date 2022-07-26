<%@page import="com.smhrd.domain.Board"%>
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
          <td> ${ fn:replace(board.c_file, newLine, "<br>" ) } </td>
          <%-- fn:replace(대상 문자열(불러오는 텍스트값), 바꿀 문자열, 바꾼뒤 문자열) --%>
          <%-- \n 을 replace 하고 싶다면, scope에서 문자열로써 담아뒀다가 꺼내서 써야됨 --%>
          <%-- "el공부 <br> 잘 되나 <br> 확인해볼게용" --%>
       </tr>
       <tr>
          <td> 작성일 : </td>
          <td> ${ fn:split( board.c_date, " ")[0] }</td>
          <!-- fn:split("대상 문자열", "구분자")  -->
          <%-- ["2022-06-21", "17:16:33"] --%>
       </tr>

       	<tr>
       		<td colspan="2" align="center">
       			<button onClick ="goUpdate(${board.c_seq})" class="btn btn-sm btn-info">수정</button>
       			<button onClick ="goDelete(${board.c_seq})" class="btn btn-sm btn-warning">삭제</button>
       			<button onClick ="goList()" class="btn btn-sm btn-success">목록</button>
       		</td>
      	</tr>
    </table>
    </div>


<!-- Comments Form -->
<h3>현재 로그인한 아이디 : ${loginMember.u_id}</h3>
	<div class="card my-4">
		<h5 class="card-header">댓글 달기 ...</h5>
		<div class="card-body">
			<form name="comment-form" action="commentInsert.do" method="post" autocomplete="off">
				<div class="form-group">
					<input type="hidden" name="cmt_seq" th:value="*{cmt_seq}" />
					<textarea name="cmt_content" class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">댓글 등록</button>
			</form>
		</div>
	</div>
      <div> 댓글 리스트  : </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>