<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hope.user.model.vo.User"%>
<%
	User idfind = (User) session.getAttribute("idfind");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
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

    .container {
        max-width: 500px;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    #result {
        font-size: 20px;
        margin-bottom: 20px;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>


<div class="container">
    <h2>아이디 찾기 결과</h2>
    <div id="result">
        <% if (idfind != null) { %>
            <p>찾으시는 아이디는 <%= idfind.getEmail() %> 입니다.</p>
        <% } else { %>
            <p>아이디를 찾을 수 없습니다.</p>
        <% } %>
    </div>
    <button onclick="location.href='<%= request.getContextPath() %>/login'">로그인 페이지로 이동</button>
</div>

</body>
</html>