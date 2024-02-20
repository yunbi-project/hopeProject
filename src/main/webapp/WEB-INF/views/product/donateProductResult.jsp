<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 기부 신청</title>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateProductResult.css">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main>
		<section>
		
			<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">물품 기부 신청 완료</h2>
        	<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
			<div class="resultMsg">감사합니다.</div>
			<div class="resultMsg1">물품기부가 성공적으로 신청되었습니다. </div>
			<div class="resultMsg2">신청한 물품기부번호는 <span class="resultSpan">${productNo}번</span> 입니다. </div>
			<div class="resultBox"><img class="resultImg" src="https://cdn-icons-png.flaticon.com/128/10797/10797457.png">물품기부번호는 &nbsp; <b>물품기부내역을 수정할 때 &nbsp;</b> 필요한 정보이오니 참고바랍니다.</div>
			<div class="btnStyle">
				<a href="${contextPath}"><button type="button" class="resultBtn">확인</button></a>
			</div>
		</section>
	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	

</body>
</html>