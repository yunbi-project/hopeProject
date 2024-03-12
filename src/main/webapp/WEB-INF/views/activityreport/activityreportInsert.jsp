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

.note-editable img {
	width:600px !important;
}
</style>

<link rel="stylesheet"
	href="${contextPath}/resources/style/css/dowon.css/activityreportInsert.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>

		<div class="ar-wrapper1">

			<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">봉사활동보고서 작성</h2>
        	<div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
			
			<form action="${contextPath}/activityreportinsert/P/${programNo}" method="post">
			
			<div class="table-div">
				<table>
					<tr>
						<th class="header" style="width:100px;">종류</th>
						<td colspan="2" style="width: 20%;">
							<div name="reportType" value="P" >봉사활동</div>
						</td>
						<th class="header" colspan="2">모집기간</th>
						<td colspan="2" style="width:300px;">${program.programActivityStartDate} ~ ${program.programActivityEndDate}</td>
						<input type="hidden" name="refAno" value="${program.programNo}">
					</tr>

					<tr>
						<th class="header">제목</th>
						<td class="span-two" colspan="6"><input style="width: 700px;" type="text" name="reportTitle"
							placeholder="제목을 입력하세요" required></td>
					</tr>

					<tr>
						<th class="header">활동시간</th>
						<td class="span-two" colspan="2">
							<c:if test="${program.activityTime eq 1 and program.activityDays eq 1}">
                            	오전, 평일
                            </c:if>
                            <c:if test="${program.activityTime eq 1 and program.activityDays eq 2}">
                            	오전, 주말
                            </c:if>
                            <c:if test="${program.activityTime eq 2 and program.activityDays eq 1}">
                            	오후, 평일
                            </c:if>
                            <c:if test="${program.activityTime eq 2 and program.activityDays eq 2}">
                            	오후, 주말
                            </c:if>
						</td>
						<th class="header" style="width:100px;">지역</th>
						<td class="span-two" style="width:200px;">${program.activityLocation }</td>
						<th class="header" style="width:150px;">참여인원/제한수</th>
						<td class="span-two" colspan="2" style="width:100px;">${program.requestTotal} / ${program.programCapacity }</td>
					</tr>

					<tr>
						<th class="header" style="height: 500px;">활동내용</th>
						
						<td class="span-two" colspan="6"><textarea class="summernote" id="summernote"
								name="reportContent" required></textarea></td>
					</tr>
				</table>
			</div>

			<div class="btn-group">
				<div class="form-group">
					<input type="submit" value="등록">
					<button class="list-btn"
						onclick="window.location.href='${contextPath}/activityreport/P'">목록</button>
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