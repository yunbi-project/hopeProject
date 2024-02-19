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
	
<style>
*{
	font-family: 'NanumSquareNeo-Variable';
}

.resultMsg{
	margin-top: 50px; 
	text-align: center; /* 가운데 정렬을 위한 스타일 추가 */
	font-size: 25px;
	margin-bottom: 10px;
}

.resultMsg1{
	text-align: center; /* 가운데 정렬을 위한 스타일 추가 */
	font-size: 25px;
	margin-bottom: 30px;
}


.resultMsg2{
	text-align: center; /* 가운데 정렬을 위한 스타일 추가 */
	font-size: 25px;
	margin-bottom: 50px;
}

.donateGoodFormBorder{
    border: 4px solid #ABC138;
    width: 230px;
    margin-left: 650px;
    margin-bottom: 100px;
}


.resultSpan{
	font-size: 30px;
	color: red;
}

.resultImg{
	width: 30px;
	margin-right: 20px;
}

.resultBox{
	display: flex;
    border: 1px solid black;
    text-align: center;
    width: 600px;
    align-items: center;
    justify-content: center;
    padding: 10px;
    background-color : #abc128;
    border-radius : 10px;
}
	
</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main>
		<form action="" method="get">
			<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">물품 기부 신청 완료</h2>
        	<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
			<div class="resultMsg">감사합니다.</div>
			<div class="resultMsg1">물품기부가 성공적으로 신청되었습니다. </div>
			<div class="resultMsg2">물품기부번호는 <span class="resultSpan">1번</span> 입니다. </div>
			<div class="resultBox"><img class="resultImg" src="https://cdn-icons-png.flaticon.com/128/10797/10797457.png">물품기부번호는 물품기부내역을 수정할 때 필요한 정보입니다.</div>
		</form>
	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>