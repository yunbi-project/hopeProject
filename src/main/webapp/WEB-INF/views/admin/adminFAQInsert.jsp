<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/SnoticeInsert.css">

<!-- include summernote css/js-->

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
		<div class="Sn-insert-wrapper">
			<div class="Sn-insert-section">
				<div class="Sn-insert-container">
					<div class="Sn-TextLabel">자주묻는질문등록</div>
					<form method="POST" action="${contextPath}/board/insert/Q" id="insertform" enctype="multipart/form-data">
						<c:if test="${not empty param.condition}">
								<c:set var="url"
									value="&condition=${param.condition}" />
						</c:if>
						<div class="Sf-btn">
							<select class="custom-select" style="height:40px" name="condition">
									<option value="1"
										>물품기부</option>
									<option value="2"
										>후원하기</option>
									<option value="3"
										>자원활동</option>
									
							</select>
						</div>
				
					<div class="Sn-form">
					
						<div class="Sn-form-group">
							<label for="title">제목</label> <input type="text" id="title" name="boardTitle"
								class="Sn-input-title" placeholder="제목을 입력하세요" required>
						</div>
						<div class="Sn-form-group">
							<label for="boardContent">글내용</label>
							<textarea id="summernote" class="summernote" name="boardContent"
								placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					
					<div class="Sn-btn-group">
						<button type="submit" class="Sn-insert-btn">등록</button>
						<button type="reset" class="Sn-cancel-btn" onclick="window.location.href='${contextPath}/board/Q'">취소</button>
					</div>
				</form>
				</div>
			</div>
		</div>

		<script>
		
        $(document).ready(function() {

            $('#summernote').summernote({
                height: 500,
                minHeight: 500,
                maxHeight: 500,
                focus: false,
                lang: "ko-KR",
                placeholder: '최대 2048자까지 쓸 수 있습니다'
            });
        });
      
        </script>
   
	</main>
	


	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>