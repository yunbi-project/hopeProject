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
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
		<article class="h_boardTitle">
			<h1>기부하기</h1>
			<p>기부금을 통해 세상을 발전시킵니다.</p>
		</article>
	</section>
	<section>
		<div class="y_donate_detail_top">
			<div class="y_donate_detail_img">
				<img src="${contextPath }/resources/style/img/yunbi/sample1.png" />
			</div>
			<div class="y_donate_detail_info">
				<h1>${donate.donateTitle }</h1>
				<h2 class="y_donate_detail_text1">${donate.donateAmount }</h2>
				<p class="y_donate_detail_text1">${donate.donateHope }</p>
				<progress id="progress" class='progress'
					value="${donate.donateProgress }" min="0" max="100">${donate.donateProgress }</progress>

				<div class="y_donate_detail_list_box">
					<p>🥰 총 ${donate.userCount }명이 참여했습니다.</p>
				</div>
				<div class="y_donate_detail_list_box">
					<p>😎 현재 ${donate.donateProgress }% 달성</p>
				</div>
				<div class="y_donate_detail_list_box">
					<p>😎 ${donate.DDay} ${donate.donateEndDate  }</p>
				</div>
				<div class="y_donate_back_btn">
					<button class="y_donate_back_btn1" onclick="move(${donate.donateNo})">
						<a id="#btn-kakao-pay">기부하기</a>
					</button>
				</div>

			</div>
		</div>
		<div class="y_donate_detail_bottom">
			<div class="y_donate_detail_content">
				<h3>소개</h3>
				<p>${donate.donateContent }</p>
			</div>
			<div class="y_donate_detail_countList">
				<h3>최근 참여한 기부자</h3>
				<c:choose>
					<c:when test="${empty currentUser}">
						<p class="empty">아직 기부자가 없습니다. 첫번째 기부자가 되어주세요!</p>
					</c:when>
					<c:otherwise>
						<c:forEach items='${currentUser }' var='c'>
							<div class="y_donate_detail_list_box">
								<p>${c.rowNum}번째기부자</p>
								<p>${c.donateAmount }기부</p>
								<p>${c.optionalText }</p>
								<p>${c.donateDate }</p>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<script type="text/javascript">
			function move(dno){
				location.href="${contextPath}/donate/insert/"+dno
			}
			</script>

		</div>
		<div class="y_donate_back_btn">
			<button class="y_donate_back_btn1">
				<a href="${contextPath}/donate/list">목록</a>
			</button>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>