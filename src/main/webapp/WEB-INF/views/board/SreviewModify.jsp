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
	<c:if test="${not empty alertMsg}">
        <script>
            alert("${alertMsg}");
        </script>
    </c:if>

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
					<div class="Sn-TextLabel">나눔후기 수정</div>
				<form method="POST" action="${contextPath}/board/update/R/${boardNo}" id="insertform" enctype="multipart/form-data">
					<div class="Sn-form">
						<div class="Sn-form-group">
							<label for="title">제목</label> <input type="text" id="title" name="boardTitle"
								class="Sn-input-title" value="${b.boardTitle}"placeholder="제목을 입력하세요" required>
						</div>
						<div class="Sn-form-group flex-container">
							<label>작성자</label>
							<div id="author" class="Sn-input-user">${b.userName}</div>
						</div>
						<c:if test="${not empty b.imgList}">
							<c:forEach items="${b.imgList}" var="attachment" varStatus="i">
								<c:choose>
									<c:when test="${attachment.imgLevel==0}">
										<c:set var="img0" value="${contextPath}/resources/images/board/${b.boardTypeNo }/${attachment.changeName }"/>																									
										<c:set var="img0no" value="${attachment.fileNo}"/>
									</c:when>
									<c:when test="${attachment.imgLevel==1}">
										<c:set var="img1" value="${contextPath}/resources/images/board/${b.boardTypeNo }/${attachment.changeName }"/>										
										<c:set var="img1no" value="${attachment.fileNo}"/>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:if>
						<div class="Sn-form-group flex-container">
							<label for="img1" class="file-upload-label">대표이미지</label>
							<div class="file-preview">
							<img class="preview" alt="대표이미지 미리보기" src="${img0}">						
							</div>
							<input type="file" class="inputImage" id="img1" accept="images/*" name="upfiles" >${attachment.originName}
							<span class="delete-image" data-no="${img0no}">&times;</span>			
						</div>
						<div class="Sn-form-group flex-container">
							<label>추가 파일</label>
							<div style="display:none;">
							<img class="preview" alt="대표이미지 미리보기" src="${img1}">	
							</div>
							<input type="file" class="inputImage" id="img2" accept="images/*" name="upfiles">														
							<span class="delete-image" data-no="${img1no}">&times;</span> 	
						</div>
						<div class="Sn-form-group">
							<label for="boardContent">글내용</label>
							<textarea id="summernote" class="summernote" name="boardContent"
								placeholder="내용을 입력하세요">${b.boardContent}</textarea>
						</div>
					</div>
					<input type="hidden" name="deleteList" id="deleteList" value="" />
					<div class="Sn-btn-group">
						<button type="submit" class="Sn-insert-btn">등록</button>
						<button type="reset" class="Sn-cancel-btn" onclick="window.location.href='${contextPath}/board/R'">취소</button>
					</div>
				</form>
				</div>
			</div>
		</div>

		<script>
		const inputImage = document.querySelectorAll('.inputImage');
		const preview = document.querySelectorAll('.preview');
		const deleteImage = document.querySelectorAll('.delete-image');
		
		const deleteList = document.querySelector("#deleteList");
		const deleteSet = new Set();
		
		
		inputImage.forEach(function(value,index){
			value.addEventListener('change',function(){
				if(this.files[0] != undefined){
					 		                
					const reader = new FileReader();
					reader.readAsDataURL(this.files[0]);
					reader.onload = function(e){
						preview[index].setAttribute("src",e.target.result);
					}
				}else{
					  
					preview[index].removeAttribute("src");
				}
				let no = $(this).next().data('no');
				if(no != undefined && no) deleteSet.add(no);
				deleteList.value = [...deleteSet];
			})
			deleteImage[index].addEventListener('click',function(){
				if(preview[index].getAttribute("src")!=""){
					preview[index].removeAttribute("src");
					inputImage[index].value="";
					
					let no = this.dataset.no;
					if(no != undefined && no) deleteSet.add(no);
					deleteList.value = [...deleteSet];
				}
			})
		})
		
		
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