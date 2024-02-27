<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page import="java.time.LocalDate" %>
<c:set var="now" value="<%= LocalDate.now() %>" />
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
			<c:choose>
				<c:when test="${empty program.programEnrollEndDate}">
					<span>알수없음</span>
				</c:when>
				<c:when test="${program.programEnrollEndDate gt now}">
					<span>진행중</span>
				</c:when>
				<c:otherwise>
					<span>모집마감</span>
				</c:otherwise>
			</c:choose>
			<img src="${contextPath }/resources/style/img/yunbi/heart.svg"
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
					<c:if test="${program.activityTime eq '1'}">
						<td class="left-align">오전</td>
					</c:if>
					<c:if test="${program.activityTime eq '2'}">
						<td class="left-align">오후</td>
					</c:if>
				</tr>
				<tr>
					<td>모집 기간</td>
					<td>${program.programEnrollEndDate }까지</td>
				</tr>
				<tr>
					<td>활동 요일</td>
					<c:if test="${program.activityDays eq '1'}">
						<td class="left-align">평일</td>
					</c:if>
					<c:if test="${program.activityDays eq '2'}">
						<td class="left-align">주말</td>
					</c:if>
				</tr>
				<tr>
					<td>모집 인원</td>
					<td>${count}/${program.programCapacity }</td>
				</tr>
				<tr>
					<td>봉사 장소</td>
					<td>${program.activityLocation }</td>
				</tr>
				<tr>
					<td>봉사 유형</td>
					<c:if test="${program.activityType eq '1'}">
						<td class="left-align">정기</td>
					</c:if>
					<c:if test="${program.activityType eq '2'}">
						<td class="left-align">일시</td>
					</c:if>
				</tr>
				<tr>
					<td>내용</td>
					<td>${program.programContent }</td>
				</tr>
			</table>
			<div class="y_donate_back_btn">
				<button class="y_program_btn1" onclick='requestProgram()'>지원하기</button>
				<button class="y_program_btn1" onclick="join()">채팅방 입장하기</button>
			</div>
			<div class="y_donate_list_btn">
				<button class="y_donate_back_btn1" onclick="move()">목록</button>
				</div>
			<script>
				function move() {
					location.href = "${contextPath}/program/list";
				}
				function join() {
// 					location.href = "${contextPath}//list";
				}

				function requestProgram() {
					let r = {
						userNo : '${loginUser.userNo}',
						programNo : '${programNo}'
					};
					$.ajax({
						url : '${contextPath}/program/detail/' + r.programNo,
						data : JSON.stringify(r),
						type : 'post',
						contentType : 'application/json;charset=UTF-8',
						success : function(result) {
							if(count > program.programCapacity){
								if (result === 0) {
									alert("지원 실패");
								} else {
									alert("지원 완료");
								}
							}
						}
					})
				}


				function toggleLike() {
					let likes = {
						userNo: '${loginUser.userNo}',
						programNo : '${programNo}'
					// 프로그램 번호를 동적으로 설정해야 함
					};
					
				$.ajax({
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
											'${contextPath}/resources/style/img/yunbi/heart-fill.svg');
							alert('찜한 봉사활동은 마이페이지에서 확인 가능합니다.');
							likeIcon.addClass("yes");
							likeIcon.removeClass("no");
						} else { // 좋아요 한 상태
							// 좋아요를 취소하는 작업 수행
							// toggleUnlike(); // 이 부분을 좋아요 취소 작업으로 대체
							$('.heart_logo')
									.attr('src',
											'${contextPath}/resources/style/img/yunbi/heart.svg');
							likeIcon.removeClass("yes");
							likeIcon.addClass("no");
						}
					}
				});
				}

				function alertMessage() {
					var alertMessage = "${alertMessage}";
					if (alertMessage !== "") {
						alert(alertMessage);
						// 또는 모달 창을 띄워 메시지를 보여줄 수도 있습니다.
					}
				}
				window.onload = alertMessage;
			</script>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>