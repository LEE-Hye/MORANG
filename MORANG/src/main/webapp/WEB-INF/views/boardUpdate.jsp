<%@page import="com.smhrd.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
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
<body>

   <div class="container">
      <h2>자유게시판 글</h2>
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color:#e4beb3; color:aliceblue;">글 수정하기</div>
         <div class="panel-body">

            <form class="form-horizontal" action="boardUpdate.do" method="post">

  	         <input type="hidden" name="c_seq" value="${board.c_seq}"> 

               <div class="form-group">
                  <label class="control-label col-sm-2" for="title">제목:</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="title"
                        value="${board.c_title}" name="c_title">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="id">작성자:</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="id"
                        value="${board.u_id}" name="u_id" readonly="readonly">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="content">내용:</label>
                  <div class="col-sm-10">
                     <textarea name="c_content" id="content" rows="10" class="form-control">${board.c_content }</textarea>

                  </div>
               </div>
               <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                     <button type="submit" class="btn btn-danger">수정하기</button>
                  </div>
               </div>
            </form>

         </div>
         <div class="panel-footer">모랑모랑</div>
      </div>
   </div>

</body>
</html> 