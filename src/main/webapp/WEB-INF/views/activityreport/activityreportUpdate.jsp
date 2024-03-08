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
	href="${contextPath}/resources/style/css/dowon.css/activityreportInsert.css">

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
			
			<form action="${contextPath}/activityreport/update/${activityreport.reportNo}" method="post">
		
			<div class="table-div">
				<table>
					<tr>
						<th class="header">작성일자</th>
						<td colspan="2" style="width: 30%;"><input type="date" value="${activityreport.createDate }">
						</td>
						<th class="header" colspan="2">작성자</th>
						<td colspan="2">관리자</td>
					</tr>

					<tr>
						<th class="header">제목</th>
						<td class="span-two" colspan="6"><input type="text" name="reportTitle" value="${activityreport.reportTitle }"
							></td>
					</tr>

					<tr>
						<th class="header">활동기간</th>
						<td class="span-two" colspan="6">
						<input type="date" name="activityStartDate" value="${activityreport.activityStartDate }"> ~ <input type="date" name="activityEndDate" value="${activityreport.activityEndDate }">
						</td>
					</tr>

					<tr>
						<th class="header" style="height: 500px;">활동내용</th>
						
						<td class="span-two" colspan="6"><textarea class="summernote" id="summernote"
								name="reportContent" >${activityreport.reportContent}</textarea></td>
					</tr>
				</table>
			</div>

			<div class="btn-group">
				<div class="detail-btn">
					<button class="list-btn"
						onclick="window.location.href='${contextPath}/activityreport'">목록</button>
					<button class="list-btn"
						type="submit">수정완료</button>
				</div>
			</div>
			
			</form>
		</div>

	</main>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
<script>
	$(document).ready(function() {

		$('#summernote').summernote({
			height : 500,
			minHeight : 500,
			maxHeight : 500,
			focus : false,
			lang : "ko-KR",
			placeholder : '최대 2048자까지 쓸 수 있습니다'
		});
	});

	function alertMessage() {
		var alertMessage = "${alertMessage}";
		if (alertMessage !== "") {
			alert(alertMessage);
			// 또는 모달 창을 띄워 메시지를 보여줄 수도 있습니다.
		}
	}
	window.onload = alertMessage;
</script>
<script
	src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
<script
	src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
</html>