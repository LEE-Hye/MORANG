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
            <h2>글쓰기</h2>
            <div class="panel panel-default">
               <div class="panel-heading" style="background-color: #e4beb3;">자유롭게 글을 써보세요~</div>
               <div class="panel-body">

            <form class="form-horizontal" action="boardInsert.do" method="post">
               <div class="form-group">
                  <label class="control-label col-sm-2" for="title">제목:</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="title"
                        placeholder="글 제목을 적어주세요" name="c_title">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="u_id">작성자:</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="u_id"
                         readonly="readonly" value="${loginMember.u_id}" name="u_id">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="content">내용:</label>
                  <div class="col-sm-10">
                     <textarea name="c_content" id="content" rows="10" class="form-control"
                     placeholder="내용을 적어주세요"></textarea>
                  </div>
               </div>
               <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                           <input type="file" class="btn btn-default">사진첨부</button>
                        </div>
                     </div>
               <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                     <button type="submit" class="btn btn-danger">글쓰기</button>
                  </div>
               </div>
            </form>

         </div>
         <div class="panel-footer">morang</div>
      </div>
   </div>

</body>
</html> 