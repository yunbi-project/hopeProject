<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hope.user.model.vo.User"%>
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
            padding: 10px 20px;
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

        #showFindIdForm {
            background-color: #007bff; /* 아이디 찾기 버튼 기본 색상 */
            color: #fff; /* 아이디 찾기 버튼 기본 글자색 */
        }

        #showFindPasswordForm {
            background-color: #fff; /* 비밀번호 찾기 버튼 기본 색상 */
            color: #007bff; /* 비밀번호 찾기 버튼 기본 글자색 */
        }

        #showFindIdForm:hover,
        #showFindPasswordForm:hover {
            background-color: #f2f2f2;
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
        input[type="password"],
        input[type="number"] {
            width: 300px;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #007bff;
        }

        .error {
            color: red;
            margin-top: 10px;
            font-size: 16px;
        }

        .donateGoodBtn1 {
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            background-color: #abe138;
            color: #fff;
        }
    </style>
</head>

<body>

    <div class="container">
        <!-- 아이디 찾기 버튼 -->
        <button type="button" id="showFindIdForm">아이디 찾기</button>
        <!-- 비밀번호 찾기 버튼 -->
        <button type="button" id="showFindPasswordForm">비밀번호 찾기</button>

        <!-- 아이디 찾기 폼 -->
        <form id="findIdForm" action="<%=request.getContextPath() %>/idfind.me" method="post">
            <!-- 로그인 폼 -->
            <label for="name">이름:</label>
            <input type="text" id="name" name="userName"  style="margin-right: 20px" required><br>
            <label for="phone">휴대폰 번호:</label>

            <!-- 휴대폰 번호 입력 -->
            <input type="number" name="phone" id="phone" class="donateGoodInput" placeholder="'-'빼고 숫자만 입력"  style="margin-left: 50px" required>
            <!-- 인증번호 -->
            <input type="button" class="donateGoodBtn"  value="인증요청">

            <input type="text" style="width: 200px;" id="certificationNumber" class="donateGoodInput"
                placeholder="인증번호 6자리 입력" style="margin-left: 130px" required>
            <input type="button" id="certificationNumberBtn" class="donateGoodBtn1" style="margin-left: 0px"  value="인증 확인">

            <button type="submit" id="findIdBtn">아이디 찾기</button>
            <div id="findIdError" class="error"></div>
        </form>
        
        <!-- 아이디 찾기 휴대폰번호 인증 -->
        <script>
            // JavaScript 코드 작성
        </script>
        
        <!-- 비밀번호 찾기 폼 -->
        <form id="findPasswordForm" action="<%=request.getContextPath() %>/pwdfind.me" method="post">
            <label for="email">이메일:</label>
            <input type="text" id="userId" name="email" required><br>
            <label for="phone">휴대폰 번호:</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" required placeholder="'-'빼고 숫자만 입력"><br>
            <button type="submit" id="findPasswordBtn">비밀번호 찾기</button>
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
