<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>활동보고서</title>
<style>
.note-editor.note-airframe .note-editing-area .note-editable {
	background-color: transparent !important;
}
</style>

<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/dowon.css/activityreportDetail.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>
		
		<div class="ar-wrapper1">
		
			<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">후원후기</h2>
			<div class="donateGoodFormBorder" style=" width: 150px; margin-left: auto; margin-right: auto;"></div>

			<div class="table-div">
				<table>
					<tr>
						<th class="header" style="width:150px;">종류</th>
						<td colspan="1" style="width: 20%;">
							<div name="reportType" value="P" >후원후기</div>
						</td>
						<th class="header" colspan="2">모집기간</th>
						<td colspan="1" style="width:300px;">${ar.donateStartDate} ~ ${ar.donateEndDate}</td>
						<th class="header">참여수</th>
						<td colspan="1">${ar.totalCount }</td>
					</tr>

					<tr>
						<th class="header">제목</th>
						<td class="span-two" colspan="6">${ar.reportTitle}</td>
					</tr>

					<tr>
						<th class="header">총금액</th>
						<td class="span-two" colspan="2"><fmt:formatNumber value="${ar.sumDonate}" type="currency" pattern="#,###"/>원</td>
						
						<th class="header" style="width:100px;">목표금액</th>
						<td class="span-two" style="width:200px;"><fmt:formatNumber value="${ar.donateHope}" type="currency" pattern="#,###"/>원</td>
						<th class="header" style="width:115px;">달성률</th>
						<td class="span-two" colspan="2" style="width:100px;">${ar.achRate}%</td>
					</tr>

					<tr>
						<th class="header" style="height: 500px;">활동내용</th>
						<td class="span-two" colspan="6">${ar.reportContent}</td>
					</tr>
				</table>
			</div>

			<div class="btn-group">
				<div class="detail-btn">
					<button class="list-btn"
						onclick="window.location.href='${contextPath}/activityreport/D'">목록</button>
					<button class="list-btn" onclick="window.location.href='${contextPath}/donate/detail/${ar.donateNo}'">후원 상세보기</button>
					<c:choose>
						
						<c:when test="${empty loginUser}">
						</c:when>
						<c:when test="${not empty loginUser && loginUser.userNo eq 1}">
							<button class="list-btn"
						onclick="location.href='${contextPath}/activityreport/update/D/${ar.reportNo}'">수정</button>
							<button class="list-btn"
								onclick="deleteReport();">삭제</button>
						</c:when>
					</c:choose>
					
				</div>
			</div>
		</div>

	</main>
	<script>
	function deleteReport(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href = '${contextPath}/activityreport/delete/D/${ar.reportNo}'
		}
	}
	</script>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>