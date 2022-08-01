<%@page import="java.util.List" %>
    <%@page import="com.smhrd.domain.diary" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!-- 템플릿만 저장하는 용도 -->
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link rel="stylesheet" href="resources/css/diaryMain.css">
                        <link rel="stylesheet" href="resources/css/diarywrite.css">
                        <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
                        <title>diary content</title>
                        <link rel="preconnect" href="https://fonts.googleapis.com">
                        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                        <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->

                        <script type="text/javascript">
                            function goList() {
                                // boardList 페이지로 이동
                                // PathVariable을 사용중인 페이지에는 /ContextPath/ 를 붙이자.
                                // / == http://localhost:8083/
                                location.href = "/web/diary.do";
                            }

                            function goDelete(diary_seq) {

                                location.href = '/web/diaryDelete.do?diary_seq=' + diary_seq;

                            }

                            function goUpdate(diary_seq) {
                                location.href = "/web/diaryGoUpdate.do?diary_seq=" + diary_seq;
                            }


                        </script>



                    </head>

                    <body>

                        <div class="stars">
                        </div>


                        <%-- EL은 scope(pageContext, request, session, application)에서 가져옴 .getAttribute()와 유사
                            ${scope(scope생략가능).이름.필드명}=> ${이름.필드명}

                            이름이 겹치면
                            PageContext < request < session < application 유지 시간이 짧은 scope의 것을 가져온다. --%>
                                <% List<diary> list = (List<diary>) request.getAttribute("list");
                                        %>

                                        <div class="write_Content">
											<div class="big-form-group">
                                            <div class="form-group">
                                                <div class="headline">제목 :</div>
                                                <div class="col-sm-10">
                                                    <div>${requestScope.diary.diary_title}</div>
                                                </div>
                                            </div>    

                                            <div class="form-group">
                                                <div class="headline">작성자 :</div>
                                                <div class="col-sm-10">
                                                    <div>${diary.u_id}</div>
                                                </div>
                                            </div> 

                                                <div class="form-group">
                                                <div class="headline">내용 :</div>
                                                <div class="col-sm-10">
                                                    <div>${fn:replace(diary.diary_content, newLine, "<br>") }</div>
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
                                                    <c:choose>
                                                                                     
                                                        <c:when test="${diary.weather eq 'sun'}">
                                                            <i class="fa-solid fa-sun"></i>
                                                        </c:when>
                                                        <c:when test="${diary.weather eq 'cloud'}">
                                                            <i class="fa-solid fa-cloud"></i>
                                                        </c:when>
                                                        <c:when test="${diary.weather eq 'rain'}">
                                                            <i class="fa-solid fa-cloud-showers-heavy"></i>
                                                        </c:when>
                                                        <c:when test="${diary.weather eq 'snow'}">
                                                            <i class="fa-solid fa-snowflake"></i>
                                                        </c:when>

                                                    </c:choose>
                                                </div>
                                                </div>
                                                </div> 
                                                

                                                <div class="form-group">
                                                <div class="headline">감정결과 :</div>
                                                <div class="col-sm-10">
                                                    <div>긍정 : ${diary.diary_pos}% 부정 : ${diary.diary_neg}% </div>
                                                </div>
                                                </div> 

                                                <div class="form-group">
                                                <div class="col-sm-10">
                                                    <button class="modal-diary"
                                                    onclick="goUpdate(${diary.diary_seq})"
                                                    class="btn btn-sm btn-info">수정</button>
                                                <button class="modal-diary"
                                                    onclick="goDelete(${diary.diary_seq})"
                                                    class="btn btn-sm btn-warning">삭제</button>
                                                <button class="modal-diary" onclick="goList()"
                                                    class="btn btn-sm btn-success">목록</button>
                                                </div>
                                                </div>
                                                </div>
                      
                                                 <div class="img-group">
                                                 	<c:if test='${diary.filename1 eq "unknown"}'>
                                                    <img src='${diary.filename1}' style="width: 100%; height:100%;">
                                                	</c:if>
                                                </div> 


                                            
                                                    
                                                     
                                                    

                                                

                                                
                                            </div>



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


                    </body>

                    </html>