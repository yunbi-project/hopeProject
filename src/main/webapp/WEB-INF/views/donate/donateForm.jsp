<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부하기 상세보기</title>
<link rel="stylesheet"
	href="${contextPath }/resources/style/css/yunbi.css/yProgramDonate.css">
<script src="${contextPath }/resources/js/yunbi.js/yProgramDonate.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        <!-- iamport.payment.js -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
         <script>
            var IMP = window.IMP; 
            IMP.init("imp16666025"); 
          
            var today = new Date();   
            var hours = today.getHours(); // 시
            var minutes = today.getMinutes();  // 분
            var seconds = today.getSeconds();  // 초
            var milliseconds = today.getMilliseconds();
            var makeMerchantUid = hours +  minutes + seconds + milliseconds;
            
    
            function requestPay() {
                IMP.request_pay({
                    pg : 'html5_inicis.INIpayTest',
                    pay_method : 'card',
                    merchant_uid: makeMerchantUid, 
                    name : ${p.donateTitle},
                    amount : ${p.donateAmount},
                    buyer_email : ${p.email},
                    buyer_name : ${p.userName},
                    buyer_tel : ${p.phone},
                    buyer_addr : '서울특별시 강남구 삼성동 일단 고정 주소',
                    buyer_postcode : '123-456 address test'
                }, function (rsp) { // callback
                    if (rsp.success) {
                        console.log(rsp);
                    } else {
                        console.log(rsp);
                    }
                });
            }
        </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<section>
		<div class="y_donate_insert_area">
			<div class="y_donate_insert_1">
				<h1>후원하기</h1>
			</div>
			<div class="y_donate_insert_2">
				<p>후원자님께서 보내주신 소중한 후원금은 국내·외 소외계층지원, 긴급구호, 공익활동지원 등 아름다운 세상을 만드는
					우리의 모든 사업에 사용됩니다.</p>
			</div>
		</div>
<form action="${contextPath}/donate/insert/${donateNo}" method="post" >
		<div class="y_donate_info">
			<div class="y_donate_name">
			<h3>${p.donateTitle }</h3>
			</div>

			<div class="y_donate_name">
				<span>후원금액</span> 
				<input id="amount" type="number" name="donateAmount" placeholder="직접입력" class="y_input">
			</div>
			<hr>

			<div>
				<h2>회원가입 정보</h2>
				<p>후원내역 확인 등 마이페이지 이용 시 꼭 필요한 정보입니다</p>

				<div class="y_donate_name">
					<span>이름</span> <input type="text" name="userName" value="${p.userName }" class="y_input">
				</div>

				<div class="y_donate_name">
					<span>휴대전화</span> <input type="text" name="userPhone"
						value="${p.phone }"  class="y_input">
				</div>

				<div class="y_donate_name">
					<span>이메일</span> <input type="email" name="userEmail"
						value="${p.email }"  class="y_input">
				</div>
			</div>
			<hr>

			<div>
				<h2>추가정보</h2>

				<div class="y_donate_name">
					<span>후원자한마디</span> <input type="text" name="optionalText" class="y_input" placeholder="선택사항이에요. 자유롭게 작성해주세요.">
				</div>
			</div>
			<hr>
			<div>
				<h2>결제정보</h2>

				<div class="y_donate_name">
					<span>결제수단</span> 
					<input id="b" type="radio"
						name="b" value="2" class="y_checkbox">
						<label for="b" >신용카드</label>
				</div>

<!-- 				<div class="y_donate_name"> -->
<!-- 					<span>카드번호</span> <input type="number"> -->
<!-- 				</div> -->

<!-- 				<div class="y_donate_name"> -->
<!-- 					<span>유효기간</span> <input type="number" placeholder="MM"> <input -->
<!-- 						type="number" placeholder="YY"> -->
<!-- 				</div> -->

<!-- 				<div class="y_donate_name"> -->
<!-- 					<span>카드주명</span> <input type="text" name="userName"> -->
<!-- 				</div> -->

<!-- 				<div class="y_donate_name"> -->
<!-- 					<span>생년월일</span> <input type="number" name="userSsn"> -->
<!-- 				</div> -->

<!-- 				<div class="y_donate_name"> -->
<!-- 					<span>출금일</span> <input type="text" value="매월 5일" readonly> -->
<!-- 				</div> -->
				
				<button onclick="requestPay()">후원하기</button>

				<!-- 			<div> -->
				<!-- 			<span>은행명</span> -->
				<!--         	<select> -->
				<!--         		<option>국민은행</option> -->
				<!--         		<option>농협은행</option> -->
				<!--         		<option>신한은행</option> -->
				<!--         		<option>우리은행</option> -->
				<!--         	</select> -->
				<!-- 			</div> -->

				<!-- 			<div> -->
				<!-- 			<span>계좌번호</span> -->
				<!-- 			<input type="text" name="account" placeholder="전화번호 형식의 계좌번호 사용 불가"> -->
				<!-- 			</div> -->

				<!-- 			<div> -->
				<!-- 			<span>예금주명</span> -->
				<!-- 			<input type="text" name="userName"> -->
				<!-- 			</div> -->

				<!-- 			<div> -->
				<!-- 			<span>생년월일</span> -->
				<!-- 			<input type="text" placeholder="주민번호 앞 6자리"> -->
				<!-- 			</div> -->

				<!-- 			<div> -->
				<!-- 			<span>출금일</span> -->
				<!-- 			<input type="text" value="매월 5일" readonly> -->
				<!-- 			</div> -->
			</div>
		</form>
		</div>
	</section>
	<script type="text/javascript">
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>