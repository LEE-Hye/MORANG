<%@page import="com.smhrd.domain.Join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>모랑</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Anton'>

    <link rel="stylesheet" href="resources/css/join.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
         * {padding: 0; margin: 0;}
        #wrap{margin: 0 auto; width: 1200px;}
        .header{width: 100%; height: 150px; background: #111}
        .aside{float: left; width: 30%; height: 900px; background: #333}
        .article1{float: left; width: 70%; height: 300px; background: #454}
        .article2{float: left; width: 70%; height: 300px; background: #464}
        .article3{float: left; width: 70%; height: 300px; background: #474}
        .footer{clear: both; float:left; width: 100%; height: 150px; background: #555;}
        
        /* 화면 너비 0 ~ 1200px */
        @media (max-width: 1220px){
            #wrap {width: 95%;}
        }

          /* 화면 너비 0 ~ 768px */
        @media (max-width: 768px){
            #wrap {width: 100%;}
        }

        /* 화면 너비 0 ~ 480px */
        @media (max-width: 480px){
            #wrap {width: 100%;}
            .header {height: 300px;}
            aside {float: none; height: 300px;}
            section {float: none; height: 300px;} 
        }
    </style>
</head>
<body>
    
    <h3 style="color : rgb(255, 0, 0)">우산👶<br>우리들의<br>산모 일기 </h3>
    <section class="top">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
            style="background-color: red; border: none; margin-right: 10px;">
            로그인
        </button>
        
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModa2"
            style="background-color: red; border: none;">
            회원가입
        </button>
    
    <!-- Button trigger modal -->

    <div class="modal fade" id="exampleModa3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"> 아이디/비밀번호찾기 </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
  
          <div class="modal-body">
  
  
            <div class="wrapper" align="center">
              
              <div class="name">
                이름 : <input id="name" type="text" placeholder="이름을 입력해 주세요."  style="width: 250px;
                height: 32px;
                font-size: 15px;
                border: 0;
                border-radius: 15px;
                outline: none;
                padding-left: 10px;
                background-color: rgb(233, 233, 233);">
                <div id="nameError" class="error"></div>
              </div>
              <br>
              <div class="phone">
                연락처 : <input id="phone" type="text" placeholder="연락처를 입력해 주세요." style="width: 250px;
                height: 32px;
                font-size: 15px;
                border: 0;
                border-radius: 15px;
                outline: none;
                padding-left: 10px;
                background-color: rgb(233, 233, 233);">
                <div id="phoneError" class="error"></div>
                <br>
              </div>
              
              <!-- test -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                style="background-color: black; border: none;" >
                로그인하러가기
              </button>
              <br>
            
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            <a href="main.html"><button type="button" class="btn btn-primary">로그인하기</button></a>
          </div>
        </div>
      </div>
    </div>
  
    <!-- 회원가입 Modal -->
    
    <div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">회원가입 </h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <br>
          <div class="wrapper">
            <div id="align" align="center">
                <input type="radio" id="radio1" name="radios" value=0 checked="checked">
                <label for="radio1" >임산부</label>
                <input type="radio" id="radio2" name="radios" value=1>
                <label for="radio2" >보호자</label>

              </div>
              <br />
              <form action="joinInsert.do" method="post">
            <div class="name" style="margin-left: 110px;" >
           ID : <br> <input id="id" type="text" name="u_id" placeholder="이름을 입력해 주세요." size="30" style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
              <div id="nameError" class="error"></div>
              <br>
            </div>
            <div class="nick" style="margin-left: 110px;">   
              이름 : <br> <input id="name" type="text" name="u_name" placeholder="이름을 입력해 주세요." size="30" style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
              <div id="nameError" class="error"></div>
              <br>
            </div>
            <div class="nick" style="margin-left: 110px;">
              닉네임 :<br> <input id="nick" type="text" name="u_nick" placeholder="닉네임을 입력해 주세요." size="30" style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
              <div id="nickError" class="error"></div>
              <br>
            </div>
            <div class="password" style="margin-left: 110px;">
              비밀번호 :<br> <input id="password" type="password" name="u_pw" placeholder="비밀번호를 입력해 주세요." size="30" style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
              <div id="passwordError" class="error"></div>
              <br>
            </div>
            <div class="passwordCheck" style="margin-left: 110px;">
              비밀번호 확인 : <br><input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요." size="30" style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
              <div id="passwordCheckError" class="error"></div>
              <br>
            </div>
            <div class="phone" style="margin-left: 110px;">
              휴대폰 번호 :<br> <input id="phone" type="text" size="30" name="u_phone"maxlength="11" placeholder="휴대폰번호를 입력해주세요" style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
            </div>
            <br>
            <div class="birth" style="margin-left: 110px; width: 200px;">
              <td style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">생일:</td>
              <td><input type="date" name="u_birthdate"></td>
            </div>
            <div class="line">
              <hr>
            </div>
            <div align="center">
                <input type="submit" value="회원가입" style="color: azure; background-color: #000; margin-bottom: 20px;" >
                
          </div>
          </form>
        </div>
        </div>
      </div>
    </div>
  
    <!-- 로그인 Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그인 </h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="wrapper" align="center">
              <br>
              <br>
              <div class="id">
                ID : <input id="id" type="text" placeholder="아이디를 입력해 주세요."
                style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
                <div id="idError" class="error"></div>
                <br>
              </div>
              <div class="password">
                PW : <input id="password" type="password" placeholder="비밀번호를 입력해 주세요."
                style="width: 250px;
              height: 32px;
              font-size: 15px;
              border: 0;
              border-radius: 15px;
              outline: none;
              padding-left: 10px;
              background-color: rgb(233, 233, 233);">
                <div id="passwordError" class="error"></div>
              </div>
              <br>
              <br>
              <p>생각나지 않는다면 ? 😑</p>
  
              <!-- test -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModa3"
                style="background-color: black; border: none; text-align : center">
                아이디/비밀번호 찾기
              </button>
  
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            <a href="main.html"><button type="button" class="btn btn-primary">로그인하기</button></a>
          </div>
        </div>
      </div>
    </div>
</section>
        <!-- 하트비 -->
    
        <div id="test">
    <div id="chocolate_rains">
        
        <div class="heart" >
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="heart">
            <div class="ring"></div>
            <div class="inner">
                <div class="regular">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
                <div class="reverse">
                    <div class="movable">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>