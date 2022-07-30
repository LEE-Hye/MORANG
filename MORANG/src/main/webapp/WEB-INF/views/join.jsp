<%@page import="com.smhrd.domain.Join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>모랑</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Anton'>

    <link rel="stylesheet" href="resources/css/join.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .inputList{
            width: 250px;
                      height: 32px;
                      font-size: 15px;
                      border: 0;
                      border-radius: 15px;
                      outline: none;
                      padding-left: 10px;
                      background-color: rgb(233, 233, 233)
        }
        .btn-3 {
        border: 1px solid rgb(240, 129, 129);
        background-color: rgb(240, 129, 129);
        color: white;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 10px;
       }
       .btn-3:hover{
        color: rgb(240, 129, 129);
        background-color: white;
       }
       .nav-tabs .nav-link.active {
	    color: #ffffff;
	    background-color: #000000;
	    border-color: #dee2e6 #eaf5ff #fff;
		}
	
		.nav-link:focus, .nav-link:hover {
	    color: #000000;
		}
	
		.nav-link {
	    display: block;
	    padding: 0.5rem 1rem;
	    color: #000000;
	    text-decoration: none;
	    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out;
		}
    </style>
</head>

<body>
    
    <h3 style="color : rgb(255, 051, 051)">母랑<br>임산부<br>우울감 케어 서비스</h3>
    <section class="top">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
            style="background-color: red; border: none; margin-right: 10px;">
            로그인
        </button>

        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModa2"
            style="background-color: red; border: none;">
            회원가입
        </button>

        <!-- 아이디 비밀번호 찾기 -->

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
                            
                                이름 : <input id="u_name" type="text" placeholder="이름을 입력해 주세요." class="inputList" name="u_name" >
                       </div>
                       <br>
                      <div class="phone">
                                연락처 : <input id="u_phone" type="text" placeholder="연락처를 입력해 주세요." class="inputList" name="u_phone">
                       <br>
                       <br>
                       <br>
                       </div>
                       <div><button type="submit" class="btn btn-dark" id="repeatcheck3" onclick="findid()">확인하기</button></div> 
                       <br>
                       
                       <div id="findError" class="error">호출장소</div>  
        <!-- 로그인페이지로 이동 -->
                            <br>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">로그인하기</button>
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
                    <div class="wrapper" >
                        <ul class="nav nav-tabs" id="myTab" role="tablist" align="center">
                            <li class="nav-item" role="presentation">
                              <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">임산부</button>
                            </li>
                            <li class="nav-item" role="presentation">
                              <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">보호자</button>
                            </li>

                          </ul>
                          <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <form action="joinInsert.do" method="post">
                                <br>
                                    <div class="name" style="margin-left: 110px;">
                                        ID : <br> <input id="u_id" type="text" name="u_id" placeholder="이름을 입력해 주세요." class="inputList" size="30"
                                            >
                                            <a id="repeatcheck1" onclick="u_idcheck()">중복확인</a>
                                        <div id="nameError1" class="error"></div>
                                        <br>
                                    </div>
                                    <div class="nick" style="margin-left: 110px;">
                                        이름 : <br> <input id="name" type="text" name="u_name" placeholder="이름을 입력해 주세요."
                                            size="30" class="inputList">
                                        <div id="nameError" class="error"></div>
                                        <br>
                                    </div>
                                    <div class="nick" style="margin-left: 110px;">
                                        닉네임 :<br> <input id="nick" type="text" name="u_nick" placeholder="닉네임을 입력해 주세요."
                                            size="30" class="inputList">
                                        <div id="nickError" class="error"></div>
                                        <br>
                                    </div>
                                    <div class="password" style="margin-left: 110px;">
                                        비밀번호 :<br> <input id="password" type="password" name="u_pw" placeholder="비밀번호를 입력해 주세요."
                                            size="30" class="inputList">
                                        <div id="passwordError" class="error"></div>
                                        <br>
                                    </div>
                                    <div class="passwordCheck" style="margin-left: 110px;">
                                        비밀번호 확인 : <br><input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요."
                                            size="30" class="inputList">
                                        <div id="passwordCheckError" class="error"></div>
                                        <br>
                                    </div>
                                    <div class="phone" style="margin-left: 110px;">
                                        휴대폰 번호 :<br> <input id="phone" type="text" size="30" name="u_phone" maxlength="11"
                                            placeholder="휴대폰번호를 입력해주세요" class="inputList">
                                    </div>
                                    <br>
                                    <div class="birth" style="margin-left: 110px; width: 200px;">
                                        <td class="inputList">생일:</td>
                                        <td><input type="date" name="u_birthdate"></td>
                                    </div>
                                    <div class="line">
                                        <hr>
                                    </div>
                                    <div align="center">
                                        <input type="submit" value="회원가입" class="btn-3">
                                           
        
                                    </div>
                                </form>
                            </div>

                            <!-- 여기까지가 임산부 모달 -->
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <form action="protectorJoinInsert.do" method="post">
                            <br>
                                <div class="name" style="margin-left: 110px;">
                                    ID : <br> <input id="p_id" type="text" name="p_id" placeholder="이름을 입력해 주세요." size="30"
                                    class="inputList"><a id="repeatcheck2" onclick="p_idcheck()">중복확인</a>
                                    <div id="nameError2" class="error"></div>
                                    <br>
                                </div>
                                <div class="nick" style="margin-left: 110px;">
                                
                                    이름 : <br> <input id="name" type="text" name="p_name" placeholder="이름을 입력해 주세요."
                                        size="30" class="inputList">
                                    <div id="nameError" class="error"></div>
                                    <br>
                                </div>
                                <div class="password" style="margin-left: 110px;">
                                    비밀번호 :<br> <input id="password" type="password" name="p_pw" placeholder="비밀번호를 입력해 주세요."
                                        size="30" class="inputList">
                                    <div id="passwordError" class="error"></div>
                                    <br>
                                </div>
                                <div class="passwordCheck" style="margin-left: 110px;">
                                    비밀번호 확인 : <br><input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요."
                                        size="30" class="inputList">
                                    <div id="passwordCheckError" class="error"></div>
                                    <br>
                                </div>
                                <div class="phone" style="margin-left: 110px;">
                                    보호자 번호 :<br> <input id="phone" type="text" size="30" name="p_phone" maxlength="11"
                                        placeholder="휴대폰번호를 입력해주세요" class="inputList">
                                </div>
                                <br>
                                <div class="birth" style="margin-left: 110px; width: 200px;">
                                    <td class="inputList">생일:</td>
                                    <td><input type="date" name="p_birthdate"></td>
                                </div>
                                <br>
                                <div class="id" style="margin-left: 110px;">
                                    임산부ID :<br> <input id="id" type="text" size="30" name="u_id" maxlength="11"
                                        placeholder="임산부의 ID를 적어주세요" class="inputList">
                                </div>
                                <div class="line">
                                    <hr>
                                </div>
                                <div align="center">
                                    <input type="submit" value="회원가입" class="btn-3">
                                        
    
                                </div>
                            </form>
                        </div>
                        <!-- 보호자 회원가입 모달  -->
                          </div>
                        <br />
                        
                    </div>
                </div>
            </div>
        </div>

       
        <!-- 로그인 Modal -->
        <!-- 여기부터 임산부  로그인 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">로그인 </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <br>
                    <div class="wrapper" >
                        <ul class="nav nav-tabs" id="myTab" role="tablist" align="center">
                            <li class="nav-item" role="presentation">
                              <button class="nav-link active" id="home-tab1" data-bs-toggle="tab" data-bs-target="#home1" type="button" role="tab" aria-controls="home1" aria-selected="true">임산부</button>
                            </li>
                            <li class="nav-item" role="presentation">
                              <button class="nav-link" id="profile-tab1" data-bs-toggle="tab" data-bs-target="#profile1" type="button" role="tab" aria-controls="profile1" aria-selected="false">보호자</button>
                            </li>

                          </ul>
                          <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home1" role="tabpanel" aria-labelledby="home-tab1">
                                <form action="login.do" method="post">
                                <br>
                                <div class="modal-body">
                                    <div class="wrapper" align="center">
                                        <br>
                                        <br>
                                        <div class="id">
                                            ID : <input id="id" type="text" name="u_id" placeholder="임산부 아이디를 입력해 주세요." class="inputList">
                                            <div id="idError" class="error"></div>
                                            <br>
                                        </div>
                                        <div class="password">
                                            PW : <input id="password" type="password" name="u_pw" placeholder="비밀번호를 입력해 주세요." class="inputList">
                                            <div id="passwordError" class="error"></div>
                                        </div>
                                        <br>
                                        <br>
                                        <p>생각나지 않는다면 ? 😑</p>
            
                                        <!-- test -->
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#exampleModa3"
                                            style="background-color: black; border: none; text-align : center">
                                            아이디/비밀번호 찾기
                                        </button>
            
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="submit" class="btn btn-danger">로그인하기</button></a>
                                </div>
                                </form>
                            </div>

                            
                            <!-- 여기부터 보호자  로그인 모달 -->
                            <div class="tab-pane fade" id="profile1" role="tabpanel" aria-labelledby="profile-tab1">
                                <form action="login2.do" method="post">
                                <br>
                                <div class="modal-body">
                                    <div class="wrapper" align="center">
                                        <br>
                                        <br>
                                        <div class="id">
                                            ID : <input id="id" type="text" name="p_id" placeholder="보호자 아이디를 입력해 주세요." class="inputList">
                                            <div id="idError" class="error"></div>
                                            <br>
                                        </div>
                                        <div class="password">
                                            PW : <input id="password" type="password" name="p_pw" placeholder="비밀번호를 입력해 주세요." class="inputList">
                                            <div id="passwordError" class="error"></div>
                                        </div>
                                        <br>
                                        <br>
                                        <p>생각나지 않는다면 ? 😑</p>
            
                                        <!-- test -->
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#exampleModa3"
                                            style="background-color: black; border: none; text-align : center">
                                            아이디/비밀번호 찾기
                                        </button>
            
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="submit" class="btn btn-danger">로그인하기</button></a>
                                </div>
                                </form>
                            </div>
                          </div>
                        <br />                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 하트비 -->

    <div id="test">
        <div id="chocolate_rains">

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        
     <script type="text/javascript">
     function u_idcheck(){
    		
    		let u_id = $('#u_id').val()

    		
    			$.ajax({
    				url :'joincheck1.do',
    				type : 'post',
    				data : {
    					'u_id':u_id,
    				},
    				success:function(res){
    					// 기존에 있던 조회수를 바꿔줘야함
    					if(res==0){
    						$('#nameError1').html("사용할 수 없는 아이디입니다").css( "color", "red");
    					}
    					else if(res==1){
    						$('#nameError1').html("사용할 수 있는 아이디입니다").css( "color", "black");
    					}
    					
    				},
    				error:function(e){alert('error!')}
    			});

    	}
     
     function p_idcheck(){
 		
 		let p_id = $('#p_id').val()

 		
 			$.ajax({
 				url :'joincheck2.do',
 				type : 'post',
 				data : {
 					'p_id':p_id,
 				},
 				success:function(res){
 					// 기존에 있던 조회수를 바꿔줘야함
 					console.log(res);
 					if(res==0){
 						$('#nameError2').html("사용할 수 없는 아이디입니다").css( "color", "red");
 					}
 					else if(res==1){
 						$('#nameError2').html("사용할 수 있는 아이디입니다").css( "color", "black");
 					}
 					
 				},
 				error:function(e){alert('error!')}
 			});

 	}
     
     function findid(){
 		
 		let u_name= $('#u_name').val()
		let u_phone= $('#u_phone').val()
 		
 			$.ajax({
 				url :'findid.do',
 				type : 'post',
 				data : {
 					'u_name':u_name,
 					'u_phone':u_phone,
 				},
 				success:function(res){
 					// 기존에 있던 조회수를 바꿔줘야함
 					if(res==0){
 						$('#findError').html("사용자의 아이디는 ["+res+"] 입니다").css( "color", "black");
 					}
 					else if(res==1){
 						$('#findError').html("찾을 수 없는 아이디입니다.").css( "color", "red");
 					}
 					
 				},
 				error:function(e){alert('error!')}
 			});

 	}
     </script>
</body>

</html>