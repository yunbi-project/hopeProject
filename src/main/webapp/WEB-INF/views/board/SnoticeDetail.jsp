<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.note-editor.note-airframe .note-editing-area .note-editable {
    background-color: transparent !important;
}

</style>
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/SnoticeDetail.css">
	<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
	
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
							<div class="Sn-TextLabel">공지사항</div>
						</div>
					</div>
				</div>


				<header class="entry-header">
					<h1 class="entry-title">${b.boardTitle}</h1>
					<div class="entry-meta">
						<div class="detail-date">등록일</div>
						<div class="detail-date-">${b.createDate}</div>
						 <div>조회수</div>
						<div>${b.count }</div> 
					</div>
					<div class="entry-meta">
						<div class="detail-date">작성자</div>
						<div class="detail-date-">${b.userName}</div>
					</div>
				</header>
				<div>
					<div class="attachment">
						<div>첨부파일</div>
						<c:forEach var="i" begin="0" end="1">
							<div>								
								<a href="${contextPath}/board/fileDownload/${imgList[i].fileNo}">
									${imgList[i].originName}
								</a>
							</div>
						</c:forEach>
					</div>
				</div>

				<section class="entry-content">
					<textarea class="detail-content" id="summernote" style="background-color: transparent; border: none;"  readonly="readonly">${b.boardContent}</textarea>

				</section>
				
				<div class="btn-group">
					<div class="login-detail-btn">
						<button class="delete-btn" onclick="">삭제</button>										
						    <button class="modify-btn" onclick="window.location.href='${contextPath}/board/update/N/${b.boardNo}'">수정</button>					
					</div>
					<div class="detail-btn">
						<button class="list-btn" onclick="window.location.href='${contextPath}/board/N'">목록</button>
					</div>

				</div>
			</div>
		</div>

	</main>
	
	<script>
	function stripHtmlTags(html) {
	    let doc = new DOMParser().parseFromString(html, 'text/html');
	    return doc.body.textContent || "";
	}

	$(document).ready(function() {
	    var text = "${b.boardContent}";
	    text = stripHtmlTags(text); // HTML 태그 제거

	    // 썸머노트 초기화
	    $('#summernote').summernote({
	        toolbar: [], // 툴바 비활성화 (읽기 전용으로 설정)
	        airMode: true, // 에어모드 활성화
	        disableResizeEditor: true, // 에디터 크기 조절 비활성화
	        focus: false, // 포커스 설정 (선택사항)
	        codeview: false // 코드 보기 비활성화
	    });

	    // 썸머노트에 텍스트 삽입
	    $('#summernote').summernote('code', text);

	    // 에디터를 비활성화하여 사용자의 입력을 막습니다.
	    $('#summernote').summernote('disable');
	});



	</script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>