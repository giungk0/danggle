<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/loginForm.css">
</head>
<body>
<div class="header"></div>

	  <div class="form">
	    <form class="login-form" action="/member/loginMember.do" method="post">
	      <h2 style="margin-top:0px;">로그인</h2>
	      <input type="text" name="memberId" placeholder="아이디"/>
	      <input type="password" style="margin-bottom:1px;" name="memberPwd" placeholder="비밀번호"/>
	      <a href="/resources/views/searchId.jsp" class="message">아이디 찾기</a><a class="message"> │</a>
	      <a href="/resources/views/searchPwd.jsp" class="message">비밀번호 찾기</a><a class="message"> │</a>
	      <a href="/resources/views/join.jsp" class="message">회원가입</a>&emsp;&emsp;&emsp;&emsp;
	      <button type="submit">확인</button><br>
	      
		  <!-- 카카오 로그인화면 띄우기 (로그인 되어있으면 정보이용 동의 창) -->
		  <a href="https://kauth.kakao.com/oauth/authorize?client_id=ab9765f7a2a60e948050857a31641db8&redirect_uri=http://localhost:8282/login/kakao&response_type=code">
		  	<image style="width:290px; margin-bottom:3px;" src="/resources/images/kakao_login_btn.png"></image>
		  </a>
		  <!-- 네이버 로그인 -->
		  <a href="https://nid.naver.com/oauth2.0/authorize?client_id=odccQp1GnFhapuKs6al9&redirect_uri=http://localhost:8282/login/naver&response_type=code">
		  	<image style= "width:290px; height:45px;" src="/resources/images/naver_login_btn.png"></image>
		  </a>
	    </form>
	  </div>
	  
<div class="footer"></div>
</body>
</html>