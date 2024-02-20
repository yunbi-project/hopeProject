<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="../resources/style/css/sangjun.css/SreviewList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		<section>
			<article class="h_boardTitle">
				<h1>자원봉사</h1>
				<p>자원봉사 함께 나아가는 더 나은 세상.</p>
			</article>
		</section>
		<div class="Sn-wrapper1">
			<div class="Sn-wrapper2">
				<div>
					<div>
						<div>
							<div>
								<div class="Sn-TextLabel">나눔후기</div>
							</div>
						</div>
					</div>

					<div class="Sn-selection">
						<div>
							<div class="Sn-component-1">
								<div class="Sn-chip-1">
									<div class="Sn-text-1">글쓰기</div>
								</div>
								<div class="Sn-chip-2">
									<div class="Sn-text-2">이야기</div>
								</div>
							</div>
						</div>
					</div>

					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<div class="Sn-row">
								<div class="Sn-article">
									<div class="Sn-image-container">
										<div class="Sn-notice-image">
											<img src="../resources/images/board/HOPE_logo.png">
										</div>
									</div>
									<div class="Sn-notice-frame">
										<div class="Sn-notie-title">글제목</div>
										<p class="Sn-notice-date">작성날짜</p>
										<p class="Sn-notice-count">조회수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<div class="Sn-row">
								<div class="Sn-article">
									<div class="Sn-image-container">
										<div class="Sn-notice-image">
											<img src="/css/images/2_WOS (1).jpg">
										</div>
									</div>
									<div class="Sn-notice-frame">
										<div class="Sn-notie-title">글제목</div>
										<p class="Sn-notice-date">작성날짜</p>
										<p class="Sn-notice-count">조회수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<div class="Sn-row">
								<div class="Sn-article">
									<div class="Sn-image-container">
										<div class="Sn-notice-image">
											<img src="/css/images/chunsickbackground.png">
										</div>
									</div>
									<div class="Sn-notice-frame">
										<div class="Sn-notie-title">글제목</div>
										<p class="Sn-notice-date">작성날짜</p>
										<p class="Sn-notice-count">조회수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<div class="Sn-row">
								<div class="Sn-article">
									<div class="Sn-image-container">
										<div class="Sn-notice-image">
											<img src="/css/images/user0.jpg">
										</div>
									</div>
									<div class="Sn-notice-frame">
										<div class="Sn-notie-title">글제목</div>
										<p class="Sn-notice-date">작성날짜</p>
										<p class="Sn-notice-count">조회수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<div class="Sn-row">
								<div class="Sn-article">
									<div class="Sn-image-container">
										<div class="Sn-notice-image">
											<img src="/css/images/user1.jpg">
										</div>
									</div>
									<div class="Sn-notice-frame">
										<div class="Sn-notie-title">글제목</div>
										<p class="Sn-notice-date">작성날짜</p>
										<p class="Sn-notice-count">조회수</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="Sn-section">
						<div class="Sn-notice-container"></div>
						<div class="Sn-list">
							<div class="Sn-row">
								<div class="Sn-article">
									<div class="Sn-image-container">
										<div class="Sn-notice-image">
											<img src="/css/images/2_WOS (1).jpg">
										</div>
									</div>
									<div class="Sn-notice-frame">
										<div class="Sn-notie-title">글제목</div>
										<p class="Sn-notice-date">작성날짜</p>
										<p class="Sn-notice-count">조회수</p>
									</div>
								</div>
							</div>
						</div>
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
					<form class="search-form" method="get" action="N">
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
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>