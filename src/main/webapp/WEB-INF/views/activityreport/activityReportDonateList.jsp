<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>활동보고서</title>
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/SnoticeList.css">
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/dowon.css/activityReportList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<main>
		<section>
			<article class="boardTitle">
				<h1>활동보고서</h1>
				<p>희망의 조각은 활동보고서를 통해 후원금의 사용을 투명하게 공개합니다.</p>
			</article>
		</section>

		<div class="Sn-wrapper1">
			<div class="Sn-wrapper2">
				<div>
					<div>
						<div>
							<div>
								<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">후원후기</h2>
        						<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
							</div>
						</div>
					</div>
					
					<div style="text-align: right;">
						<button type="button" class="list-btn" onclick="window.location.href='${contextPath}/activityreport/P'" value="D">봉사활동 보기</button>
					</div>


<!-- 							<thead> -->
<!-- 								<th>번호</th> -->
<!-- 								<th>제목</th> -->
<!-- 								<th>작성자</th> -->


<!-- 							</thead> -->
<!-- 							<tbody> -->
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${empty list}"> --%>
<!-- 										<tr> -->
<!-- 											<td colspan="5">게시글이 없습니다.</td> -->
<!-- 										</tr> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<c:forEach var="ar" items="${list}"> --%>
<%-- 											<tr onclick="movePage(${ar.reportNo})"> --%>
<%-- 												<td>${ar.reportNo}</td> --%>
<%-- 												<td>${ar.reportTitle}</td> --%>
<!-- 												<td>관리자</td> -->

<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>


<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->

					<section class="donateListSection">
						<c:choose>
							<c:when test="${empty list}">
								<div class="Sn-section">
									<thead>
									</thead>
									<tbody>
										<tr> 
											<td colspan="5">게시글이 없습니다.</td>
 										</tr>
									</tbody>
									<table class="Sn-table program">
									</table>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="ar">
									<div class="donateList" onclick="movePage(${ar.reportNo})">
										<div class="donateImg">
											<c:if test="${ar.changeName ne null}">
												<img src="${contextPath}/resources/images/donate/${ar.changeName}">
											</c:if>
											<c:if test="${ar.changeName eq null}">
												<img src="https://msf.or.kr/sites/all/themes/msfkorea/images/img-high-value-slide-04.jpg">
											</c:if>
										</div>
										<div class="donateContent">
											<span>${ar.reportTitle}</span>
											<span>${ar.createDate} </span>
											<progress
						                        class="progress"
						                        id="progress"
						                        value="${ar.achRate }"
						                        min="0"
						                        max="100"
						                    ></progress>
						                    <div class="progress_value">
						                    	<span><fmt:formatNumber value="${ar.sumDonate}" type="currency" pattern="#,###"/>원</span>
						                    	<span><fmt:formatNumber value="${ar.donateHope}" type="currency" pattern="#,###"/>원</span>
						                    </div>
						                    <div class="progress_rate">
						                    	<span>${ar.achRate }%</span>
						                    	<span>후원 종료</span>
						                    </div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</section>
					

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

				</div>
			</div>
		</div>
	</main>
	<script>
		function movePage(arno){
			location.href="${contextPath}/activityreport/D/"+arno
		}
	</script>
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>