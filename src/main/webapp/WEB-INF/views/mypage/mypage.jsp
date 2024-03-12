<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="resources/style/css/dowon.css/mypage.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="d-div-wrapper">
		<div class="section">
			<div class="container">
				<span class="text-wrapper">기부천사</span>
				<p class="text-wrapper">${loginUser.userName }님,반갑습니다!</p>
				<div class="edit-profile" onclick="redirectToEditPage()">내정보 변경</div>
			</div>
			<div class="avatar">
				<img class="frame" src="resources/images/mypage/img.png" />
			</div>
		</div>
		
		<div class="grid-container">
			<div class="section">
				<div class="container" id="shadow-area">
					<div class="flex-container">
						<div class="left-content"><h1 class="text-wrapper">기부내역</h1></div>
					</div>

					<div class="flex-container">
						<div class="donate-amount">
							<p class="text-wrapper total" style="font-size: 15px;">
								총 기부금
								<c:if test="${not empty mypage.donateAmount}">
									<fmt:formatNumber value="${mypage.donateAmount}"
										type="currency" pattern="#,###" />원
								</c:if>
								<c:if test="${empty mypage.donateAmount}">0원</c:if>
							</p>
							<p class="text-wrapper total" style="font-size: 15px;">
								총 기부횟수
								<c:if test="${not empty mypage.donateCount}">
									<fmt:formatNumber value="${mypage.donateCount}" />회
								</c:if>
								<c:if test="${empty mypage.donateAmount}">
									0회
								</c:if>
							</p>
						</div>
					</div>
					<div  class="list-container">
					<c:if test="${not empty donatelistm}">
						<c:forEach var="donatem" items="${donatelistm}">
							<div class="row" onclick="location.href='${contextPath}/donate/detai/${donatem.donateNo}'" style="cursor: pointer;">
								<div class="article" style="border-left:7px solid #84a90c;">
									<div class="frame-2">
										<div class="title-3">${donatem.donateTitle}</div>
										<div class="title-3" style="font-weight:bold; font-size:20px;">
											<fmt:formatNumber value="${donatem.donateAmount}" type="currency" pattern="#,###원기부" /> / ${donatem.payType == 'C' ?  '신용카드' : '자동이체'}
										</div>
										<div class="subtitle">
											${donatem.optionalText}
										</div>
										<div class="subtitle"><fmt:formatDate value="${donatem.createDate}" type="date"
												pattern="yyyy.MM.dd" /></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty donatelistm}">
						<div class="row">
							<div class="article">
								<div class="frame-2">
									<div class="title-3" style="text-align: center;">최근 기부한 내역이 없습니다.</div>
									<a href="${contextPath}/donate/list" style="color: #7fa924; font-size: 15px; margin: 0 auto; margin-top: 20px;">후원모집 리스트 바로가기➡</a>
								</div>
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="container" id="shadow-area">
					<h1 class="text-wrapper">기부물품</h1>
					<div class="flex-container">
						<div class="donate-amount">
							<p class="text-wrapper total" style="font-size: 15px;">
								물품기부 신청
								<c:if test="${not empty mypage.productCount}"><fmt:formatNumber value="${mypage.productCount}" type="currency" pattern="#,###" />회</c:if>
								<c:if test="${empty mypage.productCount}">0회</c:if>
							</p>
							<p class="text-wrapper total" style="font-size: 15px;">
								물품기부 완료
								<c:if test="${not empty mypage.statusCount}"><fmt:formatNumber value="${mypage.statusCount}" />회</c:if>
								<c:if test="${empty mypage.statusCount}">0회	</c:if>
							</p>
						</div>
					</div>
					<div  class="list-container">
					<c:if test="${not empty donatelistp}">
						<c:forEach var="donatep" items="${donatelistp}">
							<div class="row" onclick="confirm()">
								<div class="article">
									<div class="frame-2">
										<div class="subtitle">${donatep.categoryName}</div>
										<div class="subtitle">${donatep.productAmount}개</div>
										<div class="subtitle">신청 유형 : ${donatep.productType == 'B' ?  '개인' : '기업'}</div>
										<div class="subtitle">기부 방법 : ${donatep.productWay == 'V' ?  '방문' : '택배'}</div>
										<div class="subtitle">택배 수령 여부 : ${donatep.status == 'Y' ? '확인중' : '확인완료'}</div>
										<div class="subtitle">
											<fmt:formatDate value="${donatep.productDate}" type="date" pattern="yyyy.MM.dd" />
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty donatelistp}">
						<div class="row">
							<div class="article">
								<div class="frame-2">
									<div class="title-3" style="text-align: center;">최근 기부물품이 없습니다.</div>
									<a href="${contextPath}/donate/list" style="color: #7fa924; font-size: 15px; margin: 0 auto; margin-top: 20px;">물품기부리스트 바로가기➡</a>
								</div>
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="container" id="shadow-area">
					<h1 class="text-wrapper">봉사활동</h1>
					※ 내가 신청한 봉사활동 목록이 표시됩니다. ※
					<div  class="list-container">
					<c:if test="${not empty programlist}">
						<c:forEach var="program" items="${programlist}">
							<div class="row">
								<div class="article">
									<div class="frame-2">
										<div class="title-3" onclick="location.href='${contextPath}/program/detail/${program.programNo}'" style="cursor: pointer;">${program.programName}</div>
										<div class="subtitle">${program.programActivityStartDate}~${program.programActivityEndDate} <button class="subtitle-btn" style="float:right;" onclick="deleteRequest(${program.programNo})">신청 취소</button></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty programlist}">
						<div class="row">
							<div class="article">
								<div class="frame-2">
									<div class="title-3" style="text-align: center;">신청한 봉사활동이 없습니다.</div>
									<a href="${contextPath}/program/list" style="color: #7fa924; font-size: 15px; margin: 0 auto; margin-top: 20px;">봉사활동 리스트 바로가기➡</a>
								</div>
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="container" id="shadow-area">
					<h1 class="text-wrapper">즐겨찾기</h1>
					※ 하트를 누르면 즐겨찾기가 삭제됩니다. ※
					<div class="list-container">
					<c:if test="${not empty bookmarklist}">
						<c:forEach var="bookmark" items="${bookmarklist}">
							<div class="row">
							    <div class="article">
							        <div class="frame-2" onclick="location.href='${contextPath}/program/detail/${bookmark.programNo}'" style="cursor: pointer;">
							            <div style="background-color: #7fa924; padding: 5px; border-radius: 3px; color: white; margin: 0;">D-${bookmark.result}</div>
							            <div class="title-3">${bookmark.programName}</div>
							            <div class="subtitle">${bookmark.programActivityStartDate} ~ ${bookmark.programActivityEndDate}</div>
							        </div>
							        <div>
							            <button class="heartBtn" style="cursor: pointer;" onclick="deleteBookmark(${bookmark.programNo})">
							                <i class=" xi-heart-o xi-2x"></i>
							            </button>
							        </div>
							    </div>
							</div>
						</c:forEach>
						</c:if>
					<c:if test="${empty bookmarklist}">
						<div class="row">
							<div class="article">
								<div class="frame-2">
									<div class="title-3" style="text-align: center;">즐겨찾기한 게시글이 없습니다.</div>
									<a href="${contextPath}/program/list" style="color: #7fa924; font-size: 15px; margin: 0 auto; margin-top: 20px;">봉사활동 리스트 바로가기➡</a>
								</div>
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="resources/js/dowon.js/mypage.js"></script>
	<script>
	    function deleteBookmark(programNo) {
	    	if(confirm("즐겨찾기를 삭제할까요?")){
		        $.ajax({
		            type: "POST", // 요청 방식은 POST
		            url: "${contextPath}/mypage", // 요청을 보낼 URL
		            data: {
		                programNo: programNo // 프로그램 번호를 데이터로 전달
		            },
		            success: function(response) { // 요청 성공 시 처리
		                console.log("즐겨찾기가 삭제되었습니다.");
		                window.location.reload();
		            },
		            error: function(xhr, status, error) { // 요청 실패 시 처리
		                console.error("즐겨찾기 삭제 중 오류 발생:", error);
		                // 실패한 경우 추가 작업 수행 가능
		            }
		        });
		    }else{
		    	window.location.reload();
		    }
	    }
		</script>
		<script>
	    function deleteRequest(programNo) {
	    	if(confirm("봉사활동 신청을 취소하시겠습니까?")){
		        // AJAX 요청
		        $.ajax({
		            type: "POST", // 요청 방식은 POST
		            url: "${contextPath}/mypage", // 요청을 보낼 URL
		            data: {
		                programNo: programNo // 프로그램 번호를 데이터로 전달
		            },
		            success: function(response) { // 요청 성공 시 처리
		                console.log("취소되었습니다.");
		                window.location.reload();
		            },
		            error: function(xhr, status, error) { // 요청 실패 시 처리
		                console.error("취소 중 오류 발생:", error);
		                // 실패한 경우 추가 작업 수행 가능
		            }
		        });
		    }else{
		    	window.location.reload();
		    }
	    }
		</script>
</body>
</html>
