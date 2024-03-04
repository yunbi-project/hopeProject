<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="top-bar">
			<div class="title">마이페이지</div>
		</div>

		<div class="section">
			<div class="avatar">
				<img class="frame" src="resources/images/mypage/profile.png" />
			</div>
			<div class="container">
				<div class="text-wrapper">${loginUser.userName }</div>
				<div class="edit-profile" onclick="redirectToEditPage()">내정보
					변경</div>
			</div>
		</div>

		<div class="navigation-wrapper">
			<div class="navigation">
				<div class="tab" id="donationp-tab">기부물품</div>
				<div class="divider">|</div>
				<div class="tab" id="donationm-tab">기부금</div>
				<div class="divider">|</div>
				<div class="tab" id="volunteer-tab">봉사활동</div>
				<div class="divider">|</div>
				<div class="tab" id="bookmark-tab">즐겨찾기</div>
			</div>
		</div>


		<div class="div-donationp-content">

			<div class="title-2">기부물품</div>

			<div class="list">

				<!-- 물품 -->
				<c:forEach var="donatep" items="${donatelistp}">
					<div class="row">
						<div class="article">
							<div class="image-container">
								<div class="frame">
									<div class="icon">📦</div>
								</div>
							</div>
							<div class="frame-2">
								<div class="subtitle">날짜 : ${donatep.productDate}</div>
								<div class="subtitle">제품 종류 : ${donatep.categoryName}</div>
								<div class="subtitle">수량 : ${donatep.productAmount}</div>
							</div>
							<div class="frame-2">
								<div class="subtitle">문의 유형 : ${donatep.productType}</div>
								<div class="subtitle">기부 방법 : ${donatep.productWay}</div>
								<div class="subtitle">영수증 발급여부 : ${donatep.receipt}</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			
		</div>

		<div class="div-donationm-content">

			<div class="title-2">기부금</div>

			<div class="list">

				<!-- 후원금 -->
				<c:forEach var="donatem" items="${donatelistm}">
					<div class="row">
						<div class="article">
							<div class="image-container">
								<div class="frame">
									<div class="icon">💸</div>
								</div>
							</div>
							<div class="frame-2">
								<div class="subtitle">결제번호 : ${donatem.payNo}</div>
								<div class="subtitle">결제유형 : ${donatem.payType}</div>
								<div class="subtitle">후원금액 : ${donatem.donateAmount}원</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			
		</div>



		<div class="div-volunteer-content">

			<div class="title-2">봉사활동</div>

			<div class="list">
				※ 내가 참여한 봉사활동 목록이 표시됩니다. ※
				<c:forEach var="program" items="${programlist}">
					<div class="row">
						<div class="article">
							<div class="image-container">
								<div class="frame">
									<div class="overlap-group">
										<div class="icon">🤝</div>
									</div>
								</div>
							</div>
							<div class="frame-2">
								<div class="title-3">
									모집기한<br />${program.programActivityStartDate}~
									${program.programActivityEndDate}
								</div>
								<div class="subtitle">참여한 활동 : ${program.programName}</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>

		<div class="div-bookmark-content">

			<div class="title-2">즐겨찾기</div>

			<div class="list">
				※ 하트를 누르면 즐겨찾기가 삭제됩니다. ※
				<c:forEach var="bookmark" items="${bookmarklist}">
					<div class="row">
						<div class="article">
							<div class="image-container">
								<div class="frame">
									<div class="overlap-group">
										<div class="icon">💛</div>
									</div>
								</div>
							</div>
							<div class="frame-2">
								<div class="title-3">
									모집기한<br />${bookmark.programActivityStartDate} ~
									${bookmark.programActivityEndDate}
								</div>
								<div class="subtitle">즐겨찾기한 활동 : ${bookmark.programName}</div>
							</div>
							<div>
								<button class="heartBtn"
									onclick="deleteBookmark(${bookmark.programNo})">
									<i class=" xi-heart-o xi-2x"></i>
								</button>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>

		


		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

		<script src="resources/js/dowon.js/mypage.js"></script>

		<script>
	    function deleteBookmark(programNo) {
	        // AJAX 요청
	        $.ajax({
	            type: "POST", // 요청 방식은 POST
	            url: "mypage", // 요청을 보낼 URL
	            data: {
	                programNo: programNo // 프로그램 번호를 데이터로 전달
	            },
	            success: function(response) { // 요청 성공 시 처리
	                console.log("북마크가 삭제되었습니다.");
	            	// 페이지 새로고침
	                location.reload();
	            },
	            error: function(xhr, status, error) { // 요청 실패 시 처리
	                console.error("북마크 삭제 중 오류 발생:", error);
	                // 실패한 경우 추가 작업 수행 가능
	            }
	        });
	    }
		</script>
</body>
</html>
