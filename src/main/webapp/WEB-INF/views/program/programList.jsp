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
					<input type="radio" name="active_type" id="1" value="1"
						class="y_checkbox" ${param.active_type eq '1'? 'checked':'' }></input> <label for="1" class="y_checkbox1">정기활동</label>
					<input type="radio" name="active_type" id="2" value="2"
						class="y_checkbox" ${param.active_type eq '2'? 'checked':'' }></input> <label for="2" class="y_checkbox1">일시활동</label>
				</div>

				<p>활동 지역</p>
				<div class="y_program_filter">
					<input type="radio" name="active_location" id="s" value="서울"
						class="y_checkbox" ${param.active_location eq '서울'? 'checked':'' }></input> <label for="s" class="y_checkbox1">서울&경기</label>
					<input type="radio" name="active_location" id="g" value="강원"
						class="y_checkbox" ${param.active_location eq '강원'? 'checked':'' }></input> <label for="g" class="y_checkbox1">강원</label>
					<input type="radio" name="active_location" id="c" value="충청"
						class="y_checkbox" ${param.active_location eq '충청'? 'checked':'' }></input> <label for="c" class="y_checkbox1">충청</label>
					<input type="radio" name="active_location" id="j" value="전라"
						class="y_checkbox" ${param.active_location eq '전라'? 'checked':'' }></input> <label for="j" class="y_checkbox1">전라</label>
					<input type="radio" name="active_location" id="k" value="경상"
						class="y_checkbox" ${param.active_location eq '경상'? 'checked':'' }></input> <label for="k" class="y_checkbox1">경상</label>
				</div>

				<p>활동 시간대</p>
				<div class="y_program_filter">
					<input type="radio" name="active_time" id="1" value="1"
						class="y_checkbox" ${param.active_time eq '1'? 'checked':'' }></input> <label for="1" class="y_checkbox1">오전</label>
					<input type="radio" name="active_time" id="1" value="2"
						class="y_checkbox" ${param.active_time eq '2'? 'checked':'' }></input> <label for="1" class="y_checkbox1">오후</label>
				</div>

				<p>활동 요일</p>
				<div class="y_program_filter">
					<input type="radio" name="active_days" id="1" value="1"
						class="y_checkbox" ${param.active_days eq '1'? 'checked':'' }></input> <label for="1" class="y_checkbox1">평일</label>
					<input type="radio" name="active_days" id="2" value="2"
						class="y_checkbox" ${param.active_days eq '2'? 'checked':'' }></input> <label for="2" class="y_checkbox1">주말</label>
				</div>

				<button class="y_program_list_btn" type="submit" onclick="filter()">조회</button>
			</form>
				<button class="y_program_list_btn">
					<a href="${contextPath }/program/insert">글쓰기</a>
				</button>

		</div>

		<h1 class="y_h1">봉사하기</h1>
		<div class="y_activeOnly_area">
			<p>진행중인 활동만</p>
			<img src="../../resources/style/img/yunbi/check-circle.svg"
				onclick="toggleIng();" class="y_image_activityOnly no" />
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
							<td colspan="5">게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="p" items="${list}">
							<tr onclick="move(${p.programNo})">
								<td class="left-align">${p.programNo}</td>
								<td class="list-left">${p.programName}</td>
								<td class="left-align">${p.activityType }</td>
								<td class="left-align">${p.programActivityStartDate }~
									${p.programActivityEndDate }</td>
								<td class="left-align">매주 ${p.activityDays}</td>
								<td class="left-align">${p.activityTime }</td>
								<td class="left-align">${p.activityLocation }</td>
								<c:choose>
									<c:when test="${empty p.programActivityEndDate}">
										<td class="left-align">알수없음</td>
									</c:when>
									<c:when test="${p.programActivityEndDate gt now}">
										<td class="left-align">활동중</td>
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
				<c:if test="${pi.currentPage ne 1}">
					<li class="page-item"><a class="page-link"
						href="?currentPage=${pi.currentPage-1}${url}">Previous</a></li>
				</c:if>
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item"><a class="page-link"
						href="?currentPage=${p}${url}">${p}</a></li>
				</c:forEach>
				<c:if test="${pi.currentPage ne pi.maxPage}">
					<li class="page-item"><a class="page-link"
						href="?currentPage=${pi.currentPage+1}${url}">Next</a></li>
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
				</script>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>