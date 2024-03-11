<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부하기</title>
<link rel="stylesheet"
	href="${contextPath }/resources/style/css/hyun.css/donateBoardForm.css">
	<script src="${contextPath }/resources/js/yunbi.js/yProgramDonate.js"></script>
 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 	
    <!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


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
		<div class="y_donate_info">
			<h2 style="text-align:center;">후원할 금액</h2>

			<div class="y_donate_name">
				<span>후원금액</span> 
				<input style="width:300px;" id="donateAmount" type="number" name="donateAmount" placeholder="직접입력" class="y_input onlyNum">
				<div id="data" data-userNo="${loginUser.userNo}" data-count="${d.count}" data-end="${d.ceilDayDiff}" data-date="${d.donateCreateDate}" data-enddate="${d.donateEndDate}"></div>
				<div style="width:300px; padding: 20px;">
					<span style="margin-left: 10px; border:none;" id="money"></span>
				</div>
				
			</div>
			<hr>
			<h2>회원정보</h2>
			
			<div class="y_donate_name">
				<span>이름</span>
				<input type="text" id="userName" data-userno="${loginUser.userNo}" data-donateno="${donateNo}" placeholder="이름을 입력해주세요"  name="userName" value="${loginUser.userName}" readonly class="readonly">
			</div>
			<div class="y_donate_name">
				<span>전화번호</span>
				<input type="text" id="phone" placeholder="전화번호를 입력해주세요"  name="phone" value="${loginUser.phone}" readonly class="readonly">
			</div>
			<div class="y_donate_name">
				<span>이메일</span>
				<input type="text" id="email" placeholder="이메일을 입력해주세요" name="email" value="${loginUser.email}" readonly class="readonly">
			</div>
			
			<hr>

			<div>
				<h2>추가정보</h2>

				<div class="y_donate_name">
					<span>후원자한마디</span> <input type="text" id="optionalText" name="optionalText" class="y_input" placeholder="선택사항이에요. 자유롭게 작성해주세요.">
				</div>
				
				<div class="y_donate_name">
					<span>익명 여부</span>
				    <label class="custom-checkbox" style="padding-top: 20px;">
						<input type="checkbox" name="anonymous" id="anonymous">
					   	<span class="checkmark" style="width:20px; padding:0px;"></span>
					</label>
				</div>
			</div>

			<button onclick="requestPay()" class="modify-btn">결제하기</button>


		</div>
	</section>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	 
	    $(document).ready(function() {
	        // 숫자만 입력을 감지하는 함수
	        $(".onlyNum").on("input", function() {
	            var sanitizedValue = $(this).val().replace(/[^0-9]/g, '');
	            $(this).val(sanitizedValue);
	        });
	
	        // 숫자만 입력을 확인하는 함수
	        $("input[name='donateAmount']").on("change", function() {
	            var inputValue = $(this).val();
	
	            // 입력 값이 숫자가 아닌 경우
	            if (isNaN(inputValue) || inputValue === "") {
	                alert("숫자만 입력하세요. 한글이나 영어는 입력할 수 없습니다.");
	                $(this).val("");
	            }
	        });
	        
	        // 입력이 변경될 때마다 실행되는 함수 정의
	        $('.onlyNum').on('input', function() {
	            // 입력된 값에서 숫자만 추출하여 콤마로 구분된 통화 형식으로 변환
	            var currencyValue = $(this).val().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            
	            // 변환된 값을 화면에 출력할 요소에 설정
	            $('#money').text(currencyValue + "원");
	        });
	    });
	    

		var IMP = window.IMP; 
        IMP.init("imp67030158"); 
	    
  		function requestPay() {
        	
  	    	var donateAmount = $("#donateAmount").val();
  	    	var anonymous = $("#anonymous").is(":checked") ? 'Y' : 'N'; // 체크박스가 체크되었는지 여부를 확인하여 'Y' 또는 'N'값으로 설정
  	        var phone = $("#phone").val();
  	        var email = $("#email").val();
  	        var userName = $("#userName").val();
  	        var donateNo = $("#donateNo").val();
  	      	var userNo = $("#userName").data("userno");
  	        var optionalText = $("#optionalText").val();
  	     	var donateNo = $("#userName").data("donateno");
        	
            IMP.request_pay({
                pg: "html5_inicis.INIBillTst",
                pay_method: "card",
                merchant_uid: "order_" + new Date().getTime(),
                name: "후원 상품",
                amount: donateAmount,                         // 숫자 타입
                buyer_email: email,
                buyer_name: userName,
                buyer_tel: phone
            }, function(data){
        		if(data.success){
        			var msg = "결제 완료";
                    msg += '// 결제 금액 : ' + data.paid_amount;
                    msg += '// 카드 승인번호 : ' + data.apply_num;
                    
                    $.ajax({
                    	type : 'post',
                    	url : '/hope/paySuccess',
                    	data : {
                    		"donateNo" : donateNo,
                    		"donateAmount" : donateAmount,
                    		"optionalText": optionalText,
                            "userNo" : userNo,
                            "anonymous": anonymous
                    	},
                    	success: function(response) {
                    		document.location.href="${contextPath}/donate/detail/" + donateNo;
                        	alert("결제성공");
                    	},
                        error: function(xhr, status, error) {
                            // AJAX 요청이 실패한 경우 처리할 내용
                        }
                    });
                }else{
                	console.log("결제 실패");
                	var msg = "결제 실패"
                	msg += "에러 내용" + data.error_msg;
                	return;
                }
        		alert(msg);
        		document.location.href="${contextPath}/donate/detail/" + donateNo;
        	});
        }


	</script>
</body>
</html>