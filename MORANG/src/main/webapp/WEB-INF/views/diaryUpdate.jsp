<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.diary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 템플릿만 저장하는 용도 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/diarywrite.css">
<script src="https://kit.fontawesome.com/3e55fa4950.js"
	crossorigin="anonymous"></script>
<title>diary content</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 자바 스크립트 -->
</head>
<body>


	<div class="stars"></div>

	<div class="write_Content">
		<form class="form-horizontal" action="diaryUpdate.do" method="post">
				<div class="form-group">
					<div class="headline">제목 :</div>
					<div class="col-sm-10">
		
							<input type="text" class="form-control" id="diary_title"
								value="${diary.diary_title }" name="diary_title">
						
					</div>
				</div>

				<div class="form-group">
					<div class="headline">작성자 :</div>
					<div class="col-sm-10">
						<div>
							<input name="u_id" class="form-control" id="writer" type="text"
								value=" ${diary.u_id}" name="u_id" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="headline">내용 :</div>
					<div class="col-sm-10">
						<div>
							<textarea name="diary_content" id="diary_test" rows="10"
								class="form-control">${diary.diary_content }</textarea>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="headline">작성일 :</div>
					<div class="col-sm-10">
						<div>${fn:split(diary.diary_date, " ")[0] }</div>
					</div>
				</div>

				<div class="form-group">
					<div class="headline">날씨 :</div>
					<div class="col-sm-10">
						<div>
							<ul class="icon">
								<li><i class="fa-solid fa-sun"></i></li>
								<input type="radio" value="sun" name="weather">
								<li><i class="fa-solid fa-cloud"></i></li>
								<input type="radio" value="cloud" name="weather">
								<li><i class="fa-solid fa-cloud-showers-heavy"></i></li>
								<input type="radio" value="rain" name="weather">
								<li><i class="fa-solid fa-snowflake"></i></li>
								<input type="radio" value="snow" name="weather">

							</ul>
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class="headline">감정결과 :</div>
					<div class="col-sm-10">
						<input type="hidden" id="pos" name="pos"> <input
							type="hidden" id="neg" name="neg"> 
						<input type="button"
							value="감정 확인" id="test">
					</div>

				</div>

				<div class="form-group">
					<div class="col-sm-10">
						<button type="submit" class="modal-diary" id="test_Check">수정완료</button>
				</div>
				</div>
		</form>

			
				
				
			</div>
			
		

<script>
                                            $(document).ready(function () {
                                                var stars = 800;
                                                var $stars = $(".stars");
                                                var r = 800;
                                                for (var i = 0; i < stars; i++) {
                                                    var $star = $("<div/>").addClass("star");
                                                    $stars.append($star);
                                                }
                                                $(".star").each(function () {
                                                    var cur = $(this);
                                                    var s = 0.2 + (Math.random() * 1);
                                                    var curR = r + (Math.random() * 300);
                                                    cur.css({
                                                        transformOrigin: "0 0 " + curR + "px",
                                                        transform: " translate3d(0,0,-" + curR + "px) rotateY(" + (Math.random() * 360) + "deg) rotateX(" + (Math.random() * -50) + "deg) scale(" + s + "," + s + ")"

                                                    })
                                                })
                                            })
                                        </script>









	<script type="text/javascript">
      $('#test').click(function() {
         var text = $('#diary_test').val()
         var postdata = {
            'msg' : text
         }

         $.ajax({
            type : 'POST',
            url : 'http://222.102.104.182:8084/sentiment',
            async : false,
            data : JSON.stringify(postdata),
            dataType : 'JSON',
            contentType : "application/json",
            success : function(data) {
            	let pos = data.result2['pos'];
                let neg = data.result2['neg'];
				console.log(pos);
				$('#pos').val(pos);
				$('#neg').val(neg);
                
				
                let pos2=$('#pos').val()
                console.log(pos2);
                document.getElementById('ajaxafter').submit();
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
