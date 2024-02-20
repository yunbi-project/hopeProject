<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<button id="kakao_pay">결제하기</button>
</body>
<script>
	$("#kakao_pay").on("click", function(){
		e.preventDefault();
		
		$.ajax({
			url : '/donate/payment',
			type:'get',
			success : function(response){
				alert(response.next_redirect_pc_url);
				location.href = response.next_redirect_pc_url;
			}
		});
	});
</script>
</html>