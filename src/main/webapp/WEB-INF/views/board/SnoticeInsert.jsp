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
					<div class="Sn-TextLabel">공지사항 등록</div>
				<form method="post" action="${contextPath}/board/insert/N" id="insertform">
					<div class="Sn-form">
						<div class="Sn-form-group">
							<label for="title">제목</label> <input type="text" id="title" name="boardTitle"
								class="Sn-input-title" placeholder="제목을 입력하세요">
						</div>
						<div class="Sn-form-group flex-container">
							<label>작성자</label>
							<div id="author" class="Sn-input-user">${loginUser.userName}</div>
						</div>
						<div class="Sn-form-group">
							<label for="content">글내용</label>
							<textarea id="summernote" class="summernote" name="boardContent"
								placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					
					<div class="Sn-btn-group">
						<button type="submit" class="Sn-insert-btn">등록</button>
						<button type="reset" class="Sn-cancel-btn">취소</button>
					</div>
				</form>
				</div>
			</div>
		</div>

		<script>
		
		
		 $(document).ready(function () {
		        $('#summernote').summernote({
		            codeviewFilter: false, // 코드 보기 필터 비활성화
		            codeviewIframeFilter: false, // 코드 보기 iframe 필터 비활성화

		            height: 500, // 에디터 높이
		            minHeight: 500, // 최소 높이
		            maxHeight: 500, // 최대 높이
		            focus: false, // 에디터 로딩 후 포커스 설정
		            lang: 'ko-KR', // 언어 설정 (한국어)

		            toolbar: [
		                ['style', ['style']], // 글자 스타일 설정 옵션
		                ['fontsize', ['fontsize']], // 글꼴 크기 설정 옵션
		                ['font', ['bold', 'underline', 'clear']], // 글자 굵게, 밑줄, 포맷 제거 옵션
		                ['color', ['color']], // 글자 색상 설정 옵션
		                ['table', ['table']], // 테이블 삽입 옵션
		                ['para', ['ul', 'ol', 'paragraph']], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
		                ['height', ['height']], // 에디터 높이 조절 옵션
		                ['insert', ['picture', 'link', 'video']], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
		                ['view', ['codeview', 'fullscreen', 'help']], // 코드 보기, 전체 화면, 도움말 옵션
		            ],

		            fontSizes: [
		                '8', '9', '10', '11', '12', '14', '16', '18',
		                '20', '22', '24', '28', '30', '36', '50', '72',
		            ], // 글꼴 크기 옵션

		            styleTags: [
		                'p',  // 일반 문단 스타일 옵션
		                {
		                    title: 'Blockquote',
		                    tag: 'blockquote',
		                    className: 'blockquote',
		                    value: 'blockquote',
		                },  // 인용구 스타일 옵션
		                'pre',  // 코드 단락 스타일 옵션
		                {
		                    title: 'code_light',
		                    tag: 'pre',
		                    className: 'code_light',
		                    value: 'pre',
		                },  // 밝은 코드 스타일 옵션
		                {
		                    title: 'code_dark',
		                    tag: 'pre',
		                    className: 'code_dark',
		                    value: 'pre',
		                },  // 어두운 코드 스타일 옵션
		                'h1', 'h2', 'h3', 'h4', 'h5', 'h6',  // 제목 스타일 옵션
		            ],

		            callbacks: {
		                onImageUpload: function (files, editor, welEditable) {
		                    // 파일 업로드 (다중 업로드를 위해 반복문 사용)
		                    for (var i = files.length - 1; i >= 0; i--) {
		                        var fileName = files[i].name

		                        // 이미지 alt 속성 삽일을 위한 설정
		                        var caption = prompt('이미지 설명 :', fileName)
		                        if (caption == '') {
		                            caption = '이미지'
		                        }
		                        uploadSummernoteImageFile(files[i], this, caption)
		                    }
		                },
		                onMediaDelete: function($target,editor,$eitable){
		                	if(confirm('이미지를 삭제하시겠습니까?')){
		                		var deletedImageUrl = $target.attr('src').split('/').pop()
		                		
		                		deleteSummernoteImageFile(deletedImageUrl)
		                	}
		                },
		            },
		        })
		    })

		    // 이미지 업로드 함수 ajax 활용
		    function uploadSummernoteImageFile(file, el, caption) {
		        data = new FormData()
		        data.append('file', file)
		        $.ajax({
		            data: data,
		            type: 'POST',
		            url: 'uploadSummernoteImageFile',
		            contentType: false,
		            enctype: 'multipart/form-data',
		            processData: false,
		            success: function (data) {
		                $(el).summernote('editor.insertImage',
		                    data.url,
		                    function ($image) {
		                        $image.attr('alt', caption) // 캡션 정보를 이미지의 alt 속성에 설정
		                    }
		                )
		            },
		        })
		    }
		 
		 //이미지 삭제 ajax
		 function deleteSummernoteImageFile(imageName){
			 data = new FormData()
			 data.append('file',imageName)
			 $.ajax({
				 data:data,
			 	 type:'POST',
			 	 url : 'deleteSummernoteImageFile',
			 	 contentType:false,
			 	 enctype: 'multipart/form-data',
			 	 processData:false,
			 })
		 }

	

		</script>
	</main>
	<script>
    // 폼 제출 이벤트 핸들러
    $('#insertform').submit(function(e) {
        // 기본 제출 동작 방지
        e.preventDefault();
    
        // 제목 필드의 값 가져오기
        let title = $('#title').val();
        let content = $('#summernote').val(); 

        // Summernote 에디터에 업로드된 이미지 파일 가져오기
        let formData = new FormData();
        formData.append('boardTitle', title);
        formData.append('boardContent', content);
        formData.append('file',file);
        // 파일 입력 필드에서 선택된 모든 파일 추가
        let files = $('#summernote').summernote('core.note').files;
        if (files && files.length > 0) {
            for (let i = 0; i < files.length; i++) {
                formData.append('file', files[i]);
            }
        }

        // AJAX 요청 보내기
        $.ajax({
            type: 'POST',
            url: '${contextPath}/board/insert/N',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                // 요청이 성공한 경우의 처리
                alert('등록에 성공했습니다.');
            },
            error: function(xhr, status, error) {
                // 요청이 실패한 경우의 처리
                alert('요청이 실패했습니다. 오류: ' + error);
            }
        });
    });
</script>


	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>