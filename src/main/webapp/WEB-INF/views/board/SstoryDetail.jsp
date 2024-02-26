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
							<div class="Sn-TextLabel">자유게시판</div>
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
								<a href="${contextPath}/board/fileDownload/${b.boardTypeNo}/${imgList[i].fileNo}">
									${imgList[i].originName}
								</a>
							</div>
						</c:forEach>
					</div>
				</div>

				<section class="entry-content">
					<textarea class="detail-content" id="summernote" style="background-color: transparent; border: none;"  readonly="readonly">${b.boardContent}</textarea>

				</section>
				 <div class="reply-insert">           
            <div class="comment-section">
                <textarea class="form-control comment-input" name="replyContent" id="replyContent"  style="resize: none; width: 100%;" placeholder="댓글을 입력하세요..."></textarea>
                <button class="btn btn-secondary comment-button" onclick="insertReply()">등록하기</button>
            </div>
            <div class="comment-list">
                <h3>댓글 (<span id="rcount">0</span>)</h3>
                <table id="replyArea" class="table">
                    
                    <tbody>
                        <!-- 여기에 동적으로 댓글이 추가될 예정입니다. -->
                               
                    </tbody>
                </table>
            </div>
               
        </div>
				
				<div class="btn-group">
					<div class="login-detail-btn">
					
						    <button class="delete-btn" onclick="deleteBoard(${b.boardNo})">삭제</button>										
				
						    <button class="modify-btn" onclick="window.location.href='${contextPath}/board/update/${b.boardTypeNo}/${b.boardNo}'">수정</button>					
					</div>
					<div class="detail-btn">
						<button class="list-btn" onclick="window.location.href='${contextPath}/board/C'">목록</button>
					</div>

				</div>
			</div>
		</div>

 
 
	</main>
	
	<script>
	function loadComments() {
	    $.ajax({
	        url: '${contextPath}/reply/list', // 댓글 목록을 조회하는 API의 주소
	        type: 'GET',
	        success: function(response) {
	            // 서버로부터 받은 댓글 목록 데이터를 처리하여 HTML에 추가
	            var comments = response.comments; // 댓글 목록 데이터
	            var tbody = $('#replyArea tbody'); // 댓글을 추가할 tbody 엘리먼트
	            tbody.empty(); // 기존의 댓글을 모두 지우고 시작

	            // 각 댓글을 순회하며 HTML에 추가
	            for (var i = 0; i < comments.length; i++) {
	                var comment = comments[i];
	                var row = '<tr>' +
	                          '<td>' + comment.userName + '</td>' +
	                          '<td>' + comment.content + '</td>' +
	                          '<td>' + comment.createDate + '</td>' +
	                          '<td>' +
	                              '<button onclick="editComment(' + comment.id + ')">수정</button>' +
	                              '<button onclick="deleteComment(' + comment.id + ')">삭제</button>' +
	                          '</td>' +
	                          '</tr>';
	                tbody.append(row); // 댓글을 tbody에 추가
	            }

	            // 댓글 개수 업데이트
	            $('#rcount').text(comments.length);
	        },
	        error: function(xhr, status, error) {
	            console.error('댓글 조회에 실패하였습니다:', error);
	            alert('댓글 조회에 실패하였습니다. 상세 정보는 콘솔을 확인해주세요.');
	        }
	    });
	}

	// 페이지 로드시 댓글 조회
	$(document).ready(function() {
	    loadComments();
	});
	
    function deleteBoard(boardNo) {
        var boardTypeNo = 'C'; // boardTypeNo 값을 설정하거나 동적으로 가져옵니다.
        var url = '${contextPath}/board/delete/' + boardNo + '?boardTypeNo=' + boardTypeNo;
        window.location.href = url;
    }


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
	
	function insertReply(){
		const replyContent = $('#replyContent').val();
		
		const data={
			boardNo:'${b.boardNo}',
			userNo:'${loginUser.userNo}',
			replyContent
			}
		console.log(data);
		$.ajax({
			url:'${contextPath}/reply/insert',
			type:'POST',
			contentType:"application/json; charset=UTF-8",
			data: JSON.stringify(data),
			success : function(result){
				if(result.msg === "성공"){
					alert("댓글 등록에 성공하였습니다.");
				}else{
					alert("댓글 등록에 실패하였습니다.");
					
				}
				$('#replyContent').val("");
			},
			error: function(xhr, status, error) {
	            console.error('댓글 등록에 실패하였습니다:', error);
	            alert('댓글 등록에 실패하였습니다. 상세 정보는 콘솔을 확인해주세요.');
	        }
					
		})
	}


	</script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>