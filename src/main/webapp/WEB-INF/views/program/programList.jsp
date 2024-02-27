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
	href="../resources/style/css/yunbi.css/yProgramDonate.css">
<link rel="stylesheet" href="../resources/style/css/common.css">
<script src="../resources/js/yunbi.js/yProgramDonate.js"></script>
<script src="../resources/js/common/header.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
		<article class="h_boardTitle">
			<h1>자원봉사</h1>
			<p>자원봉사 함께 나아가는 더 나은 세상.</p>
		</article>
	</section>
	<section>
		<div class="y_program_list_filter">
			<c:if test="${not empty param.active_type}">
				<c:set var="url"
					value="&active_type=${param.active_type}&active_location=${param.active_location}&active_time=${param.active_time}&active_days=${param.active_days}" />
			</c:if>
			
			<form class="y_program_list_area" method="get" action="${contextPath}/program/list">
				<p>활동 유형</p>
				<div class="y_program_filter">
					<input type="radio" name="active_type" id="active_type_1" value="1" class="y_checkbox" ${param.active_type eq '1'? 'checked':'' }></input>
					<label for="active_type_1" class="y_checkbox1">정기활동</label> 
					<input type="radio" name="active_type" id="active_type_2" value="2" class="y_checkbox" ${param.active_type eq '2'? 'checked':'' }></input> 
					<label for="active_type_2" class="y_checkbox1">일시활동</label>
				</div>

				<p>활동 지역</p>
				<div class="y_program_filter">
					<input type="radio" name="active_location" id="active_location_1" value="1" class="y_checkbox" ${param.active_location eq '1'? 'checked':'' }></input>
					<label for="active_location_1" class="y_checkbox1">서울&경기</label>
					<input type="radio" name="active_location" id="active_location_2" value="2" class="y_checkbox" ${param.active_location eq '2'? 'checked':'' }></input>
					<label for="active_location_2" class="y_checkbox1">강원</label>
					<input type="radio"name="active_location" id="active_location_3" value="3" class="y_checkbox" ${param.active_location eq '3'? 'checked':'' }></input>
					<label for="active_location_3" class="y_checkbox1">충청</label>
					<input type="radio"name="active_location" id="active_location_4" value="4" class="y_checkbox" ${param.active_location eq '4'? 'checked':'' }></input>
					<label	for="active_location_4" class="y_checkbox1">전라</label> 
					<input type="radio"	name="active_location" id="active_location_5" value="5" class="y_checkbox" 	${param.active_location eq '5'? 'checked':'' }></input>
					<label for="active_location_5" class="y_checkbox1">경상</label>
				</div>

				<p>활동 시간대</p>
				<div class="y_program_filter">
					<input type="radio" name="active_time" id="active_time_1" value="1"	class="y_checkbox" ${param.active_time eq '1'? 'checked':'' }></input>
					<label for="active_time_1" class="y_checkbox1">오전</label>
					<input type="radio" name="active_time" id="active_time_2" value="2" class="y_checkbox"	${param.active_time eq '2'? 'checked':'' }></input>
					<label for="active_time_2" class="y_checkbox1">오후</label>
				</div>

				<p>활동 요일</p>
				<div class="y_program_filter">
					<input type="radio" name="active_days" id="active_days_1" value="1"	class="y_checkbox" ${param.active_days eq '1'? 'checked':'' }></input>
					<label for="active_days_1" class="y_checkbox1">평일</label>
					<input type="radio" name="active_days" id="active_days_2" value="2" class="y_checkbox" ${param.active_days eq '2'? 'checked':'' }></input>
					<label for="active_days_2" class="y_checkbox1">주말</label>
				</div>
				<button class="y_program_list_btn" type="submit">조회</button>
				<button class="y_program_list_btn" type="button" onclick="resetFilters()">초기화</button>
			</form>
			<button class="y_program_list_btn">
				<a href="${contextPath }/program/insert">글쓰기</a>
			</button>

		</div>

		<div class="y_activeOnly_area">
			<p>지원가능한 활동만</p>
			<input type="checkbox"
				src="${contextPath }/resources/style/img/yunbi/check-circle.svg"
				onclick="toggleIng();" class="y_image_activityOnly no"
				${param.ingOnly eq 'true'? 'checked':'' } />
		</div>
		<table class="y_list_table">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>활동유형</td>
					<td>활동기간</td>
					<td>활동요일</td>
					<td>활동시간대</td>
					<td>활동지역</td>
					<td>진행여부</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="8">게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="p" items="${list}">
							<tr onclick="move(${p.programNo})">
								<td class="left-align">${p.programNo}</td>
								<td class="list-left">${p.programName}</td>
								<c:if test="${p.activityType eq '1'}">
									<td class="left-align">정기</td>
								</c:if>
								<c:if test="${p.activityType eq '2'}">
									<td class="left-align">일시</td>
								</c:if>
								<td class="left-align">${p.programActivityStartDate }~
									${p.programActivityEndDate }</td>
								<c:if test="${p.activityDays eq '1'}">
									<td class="left-align">평일</td>
								</c:if>
								<c:if test="${p.activityDays eq '2'}">
									<td class="left-align">주말</td>
								</c:if>
								<c:if test="${p.activityTime eq '1'}">
									<td class="left-align">오전</td>
								</c:if>
								<c:if test="${p.activityTime eq '2'}">
									<td class="left-align">오후</td>
								</c:if>
								<td class="left-align">${p.activityLocation }</td>
								<c:choose>
									<c:when test="${empty p.programEnrollEndDate}">
										<td class="left-align">알수없음</td>
									</c:when>
									<c:when test="${p.programEnrollEndDate gt now}">
										<td class="left-align">지원가능</td>
									</c:when>
									<c:otherwise>
										<td class="left-align">마감</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<c:if test="${not empty param.condition}">
			<c:set var="url"
				value="&condition=${param.condition}&keyword=${param.keyword}" />
		</c:if>
		<div id="pagingArea">
			<ul class="pagination">
				<c:if test="${list.size() >= 10}">
					<c:if test="${pi.currentPage ne 1}">
						<li class="page-item"><a class="page-link"
							href="?currentPage=${pi.currentPage-1}${url}"
							onclick="goToPage(${pi.currentPage-1})">Previous</a></li>
					</c:if>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<li class="page-item"><a class="page-link"
							href="?currentPage=${p}${url}" onclick="goToPage(${p})">${p}</a></li>
					</c:forEach>
					<c:if test="${pi.currentPage ne pi.maxPage}">
						<li class="page-item"><a class="page-link"
							href="?currentPage=${pi.currentPage+1}${url}"
							onclick="goToPage(${pi.currentPage+1})">Next</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
		<form class="search-form" method="get"
			action="${contextPath}/program/list">
			<div class="archive-search">
				<div class="Sn-btn">
					<select class="custom-select" name="condition">
						<option value="writer"
							${param.condition eq 'writer'? 'selected':'' }>작성자</option>
						<option value="title"
							${param.condition eq 'title'? 'selected':'' }>제목</option>
					</select> <input type="text"
						class="archive-search-text input-md width-280px" name="keyword"
						value="${param.keyword}" placeholder="제목 또는 내용 검색을 입력하세요">
					<input type="submit" class="green" value="검색">
				</div>
			</div>
		</form>
		<script>
					function move(programNo){
						location.href="${contextPath}/program/detail/"+programNo
					}
					
					function toggleIng() {
						let icon = $(`.y_image_activityOnly`);

						if (icon.prop("checked")) { //좋아요 하지 않은 상태
							location.href = '${contextPath}/program/list?ingOnly=true';
						} else { //좋아요 한 상태
							location.href = '${contextPath}/program/list';
						}
					}
				</script>
				<script>
    function resetFilters() {
        // 모든 라디오 버튼 선택 해제
        document.querySelectorAll('input[type="radio"]').forEach((radio) => {
            radio.checked = false;
        });

        // URL 매개변수 제거
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.delete('active_type');
        urlParams.delete('active_location');
        urlParams.delete('active_time');
        urlParams.delete('active_days');

        // 초기화된 URL로 리다이렉트
        window.location.href = `${window.location.pathname}?${urlParams.toString()}`;
    }
</script>
				
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>