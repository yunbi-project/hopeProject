<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<link rel="stylesheet" href="resources/style/css/dowon.css/editprofile.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="container">
        <h2>내 정보 변경</h2>
        <form action="#" method="post">
          <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required>
          </div>
          <div class="form-group">
            <label for="email">이메일 주소:</label>
            <input type="email" id="email" name="email" required>
          </div>
          <div class="form-group">
            <label for="password">새로운 비밀번호:</label>
            <input type="password" id="password" name="password" required>
          </div>
          <div class="form-group">
            <input type="submit" value="저장">
          </div>
        </form>
      </div>
      
      <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
      
      <script src="resources/js/dowon.js/mypage.js"></script>
</body>
</html>
