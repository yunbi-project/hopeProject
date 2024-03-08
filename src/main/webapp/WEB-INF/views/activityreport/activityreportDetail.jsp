<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<section>
			<article class="activityreportTitle">
				<h1>자원봉사</h1>
				<p>자원봉사 함께 나아가는 더 나은 세상.</p>
			</article>
		</section>
		
		<div class="ar-wrapper1">
		
			<div class="ar-TextLabel">활동보고서</div>

			<div class="table-div">
				<table>
					<tr>
						<th class="header">작성일자</th>
						<td colspan="2" style="width: 30%;">${ar.createDate}</td>
						<th class="header" colspan="2">작성자</th>
						<td colspan="2">관리자</td>
					</tr>

					<tr>
						<th class="header">제목</th>
						<td class="span-two" colspan="6">${ar.reportTitle}</td>
					</tr>

					<tr>
						<th class="header">활동기간</th>
						<td class="span-two" colspan="6">${ar.activityStartDate} ~
							${ar.activityEndDate}</td>
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
						onclick="window.location.href='${contextPath}/activityreport'">목록</button>
					<button class="list-btn"
						onclick="location.href='${contextPath}/activityreport/update/${ar.reportNo}'">수정</button>
					<button class="list-btn"
						onclick="deleteReport();">삭제</button>
				</div>
			</div>
		</div>

	</main>
	<script>
	function deleteReport(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			location.href = '${contextPath}/activityreport/delete/${ar.reportNo}'
		}
	}
	</script>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>