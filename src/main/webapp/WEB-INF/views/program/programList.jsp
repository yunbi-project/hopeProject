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
			<p>희망의 조각과 함께하는 자원봉사는 아이들의 행복한 삶을 응원하는 또 하나의 방법입니다.</p>
		</article>
	</section>
	<section>
		<div class="y_program_list_filter">
			<c:if test="${not empty param.active_type}">
				<c:set var="url"
				value="&active_type=${param.active_type}&active_location=${param.active_location}&active_time=${param.active_time}&active_days=${param.active_days}" /> 
		</c:if>
		</div>
		
		<h2 style="text-align:center; font-size:25px;">봉사활동</h2>
		<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
		<div class="y_activeOnly_area">
			<p>지원가능한 활동만</p>
			<input type="checkbox"
				src="${contextPath }/resources/style/img/yunbi/check-circle.svg"
				onclick="toggleIng();" class="y_image_activityOnly no"
				${param.ingOnly eq 'true'? 'checked':'' } />
		</div>
		<table class="y_list_table">
		<colgroup>
        <col style="width: 5%;">
        <col style="width: 35%;">
        <col style="width: 20%;">
        <col style="width: 5%;">
        <col style="width: 5%;">
        <col style="width: 20%;">
        <col style="width: 5%;">
    </colgroup>
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>기간</td>
					<td>요일</td>
					<td>시간</td>
					<td>지역</td>
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
										<td class="left-align"><div class="a">알수없음</div></td>
									</c:when>
									<c:when test="${p.programEnrollEndDate gt now}">
										<td class="left-align"><div class="a">지원가능</div></td>
									</c:when>
									<c:otherwise>
										<td class="left-align"><div class="a">마감</div></td>
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
			</ul>
			<c:if test="${loginUser.userNo eq '1' }">
				<button class="y_program_list_btn" onclick="location.href='${contextPath }/program/insert'" style="cursor:pointer;">글쓰기</button>
			</c:if>
		</div>
		<form class="search-form" method="get"
			action="${contextPath}/program/list">
			<div class="archive-search">
				<div class="Sn-btn">
					<select class="custom-select" name="condition">
						<option value=location
							${param.condition eq 'location'? 'selected':'' }>지역</option>
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