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

        #findIdBtn,
        #findPasswordBtn {
            background-color: #82f5b2;
            color: #fff;
        }

        #findIdBtn:hover,
        #findPasswordBtn:hover {
            background-color: #4CAF50;
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
            border-color: #4CAF50;
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
    $(document).ready(function() {

		//휴대폰 번호 인증
		var code2 = "";
		$("#donateGoodBtn").click(function(){
		    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		    var phoneNumber = $("#phone").val();
		    $.ajax({
		        type:"POST", // post 형식으로 발송
		        url:"/hope/idcheck.me", // controller 위치
		        data: {phone:phoneNumber}, // 전송할 ㅔ이터값
		        cache : false,
		        success:function(data){
		            if(data == "error"){ //실패시 
		                alert("휴대폰 번호가 올바르지 않습니다.")
		            }else{            //성공시        
		                alert("휴대폰 전송이  됨.")
		                code2 = data; // 성공하면 데이터저장
		            }
		        }
		        
		    });
		});
	    // 신청하기 버튼 클릭 시
	    $(".productBtn").click(function() {
	        // 입력한 인증번호를 가져옵니다.
	        var certificationNumber = $("#certificationNumber").val();

	        // 입력한 인증번호와 저장된 인증번호를 비교합니다.
	        if (certificationNumber !== code2) {
	            // 인증번호가 일치하지 않는 경우
	            alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
	            return false; // 전송을 중지합니다.
	        } else {
	            // 인증번호가 일치하는 경우
	            return true; // 폼을 제출합니다.
	        }
	    });
		 
		 
		 
		//휴대폰 인증번호 대조
		$("#certificationNumberBtn").click(function(){
		    if($("#certificationNumber").val() == code2){ // 위에서 저장한값을 ㅣ교함
		         alert('인증성공')
		    }else{
		        alert('인증실패')
		    }
		});
    });
    </script>
        

        <!-- 비밀번호 찾기 폼 -->
         <form id="findPasswordForm" action="<%=request.getContextPath() %>/pwdfind.me" method="post">
            <label for="email">이메일:</label>
            <input type="text" id="userId" name="email" required><br>
            <label for="phone">휴대폰 번호:</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" required placeholder="'-'빼고 숫자만 입력"><br>
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
