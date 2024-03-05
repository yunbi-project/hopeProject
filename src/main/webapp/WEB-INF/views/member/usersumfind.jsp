<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.hope.user.model.vo.User"%>
<%
	User idfind = (User) session.getAttribute("idfind");
	String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
 
    }

   .container {
    position: absolute; 
    top: 50%; 
    left: 50%; 
    transform: translate(-50%, -50%); 
    max-width: 500px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    text-align: center;
    margin-bottom: 50px; 
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
        background-color: #007bff; 
        color: #fff; 
    }

    #showFindPasswordForm {
        background-color: #fff; 
        color: #007bff; 
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

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>

    <div class="container">
        <button type="button" id="showFindIdForm">아이디 찾기</button>
        <button type="button" id="showFindPasswordForm">비밀번호 찾기</button>

  <form id="findIdForm" action="<%=request.getContextPath() %>/idfind.me" method="post">
    <label for="name">이름:</label>
    <input type="text" id="name" name="userName" style="margin-right: 20px" required><br>
    
    
    <label for="phone">휴대폰 번호:</label>
    <div style="display: flex; justify-content: space-between; align-items: center;"> 
        <input type="number" name="phone" id="phone" class="donateGoodInput" placeholder="'-'빼고 숫자만 입력" required style="width: 250px; margin-left: 50px;">
        <input type="button" class="donateGoodBtn" id="donateGoodBtn" value="인증요청" style="margin-top: 10px;">
    </div>

    <input type="text" style="width: 200px; margin-top: 10px;" id="certificationNumber" class="donateGoodInput" placeholder="인증번호 6자리 입력" required style="margin-left: 20px;">
    <input type="button" id="certificationNumberBtn" class="donateGoodBtn1" value="인증 확인" style="margin-top: 10px;">

    <button type="submit" id="findIdBtn" style="margin-top: 10px;">아이디 찾기</button>
    <div id="findIdError" class="error"></div>
</form>

        
        <!-- 아이디 찾기 휴대폰번호 인증 -->
		<script>
		var code2 = "";
		$(document).ready(function() {
		    $("#donateGoodBtn").click(function() {
		        var phoneNumber = $("#phone").val();
		        if (phoneNumber === "") {
		            alert("휴대폰 번호를 입력해주세요.");
		            return; 
		        }
		        alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		        
		        $.ajax({
		            type: "POST", 
		            url: "/hope/sendSMS1.do", 
		            data: { phone: phoneNumber }, 
		            cache: false,
		            success: function(data) {
		                if (data == "error") {
		                    alert("휴대폰 번호가 올바르지 않습니다.");
		                } else {
		                    alert("휴대폰 전송이 됨.");
		                    code2 = data;
		                }
		            }
		        });
		    });
		
		    // 휴대폰 인증번호 대조
		    $("#certificationNumberBtn").click(function() {
		        if ($("#certificationNumber").val() == code2) {
		            alert('인증성공');
		            // 폼 제출
		            $("#findIdForm").submit();
		        } else {
		            alert('인증실패');
		            // 인증 실패 시 폼 제출 취소
		            return false;
		        }
		    });
		
		    // "아이디 찾기" 버튼 클릭 시 폼 제출
		    $("#findIdBtn").click(function() {
		        if ($("#certificationNumber").val() !== code2) {
		            alert('휴대폰 인증이 필요합니다.');
		            // 폼 제출 취소
		            return false;
		        }
		    });
		});
		</script>
        
        <form id="findPasswordForm" action="<%=request.getContextPath() %>/pwdfind.me" method="post">
            <label for="email">이메일:</label>
            <input type="text" id="userId" name="email" required><br>
            <label for="phone">휴대폰 번호:</label>
            <input type="text" id="phone" name="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" required placeholder="'-'빼고 숫자만 입력"><br>
            <button type="submit" id="findPasswordBtn">비밀번호 찾기</button>
            <div id="findPasswordError" class="error"></div>
        </form>
    </div>
	</main>
    <script>
        $(document).ready(function() {
            $("#findIdForm").show();
            $("#findPasswordForm").hide();

            $("#showFindIdForm").click(function() {
                $("#findIdForm").show(); 
                $("#findPasswordForm").hide(); 
                $(this).css("background-color", "#007bff").css("color", "#fff"); 
                $("#showFindPasswordForm").css("background-color", "#fff").css("color", "#007bff"); 
            });

           
            $("#showFindPasswordForm").click(function() {
                $("#findIdForm").hide(); 
                $("#findPasswordForm").show();
                $(this).css("background-color", "#007bff").css("color", "#fff"); 
                $("#showFindIdForm").css("background-color", "#fff").css("color", "#007bff");
            });
        });
    </script>
    
      
      
</body>

</html>
