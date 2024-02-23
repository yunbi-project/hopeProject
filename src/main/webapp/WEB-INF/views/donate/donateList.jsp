<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부하기 리스트</title>
<link rel="stylesheet"
	href="../resources/style/css/yunbi.css/yProgramDonate.css">
<script src="../resources/js/yunbi.js/yProgramDonate.js"></script>
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
		<div class="y_donate_top1">
			<h1>기부하기</h1>
		</div>
		<div class="y_donate_top2">
			<span>진행중인 활동만</span> <img
				src='../resources/images/donate/check-circle.svg'
				onclick="toggleIng()" class="y_image_activityOnly no" />
		</div>

		<div class="y_list">
			<c:choose>
				<c:when test="${empty list}">
					<p>게시글이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="d">
						<div class="y_list_box" onclick="detail(${d.donateNo})">
							<img src='../resources/style/img/sample1.png'
								class="y_list_image"  onclick="detail(${d.donateNo})"></img> <span>${d.donateTitle}</span>
							<progress value="${d.donateProgress }" min="0" max="100"
								id="progress"></progress>
							<span>${d.DDay}</span> <span class="y_floatRight">
								${d.donateProgress}%</span>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
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
					<form class="search-form" method="get" action="${contextPath}/donate/list">
						<div class="archive-search">
							<div class="Sn-btn">
								<select class="custom-select" name="condition">
									<option value="content"
										${param.condition eq 'content'? 'selected':'' }>내용</option>
									<option value="title"
										${param.condition eq 'title'? 'selected':'' }>제목</option>
									<option value="writer"
										${param.condition eq 'writer'? 'selected':'' }>작성자</option>

								</select> <input type="text"
									class="archive-search-text input-md width-280px" name="keyword"
									value="${param.keyword}" placeholder="제목 또는 내용 검색을 입력하세요">
								<input type="submit" class="green" value="검색">
							</div>
						</div>
					</form>
		<script>
			function detail(donateNo){
				location.href="${contextPath}/donate/detail/"+donateNo
			}
		</script>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>