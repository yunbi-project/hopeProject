<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.springboot.user.model.vo.User"%>
<%
	User idfind = (User) session.getAttribute("idfind");
	String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
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

        button {
            padding: 15px 30px;
            margin: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        button:focus {
            outline: none;
        }

        #findIdBtn,
        #findPasswordBtn {
            background-color: #82f5b2;
            color: #fff;
        }

        #findIdBtn:hover,
        #findPasswordBtn:hover {
            background-color: #82f5b2;
        }

        #findIdForm,
        #findPasswordForm {
            display: none;
            padding: 20px;
        }

        label {
            font-size: 18px;
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #82f5b2;
        }

        .error {
            color: red;
            margin-top: 10px;
            font-size: 16px;
        }
    </style>
</head>

<body>

    <div class="container">
   		
        <!-- 아이디 찾기 버튼 -->
        <button type="button" id="showFindIdForm" style="background-color: #82f5b2; color: #fff;">아이디 찾기</button>
        <!-- 비밀번호 찾기 버튼 -->
        <button type="button" id="showFindPasswordForm">비밀번호 찾기</button>

		<% if (errorMsg != null) { %>
                    alert("<%= errorMsg %>");
                <% } %>
        <!-- 아이디 찾기 폼 -->
        <form id="findIdForm" action="<%=request.getContextPath() %>/idfind.me" method="post"> <!-- 로그인 폼 -->
            <label for="name">이름:</label>
            <input type="text" id="name" name="userName" required><br>
            <label for="phone">휴대폰 번호:</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required placeholder="010-1234-5678"><br>
            <button type="submit" id="findIdBtn" style="background-color: #82f5b2; color: #fff;">아이디 찾기</button>
            <div id="findIdError" class="error"></div>
        </form>
        

        <!-- 비밀번호 찾기 폼 -->
         <form id="findPasswordForm" action="<%=request.getContextPath() %>/pwdfind.me" method="post">
            <label for="email">이메일:</label>
            <input type="text" id="userId" name="email" required><br>
            <label for="phone">휴대폰 번호:</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required placeholder="010-1234-5678"><br>
            <button type="submit" id="findPasswordBtn" style="background-color: #82f5b2; color: #fff;">비밀번호 찾기</button>
            <div id="findPasswordError" class="error"></div>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            // 초기에는 아이디 찾기 폼만 표시
            $("#findIdForm").show();
            $("#findPasswordForm").hide();

            // 아이디 찾기 버튼 클릭 시
            $("#showFindIdForm").click(function() {
                $("#findIdForm").show(); // 아이디 찾기 폼 표시
                $("#findPasswordForm").hide(); // 비밀번호 찾기 폼 숨김
                $(this).css("background-color", "#007bff").css("color", "#fff"); // 버튼 강조 효과
                $("#showFindPasswordForm").css("background-color", "#fff").css("color", "#007bff"); // 다른 버튼 색 조정
            });

            // 비밀번호 찾기 버튼 클릭 시
            $("#showFindPasswordForm").click(function() {
                $("#findIdForm").hide(); // 아이디 찾기 폼 숨김
                $("#findPasswordForm").show(); // 비밀번호 찾기 폼 표시
                $(this).css("background-color", "#007bff").css("color", "#fff"); // 버튼 강조 효과
                $("#showFindIdForm").css("background-color", "#fff").css("color", "#007bff"); // 다른 버튼 색 조정
            });
        });
    </script>
</body>

</html>
