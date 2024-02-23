<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${contextPath }/resources/style/css/yunbi.css/yProgramDonate.css">
<script src="${contextPath }/resources/js/yunbi.js/yProgramDonate.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section>
		<article class="h_boardTitle">
			<h1>자원봉사</h1>
			<p>아름다운가게는 경제, 사회, 환경이 조화를 이루며 공동체가 자립하고 성장하는 '지속가능한 변화'를 꿈꿉니다.
				이를 위해, 우리는 다양한 이해관계자들과 자발성, 상호성, 평등성에 기반한 관계를 구축하고 '참여를 통한 나눔' 문화를
				확산하기 위한 최선의 노력을 기울이고 있습니다.</p>
		</article>
	</section>
	<section>
		<div class="y_program_detail">
			<span>진행중</span><img
				src="${contextPath }/resources/style/img/yunbi/heart.svg"
				class="heart_logo no" onclick="toggleLike()"></img>
			<h1>${program.programName }</h1>
			<img src="${contextPath }/resources/style/img/yunbi/sample1.png"
				class="y_program_detail_main_img"></img>

			<table class="y_table">
				<tr>
					<td>봉사 기간</td>
					<td>${program.programActivityStartDate}~
						${program.programActivityEndDate}</td>
				</tr>
				<tr>
					<td>봉사 시간</td>
					<td>${program.activityTime }</td>
				</tr>
				<tr>
					<td>모집 기간</td>
					<td>${program.programEnrollEndDate }까지</td>
				</tr>
				<tr>
					<td>활동 요일</td>
					<td>${program.activityDays }</td>
				</tr>
				<tr>
					<td>모집 인원</td>
					<td>${count} / ${program.programCapacity }</td>
				</tr>
				<tr>
					<td>봉사 장소</td>
					<td>${program.activityLocation }</td>
				</tr>
				<tr>
					<td>봉사 유형</td>
					<td>${program.activityType }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${program.programContent }</td>
				</tr>
			</table>
			<div class="y_donate_back_btn">
				<button class="y_program_btn1" onclick='requestProgram()'>지원하기</button>
				<button class="y_donate_back_btn1" onclick="move()">목록</button>
			</div>
			<script>
				function move() {
					location.href = "${contextPath}/program/list";
				}

				function requestProgram() {
					let r = {
// 						userNo : '${loginUser.userNo}',
						programNo : '${programNo}'
					};
					$.ajax({
						url : '${contextPath}/program/detail/' + r.programNo,
						data : JSON.stringify(r),
						type : 'post',
						contentType : 'application/json;charset=UTF-8',
						success : function(result) {
							if (result === 0) {
								alert("지원 실패");
							} else {
								alert("지원 완료");
							}
						}
					})
				}
				function toggleIng() {
					let icon = $(`.y_image_activityOnly`);

					if (icon.hasClass("no")) { //좋아요 하지 않은 상태
						$('.y_image_activityOnly')
								.attr('src',
										'../../resources/style/img/yunbi/check-circle-fill.svg');
						alert('임시 alert : 진행중인 활동 On');
						icon.addClass("yes");
						icon.removeClass("no");
					} else { //좋아요 한 상태
						$('.y_image_activityOnly')
								.attr('src',
										'../../resources/style/img/yunbi/check-circle.svg');
						icon.removeClass("yes");
						icon.addClass("no");
					}
				}

				function toggleLike() {
					let likes = {
						// userNo: '${loginUser.userNo}',
						programNo : programNo
					// 프로그램 번호를 동적으로 설정해야 함
					};
					$
							.ajax({
								url : '${contextPath}/program/detail/'
										+ likes.programNo,
								data : JSON.stringify(likes),
								type : 'post', // POST 메서드 사용
								contentType : 'application/json;charset=UTF-8',
								success : function() {
									let likeIcon = $(`.heart_logo`);
									if (likeIcon.hasClass("no")) { // 좋아요 하지 않은 상태
										$('.heart_logo')
												.attr('src',
														'../../resources/style/img/yunbi/heart-fill.svg');
										alert('찜한 봉사활동은 마이페이지에서 확인 가능합니다.');
										likeIcon.addClass("yes");
										likeIcon.removeClass("no");
									} else { // 좋아요 한 상태
										// 좋아요를 취소하는 작업 수행
										// toggleUnlike(); // 이 부분을 좋아요 취소 작업으로 대체
										$('.heart_logo')
												.attr('src',
														'../../resources/style/img/yunbi/heart.svg');
										likeIcon.removeClass("yes");
										likeIcon.addClass("no");
									}
								}
							});
				}
			</script>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>