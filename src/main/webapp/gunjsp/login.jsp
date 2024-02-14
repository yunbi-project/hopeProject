<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hope.user.model.vo.User"%>
<%
	User idfind = (User) session.getAttribute("idfind");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <link rel="stylesheet" href="./resources/style/css/gun/login.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script>
    var contextPath = '<%= request.getContextPath() %>';
</script>
</head>

<body>
  <div class="wrapper">
    <div class="container">
      <div class="sign-up-container">
       
          <h1 class="login">회원가입</h1>
          <div class="social-links">  
            <div>
              <a href="/hope/oauth2/authorization/google"><img src="./resources/style/img/socialLogin/google2.png"></a>
            </div>
            <div>
              <a href="/hope/oauth2/authorization/naver "><img src="./resources/style/img/socialLogin/naver1.png"></a>
            </div>
          </div>
          
          <form action="<%=request.getContextPath() %>/singup.me" method="post"> <!-- 회원가입 폼 -->
          <input type="hidden" name="loginType" value="1"> <!-- loginType값 세션로그인 1 넘겨줌 -->
          <input type="email" id="email" name="email" placeholder="이메일 ">
          <button type="button" id="idcheck" onclick="idCheck();">이메일중복체크</button>
          <input type="password" name="password" placeholder="비밀번호 ">
          <input type="text" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder=" 휴대폰 번호 = 010-1234-5678">
          <input type="text" name="userName" placeholder="이름 ">
          <button class="form_btn">회원가입</button>
        </form>
        
        <script>
    function idCheck() {
        var email = $('#email').val(); // 이메일 입력란의 값 가져오기

        // 유효성 검사
        if (!isValidEmail(email)) {
            alert("특수문자는 제외하고 입력해주세요.");
            return;
        }

        // Ajax 요청 설정
        $.ajax({
            type: 'GET',  // 요청 방식은 GET
            url: contextPath + '/idcheck',  // 요청할 URL은 idcheck
            data: { email: email }, // 이메일 데이터 전송
            success: function(response) { // 성공 시 처리할 콜백 함수
                if (response === "0") {
                    alert("사용 가능한 아이디입니다.");
                } else {
                    alert("중복된 아이디입니다.");
                }
            },
            error: function(xhr, status, error) { // 실패 시 처리할 콜백 함수
                console.error(xhr.responseText); // 에러 메시지 콘솔에 출력
            }
        });
    }

    // 이메일 유효성 검사 함수
    function isValidEmail(email) {
        // 이메일이 null이거나 공백인 경우 유효하지 않음
        if (!email || email.trim() === "") {
            return false;
        }

        // 정규 표현식을 사용하여 이메일 형식을 검증
        var regex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$/;
        return regex.test(email);
    }
</script>

        
      </div>
      <div class="sign-in-container">
    
          <h1 class="login">로그인</h1>
          <div class="social-links">
            <div>
              <a href="/hope/oauth2/authorization/google"><img src="./resources/style/img/socialLogin/google2.png"></a>
            </div> 
            <div>
              <a href="/hope/oauth2/authorization/naver"><img src="./resources/style/img/socialLogin/naver1.png"></a>
            </div>
          </div>
          
          
          <form action="<%=request.getContextPath() %>/login.me" method="post"> <!-- 로그인 폼 -->
          <input type="text" name="email" placeholder="email 입력">
          <input type="password" name="password" placeholder="Password 입력">
          <input type="hidden" name="loginType" value="1">
          <button type="submit" class="form_btn">로그인</button>
          
          <!-- 아이디 찾기와 비밀번호 찾기 링크 -->
	    <div class="find-links">
		    <a href="<%=request.getContextPath() %>/idfind">아이디 찾기</a> | <a href="<%=request.getContextPath() %>/passwordfind">비밀번호 찾기</a>
		</div>
        </form>
        
         
      </div>
      <div class="overlay-container">
        <div class="overlay-left">
          <h1>환영합니다.</h1>
          <p>로그인은 아래 버튼을 클릭해주세요</p>
          <button id="signIn" class="overlay_btn">로그인</button>
        </div>
        <div class="overlay-right">
          <h1>환영합니다.</h1>
          <p>회원가입은 아래 버튼을 클릭해주세요</p>
          <button id="signUp" class="overlay_btn">회원가입</button>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript" src="./resources/js/gun/login.js"></script>
</body>

</html>
