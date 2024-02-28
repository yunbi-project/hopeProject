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
			<div class="toggle"></div>
				<c:if test="${like > 0}">
			<img src="${contextPath }/resources/style/img/yunbi/heart-fill.svg" class="heart_logo yes" onclick="toggleLike()"></img>
				</c:if>
				<c:if test="${like == 0}">
			<img src="${contextPath }/resources/style/img/yunbi/heart.svg" class="heart_logo no" onclick="toggleLike()"></img>
				</c:if>
			<h1>${program.programName }</h1>
<%-- 			<img src="${contextPath }/resources/style/img/yunbi/sample1.png" --%>
<!-- 				class="y_program_detail_main_img"></img> -->

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
			<c:if test="${requestCount > 0}">
				<button class="y_program_btn1" disabled >지원완료</button>
			</c:if>
			<c:if test="${requestCount == 0 }">
				<button class="y_program_btn1" onclick='requestProgram()'>지원하기</button>
			</c:if>			
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
					$.ajax({
						url : '${contextPath}/program/detail/request/' + ${programNo},
						data : {userNo: ${loginUser.userNo}},
						type : 'post',
						success : function(result) {
							if(result>0){
							window.location.reload();
							alert("지원완료");
							
							}else{
								alert("실패");
							}
						}
					})
				}
				
				function toggleLike() {
					if(document.querySelector('.heart_logo').classList.contains('no')){
						$.ajax({
							url : '${contextPath}/program/detail/like/'+ ${programNo},
							data : {userNo: ${loginUser.userNo}},
							type : 'post', // POST 메서드 사용
							success : function(result) {
								let likeIcon = $(`.heart_logo`);
								if (result > 0) { // 좋아요 하지 않은 상태
									$('.heart_logo')
											.attr('src',
													'${contextPath}/resources/style/img/yunbi/heart-fill.svg');
									likeIcon.addClass("yes");
									likeIcon.removeClass("no");
									alert("관심있는 게시글 저장했습니다. 마이페이지에서 확인해주세요.");
								} else {
									alert("실패");
								}
							}
						});
					} else {
						$.ajax({
							url : '${contextPath}/program/detail/unlike/'+ ${programNo},
							type : "POST",
							data :{userNo: ${loginUser.userNo}},
							success: function(result) {
								let likeIcon = $(`.heart_logo`);
				                   if(result > 0){
				                	   $('.heart_logo').attr('src',
										'${contextPath}/resources/style/img/yunbi/heart.svg');
										likeIcon.addClass("no");
										likeIcon.removeClass("yes");
										alert("게시물 즐겨찾기를 취소했습니다.");
				                   }
				               },
				               error: function(xhr, status, error) {
				                   // 서버 요청이 실패한 경우 에러 메시지 출력
				                   console.error('서버 요청 실패:', error);
				               }
						});
					}
				}
				
				function deleteBoard(boardNo) {
			        var boardTypeNo = 'N'; // boardTypeNo 값을 설정하거나 동적으로 가져옵니다.
			        var url = '${contextPath}/board/delete/' + boardNo + '?boardTypeNo=' + boardTypeNo;
			        window.location.href = url;
			    }
				function stripHtmlTags(html) {
				    let doc = new DOMParser().parseFromString(html, 'text/html');
				    return doc.body.textContent || "";
				}
				/*썸머노트*/
				$(document).ready(function() {
				    var text = "${b.boardContent}";
				    text = stripHtmlTags(text); // HTML 태그 제거

				    // 썸머노트 초기화
				    $('#summernote').summernote({
				        toolbar: [], // 툴바 비활성화 (읽기 전용으로 설정)
				        airMode: true, // 에어모드 활성화
				        disableResizeEditor: true, // 에디터 크기 조절 비활성화
				        focus: false, // 포커스 설정 (선택사항)
				        codeview: false // 코드 보기 비활성화
				    });

				    // 썸머노트에 텍스트 삽입
				    $('#summernote').summernote('code', text);

				    // 에디터를 비활성화하여 사용자의 입력을 막습니다.
				    $('#summernote').summernote('disable');
				});

			</script>
		</div>
	</section>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>