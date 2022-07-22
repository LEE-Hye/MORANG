<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="resources/css/Main/style.css">
  <script src="https://kit.fontawesome.com/3e55fa4950.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- 차트 js -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- 자바 스크립트 -->
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="resources/js/Main/bootstrap.js" type="text/javascript"></script>
  <script src="resources/js/Main/bootstrap.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="resources/css/Main/calendar.css">
  <script src="resources/js/Main/calendar.js"></script>
  <link href="resources/css/Main/main.css" rel="stylesheet" id="main-css">
  <script src="resources/js/Main/main.js" type="text/javascript"></script>

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
                <a href="메인 페이지.html" class="menu-item">HOME</a>
                <a href="산전 우울증.html" class="menu-item">우울증 자가진단</a>
                <a href="감정일기장.html" class="menu-item">감정 일기장</a>
                <a href="공유수첩.html" class="menu-item">공유수첩</a>
                <a href="게시판.html" class="menu-item">게시판</a>
            </nav>
        </nav>

        <div class="share_note">

            <div class="share_note1">
                <div class="delete_b">
                    <button id="delete_btn">X</button>
                </div>
                <div class="share_content">여기는 제목이라능 용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나
                    남겨여기는
                    내용이라능 메모 하나 남겨여기는 내용이라능 메모 </div>
                <div class="share_title">제목</div>
                <div class="share_date">2022-05-45</div>
            </div>

            <div class="share_note2">
                <div class="share_content">여기겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기</div>
                <div class="share_title">제목</div>
                <div class="share_date">2022-05-45</div>
            </div>

            <div class="share_note3">
                <div class="share_content">여기는 제목이라능 용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나
                    남겨여기는
                </div>
                <div class="share_title">제목</div>
                <div class="share_date">2022-05-45</div>
            </div>

            <div class="share_note4">
                <div class="share_content">여기는 제목이라능 용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모여기는
                    내용이라능 메모
                    하나 남겨여기</div>
                <div class="share_title">제목</div>
                <div class="share_date">2022-05-45</div>
            </div>

        </div>





        <div id="plus_note">
            <i class="fa-solid fa-circle-plus fa-3x" id="modal-open"></i>
        </div>


        <div class="popup-wrap" id="popup3">

            <div class="popup">
                <form action="#">
                    <div class="popup-head">

                        <span class="head-title">공유 수첩 작성</span>
                    </div>
                    <div class="popup-body">
                        <div class="body-content">
                            <div class="body-titlebox">
                                <textarea name="note_title" rows="2" cols="40" placeholder="제목을 입력해주세요"
                                    class="note_title"></textarea>
                            </div>
                            <div class="body-contentbox">
                                <p>
                                    <textarea name="note_content" rows="5" cols="43" placeholder="내용을 입력해주세요"
                                        class="note_content"></textarea>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="popup-foot">
                        <button class="pop-btn confirm" id="confirm3">저장</button>
                        <button class="pop-btn close" id="close3">창 닫기</span>
                    </div>
                </form>
            </div>
        </div>


        <div class="popup-wrap" id="popup">
            <div class="popup">
                <div class="popup-head">
                    <span class="head-title">
                        공유수첩 상세</span>
                </div>
                <div class="popup-body">
                    <div class="body-content">
                        <div class="body-titlebox">
                            <h1>제목</h1>
                        </div>
                        <div class="body-contentbox">
                            <p>여기는 제목이라능 용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는 내용이라능 메모 하나 남겨여기는
                                내용이라능 메모 하나 남겨여기는 내용이라능 메모 </p>
                        </div>


                    </div>
                </div>
                <div class="popup-foot">
                    <button class="pop-btn confirm" id="confirm">수정</button>
                    <button class="pop-btn close" id="close">닫기</button>
                </div>
            </div>
        </div>



        <div id="confirm">
            <div class="popup-wrap" id="popup2">
                <div class="popup">
                    <form action="#">
                        <div class="popup-head">
                            <span class="head-title">
                                공유수첩 수정</span>
                        </div>
                        <div class="popup-body">
                            <div class="body-content">
                                <div class="body-titlebox">
                                    <textarea name="note_title" rows="2" cols="40" placeholder="제목을 입력해주세요"
                                        class="note_title"></textarea>
                                </div>
                                <div class="body-contentbox">
                                    <p>
                                        <textarea name="note_content" rows="5" cols="43" placeholder="내용을 입력해주세요"
                                            class="note_content"></textarea>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="popup-foot">
                            <button class="pop-btn confirm" id="save2">저장</button>
                            <button class="pop-btn close" id="close2">닫기</span>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $('#delete_btn').click(function () {
                let que = confirm('정말 삭제 할거야?')
                console.log(que)
            })

        </script>

        <script>
            $(function () {
                $("#confirm3").click(function () {
                    modalClose();
                    //컨펌 이벤트 처리
                });
                $("#modal-open").click(function () {
                    $("#popup3").css('display', 'flex').hide().fadeIn();
                });
                $("#close3").click(function () {
                    modalClose();
                });
                function modalClose() {
                    $("#popup3").fadeOut();
                }
            });


        </script>

        <script>
            $(function () {
                $("#confirm").click(function () {
                    modalClose();
                    //컨펌 이벤트 처리
                });
                $(".share_content").click(function () {
                    $("#popup").css('display', 'flex').hide().fadeIn();
                });
                $("#close").click(function () {
                    modalClose();
                });
                function modalClose() {
                    $("#popup").fadeOut();
                }

            });
        </script>




        <script>
            $(function () {
                $("#save2").click(function () {
                    modalClose();
                    //컨펌 이벤트 처리
                });
                $("#confirm").click(function () {
                    $("#popup2").css('display', 'flex').hide().fadeIn();
                });
                $("#close2").click(function () {
                    modalClose();
                });
                function modalClose() {
                    $("#popup2").fadeOut();
                }
            });
        </script>



</body>
</html>