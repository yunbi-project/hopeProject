<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>비밀번호 재작성</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .password-form {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
    text-align: center;
  }

  .password-form h2 {
    margin-top: 0;
    color: #333;
  }

  .password-form input[type="password"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }

  .password-form button {
    background-color: #4caf50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }

  .password-form button:hover {
    background-color: #45a049;
  }
  
  .div-effect{
	font-size: 10px;
	color: red;
	width: 300px;
}
</style>
</head>
<body>

  <div class="password-form">
    <h2>비밀번호 재작성</h2>
    <form id="RePasswordForm" action="<%=request.getContextPath() %>/repassword.me" method="post">
      <input type="password" id="password" name="password" placeholder="새로운 비밀번호" required>
	  <div class="div-effect"  id="passwordMessage">
	  		<span>영문자, 숫자, 특수문자(!@#$%^) 총 8~15글자로 입력하시오</span>
	  </div>
      <input type="password" id="passwordConfirm" name="confirmPassword" placeholder="비밀번호 재확인" required>
      <button type="submit" id="form_btn">변경</button>
    </form>
  </div>
  
  <script>
    $(document).ready(function() {
        // 비밀번호 유효성 검사 함수
        function isValidPassword(password) {
            var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^])[A-Za-z\d!@#$%^]{8,15}$/;
            return regex.test(password);
        }

        // 비밀번호 입력란의 입력 변화를 감지하여 유효성 검사
        $('#password').on('input', function() {
            var password = $(this).val();
            var isValid = isValidPassword(password);
            var passwordMessage = $('#passwordMessage');

            if (password.trim().length > 0) {
                passwordMessage.show();
            } else {
                passwordMessage.hide();
            }

            if (isValid) {
                passwordMessage.html('<span>사용 가능한 비밀번호입니다.</span>');
                passwordMessage.removeClass('invalid');
            } else {
                passwordMessage.html('<span>영문자, 숫자, 특수문자가 혼합된 8~15글자 이내로 입력해주세요.</span>');
                passwordMessage.addClass('invalid');
            }
        });

        // 확인 버튼 클릭 시 폼 전송 전에 유효성 검사 및 비밀번호 확인 수행
        $('#form_btn').click(function() {
            var password = $('#password').val();
            var confirmPassword = $('#passwordConfirm').val();

            // 비밀번호 유효성 검사
            if (!isValidPassword(password)) {
                alert("영문자, 숫자, 특수문자가 혼합된 8~15글자 이내로 입력해주세요.");
                $('#password').focus();
                return false; // 폼 전송을 막음
            }

            // 비밀번호 확인
            if (password !== confirmPassword) {
                alert("입력한 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                $('#passwordConfirm').focus();
                return false; // 폼 전송을 막음
            }

            // 모든 검사가 통과되면 폼 전송
            $('#RePasswordForm').submit();
        });
    });
  </script>
</body>
</html>
