<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page import="java.time.LocalDate"%>
<c:set var="now" value="<%=LocalDate.now()%>" />
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
			<p>희망의 조각과 함께하는 자원봉사는 아이들의 행복한 삶을 응원하는 또 하나의 방법입니다.</p>
		</article>
	</section>
	<section>
		<div class="y_program_detail">
			<div class="y_program_detail">
				<div id="y_title_area" style="justify-content: space-between; align-items: center;">

					<!-- 버튼들 -->
					<div class="y_donate_back_btn" style="text-align: right;">
					<c:if test="${loginUser.userNo != null && loginUser.userNo ne program.userNo }">
						<!-- 지원완료 버튼 -->
						<c:choose>
							<c:when test="${program.result eq '마감'}">
								<button class="y_donate_back_btn2" disabled>신청마감</button>
							</c:when>
							<c:otherwise>
								<c:if test="${requestCount > 0}">
									<button class="y_donate_back_btn2" disabled>신청완료</button>
								</c:if>
								<!-- 지원하기 버튼 -->
								<c:if test="${requestCount == 0}">
									<button class="y_donate_back_btn1" onclick='requestProgram()' style="margin-right: 5px;">신청하기</button>
								</c:if>
							</c:otherwise>
							</c:choose>
						<!-- 관심목록 담기/취소 버튼 -->
						<c:if test="${like > 0}">
							<button class="heart_logo y_donate_back_btn1 yes" onclick="toggleLike()" style="margin-right: 5px;">관심목록취소</button>
						</c:if>
						<c:if test="${like == 0}">
							<button class="heart_logo y_donate_back_btn1 no" onclick="toggleLike()" style="margin-right: 5px;">관심목록담기</button>
						</c:if>
						</c:if>
						<c:if test="${loginUser.userNo != null && loginUser.userNo ne program.userNo || loginUser.userNo eq 1 }">
							<button class="y_donate_back_btn1" onclick="location.href = '<%=request.getContextPath() %>/chat/${chatNo}'">채팅방입장</button>
						</c:if>
						<!-- 관리자인 경우 보이는 버튼 -->
						<c:if test="${loginUser.userNo eq program.userNo || loginUser.userNo eq '1'}">
							<button class="y_donate_back_btn1" onclick="location.href = '${contextPath}/program/update/${programNo}'">수정하기</button>
							<button class="y_donate_back_btn1" onclick="deleteProgram()">삭제하기</button>
						</c:if>
					</div>
				</div>
				<!-- 프로그램명 -->
				<h1 id="programName-area" style="margin-top: 20px;"> 
					<span id="color">${program.result}</span>
					${program.programName }</h1>
			</div>

			<table class="y_table">
				<tr>
					<td>봉사 기간</td>
					<td>${program.sdate}~
						${program.edate}</td>
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
					<td>${program.enroll }까지</td>
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
					<td>내용</td>
					<td>${program.programContent }</td>
				</tr>
			</table>
			<!-- 목록 버튼 -->
			<div class="y_donate_back_btn"
				style="text-align: center; margin-top: 20px;">
				<button class="y_donate_back_btn1" onclick="location.href = '${contextPath}/program/list'">목록</button>
			</div>
			<script>
				function requestProgram() {
					if(confirm("봉사활동을 신청하시겠습니까?")){
						$.ajax({
							url : '${contextPath}/program/detail/request/' + ${programNo},
							data : {userNo: ${userNo}},
							type : 'post',
							success : function(result) {
								if(result>0){
									window.location.reload();
									alert("신청이 완료되었습니다. 마이페이지에서 신청내역을 확인해주세요.");
								}else{
									alert("모집인원 및 모집기간을 확인해주세요.");
								}
							}
						});
					}else{
					window.location.reload();
					}
				}
				
				function toggleLike() {
					if(document.querySelector('.heart_logo').classList.contains('no')){
						$.ajax({
							url : '${contextPath}/program/detail/like/'+ ${programNo},
							data : {userNo: ${userNo}},
							type : 'post', // POST 메서드 사용
							success : function(result) {
								let likeIcon = $(`.heart_logo`);
								if (result > 0) {
									if(confirm("관심목록으로 등록하시겠습니까?")){
										likeIcon.addClass("yes");
										likeIcon.removeClass("no");
										alert("관심있는 게시글 저장했습니다. 마이페이지에서 확인해주세요.");
									}
								} else {
									alert("실패");
								}
								window.location.reload();
							}
						});
					} else {
						$.ajax({
							url : '${contextPath}/program/detail/unlike/'+ ${programNo},
							type : "POST",
							data :{userNo: ${userNo}},
							success: function(result) {
								let likeIcon = $(`.heart_logo`);
				                   if(result > 0){
										if(confirm("관심목록을 취소하시겠습니까?")){
											likeIcon.addClass("no");
											likeIcon.removeClass("yes");
										}
				                   }else{
				                	   alert("관심목록 취소가 완료되었습니다.");
				                   }
				                   window.location.reload();
				               },
				               error: function(xhr, status, error) {
				                   // 서버 요청이 실패한 경우 에러 메시지 출력
				                   console.error('서버 요청 실패:', error);
				               }
						});
					}
				}
				
				function deleteProgram(){
					if(confirm("게시글을 삭제하시겠습니까?")){
						location.href = '${contextPath}/program/delete/${programNo}'
					}
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>