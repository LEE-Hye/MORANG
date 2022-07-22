<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			 <div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<form class="form-horizontal" action="diarywrite.do" method="post" onsubmit="checkNull()">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="Enter title" name="diary_title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea name="diary_content" id="diary_test" rows="10"
								class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input name="u_id" class="form-control" id="writer" type="text" value="${loginMember.u_id}" readonly>
						</div>
					</div>
					<div class="form-group">
					
					<div class="weather">
					<label class="control-label col-sm-2" for="content">날씨:</label>
						<div>
							<ul class="icon">
								<li><i class="fa-solid fa-sun"></i></li><input type="radio" value="sun" name="weather">
								<li><i class="fa-solid fa-cloud"></i></li><input type="radio" value="cloud" name="weather">
								<li><i class="fa-solid fa-cloud-showers-heavy"></i></li><input type="radio" value="rain" name="weather">
								<li><i class="fa-solid fa-snowflake"></i></li><input type="radio" value="snow" name="weather">
								
							</ul>
						</div>
						<input type="hidden" id="pos" name="pos">
						<input type="hidden" id="neg" name="neg">
						 <input type="button" value="감정 확인" id="test">
						 
					</div>
					<div id="data1"></div>

     				 <div id="data2"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" id="test_Check">글작성</button>
						</div>
					</div>
				</form>
			</div>
			
		</div>
	
	
	<script type="text/javascript">
      $('#test').click(function() {
         var text = $('#diary_test').val()
         var postdata = {
            'msg' : text
         }

         $.ajax({
            type : 'POST',
            url : 'http://127.0.0.7:9999/sentiment',
            async : false,
            data : JSON.stringify(postdata),
            dataType : 'JSON',
            contentType : "application/json",
            success : function(data) {
               let pos = data.result2['pos'];
               let neg = data.result2['neg'];
               //        $('#morang').append(pos);
               //        $('#morang').append(neg);
               document.getElementById("data1").innerHTML = pos;
               document.getElementById("data2").innerHTML = neg;
				$('#pos').val(pos);
				$('#neg').val(neg);
            },

            error : function(request, status, error) {
               alert('ajax 통신 실패')
               alert(error);
            }
         });
      })
   </script>

<script type="text/javascript">
      $('#test_Check').click(function() {
         var text = $('#diary_test').val()
         var postdata = {
            'msg' : text
         }

         $.ajax({
            type : 'POST',
            url : 'http://127.0.0.7:9999/sentiment',
            async : false,
            data : JSON.stringify(postdata),
            dataType : 'JSON',
            contentType : "application/json",
            success : function(data) {
               let pos = data.result2['pos'];
               let neg = data.result2['neg'];

               //location.href = "diarywriteCon.do/" + pos + "/" + neg
            },

            error : function(request, status, error) {
               alert('ajax 통신 실패')
               alert(error);
            }
         });
      })
   </script>
	
	
	
	
</body>

</html>