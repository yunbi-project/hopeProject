<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
</style>
</head>
<body>

  <div class="password-form">
    <h2>비밀번호 재작성</h2>
    <form id="RePasswordForm" action="<%=request.getContextPath() %>/repassword.me" method="post">
      <input type="password" name="password" placeholder="새로운 비밀번호" required>
      <input type="password" name="confirmPassword" placeholder="비밀번호 재확인" required>
      <button type="submit">변경</button>
    </form>
  </div>
</body>
</html>
