<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		
			<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">봉사활동 보고서</h2>
			<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>

			<div class="table-div">
				<table>
					<tr>
						<th class="header">작성일자</th>
						<td colspan="2" style="width: 20%;">${ar.createDate}</td>
						<th class="header" colspan="2">모집기간</th>
						<td colspan="2" style="width:300px;">${ar.programActivityStartDate} ~ ${ar.programActivityEndDate}</td>
					</tr>

					<tr>
						<th class="header">제목</th>
						<td class="span-two" style="width: 700px;" colspan="6">${ar.reportTitle}</td>
					</tr>

					<tr>
						<th class="header">활동시간</th>
						<td class="span-two" colspan="2">
							<c:if test="${ar.activityTime eq 1 and ar.activityDays eq 1}">
                            	오전, 평일
                            </c:if>
                            <c:if test="${ar.activityTime eq 1 and ar.activityDays eq 2}">
                            	오전, 주말
                            </c:if>
                            <c:if test="${ar.activityTime eq 2 and ar.activityDays eq 1}">
                            	오후, 평일
                            </c:if>
                            <c:if test="${ar.activityTime eq 2 and ar.activityDays eq 2}">
                            	오후, 주말
                            </c:if>
						</td>
						<th class="header" style="width:100px;">지역</th>
						<td class="span-two" style="width:200px;">${ar.activityLocation }</td>
						<th class="header" style="width:150px;">참여인원/제한수</th>
						<td class="span-two" colspan="2" style="width:100px;">${ar.requestTotal} / ${ar.programCapacity }</td>
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
						onclick="window.location.href='${contextPath}/activityreport/P'">목록</button>
					<button class="list-btn" onclick="window.location.href='${contextPath}/program/detail/${ar.programNo}'">봉사 상세보기</button>
					<c:choose>
						
						<c:when test="${empty loginUser}">
						</c:when>
						<c:when test="${not empty loginUser && loginUser.userNo eq 1}">
							<button class="list-btn"
						onclick="location.href='${contextPath}/activityreport/update/P/${ar.reportNo}'">수정</button>
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
			location.href = '${contextPath}/activityreport/delete/P/${ar.reportNo}'
		}
	}
	</script>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>