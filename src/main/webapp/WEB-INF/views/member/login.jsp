<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hope.user.model.vo.User"%>
<%
	User idfind = (User) session.getAttribute("idfind");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <link rel="stylesheet" href="././resources/style/css/gunwook.css/login.css">
      <script>
    var contextPath = '<%= request.getContextPath() %>';
	</script>
	
	<script>
        // 오류 메시지 확인 및 알림창 표시
        function displayErrorMessage() {
            var errorMsg = "${errorMsg}";
            if (errorMsg) {
                alert(errorMsg);
            }
        }
        // 페이지 로드 시 실행
        window.onload = displayErrorMessage;
    </script>
    
     <!-- 주소 api -->
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
<div class="wrapper">
    <div class="container">
      <div class="sign-up-container">
        <br>
          <div style="display: flex; justify-content: center;">
    <div style="margin-right: 20px;">
        <a href="/hope/oauth2/authorization/google" style="background-color: #949494; padding: 5px; border-radius: 70%;">
            <img src="././resources/style/img/socialLogin/google2.png" style="width: 40px; height: 40px;">
        </a>
    </div>
    <div>
        <a href="/hope/oauth2/authorization/naver" style="background-color: #949494; padding: 5px; border-radius: 70%;">
            <img src="././resources/style/img/socialLogin/naver1.png" style="width: 40px; height: 40px;">
        </a>
    </div>
</div>
          <div>
			    <p style="text-align: center; font-size: 12px; color: #949494;">SNS 또는 아이디로 회원가입</p>
		 </div>
        
        <form action="<%=request.getContextPath() %>/singup.me" method="post"> <!-- 회원가입 폼 -->
          <input type="hidden" name="loginType" value="1"> <!-- loginType값 세션로그인 1 넘겨줌 -->
          <div class="input-group">
            <input type="email" id="email" name="email" style="margin-left: 12px" placeholder="이메일" required>
            <button type="button"  class="form_btn" onclick="idCheck()" style="font-size:10px;">중복체크</button>
          </div>
          <input type="password" name="password" placeholder="비밀번호" required>
          <input type="text" name="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="휴대폰 번호 = -빼고 입력해주세요" required>
          <input type="text" name="userName" placeholder="이름" required>
          <!-- 주소 입력 부분 -->
          <input type="text" id="postcode" name="postcode" placeholder="우편번호" required>
          <button id="openAddressPopup" type="button" class="form_btn"  onclick="execDaumPostcode()">우편번호 찾기</button>
          <input type="text" id="address" name="address" placeholder="주소"><br>
          <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" required><br>
          <button class="form_btn">회원가입</button>
        </form>
    

    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById('address').value = data.address;
                    document.getElementById('detailAddress').focus();
                }
            }).open();
        }
    </script>
        
        <script>
    function idCheck() {
        var email = $('#email').val(); // 이메일 입력란의 값 가져오기

        // 유효성 검사
        if (!isValidEmail(email)) {
            alert("특수문자 제외! 도메인명 작성");
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
        /* 예) example@example.com  */
        return regex.test(email);
    }
</script>

        
      </div>
      <div class="sign-in-container">
			<br>    
          <div style="display: flex; justify-content: center;">
    <div style="margin-right: 20px;">
        <a href="/hope/oauth2/authorization/google" style="background-color: #949494; padding: 5px; border-radius: 70%;">
            <img src="././resources/style/img/socialLogin/google2.png" style="width: 40px; height: 40px;">
        </a>
    </div>
    <div>
        <a href="/hope/oauth2/authorization/naver" style="background-color: #949494; padding: 5px; border-radius: 70%;">
            <img src="././resources/style/img/socialLogin/naver1.png" style="width: 40px; height: 40px;">
        </a>
    </div>
</div>
          <div>
			    <p style="text-align: center; font-size: 12px; color: #949494;">SNS 또는 아이디로 로그인</p>
		 </div>
          
          <form action="<%=request.getContextPath() %>/login.me" method="post"> <!-- 로그인 폼 -->
          <input type="text" name="email" placeholder="email 입력" required>
          <input type="password" name="password" placeholder="Password 입력" required>
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
          <h1>회원가입 입니다.</h1>
          <p style="font-size:15px">로그인은 아래 버튼을 클릭해주세요</p>
          <button id="signIn" class="overlay_btn">로그인</button>
        </div>
        <div class="overlay-right">
          <h1>로그인 입니다.</h1>
          <p style="font-size:15px">회원가입은 아래 버튼을 클릭해주세요</p>
          <button id="signUp" class="overlay_btn">회원가입</button>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  <script type="text/javascript" src="././resources/js/gun.js/login.js"></script>
</body>

</html>