<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<style>
	*{
		font-family: 'NanumSquareNeo-Variable';
	}
	
	img{
		
	}

 	main{ 
 		margin: 50px 0px 0px 200px;
 		text-align: center; 
 		font-weight: bold; 
 		font-size: 35px; 
 		display:flex; 
	} 
	
 	main img{
 		width: 800px; 
 		margin-left: 150px;
 	} 
	

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main>
		<img src="${contextPath }/resources/style/img/mainPage/errorImg.jpg">
<!-- 		<span>서비스 이용 불가합니다! 현재 페이지는 사용할 수 없는 페이지입니다.</span> -->
	</main>


	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>