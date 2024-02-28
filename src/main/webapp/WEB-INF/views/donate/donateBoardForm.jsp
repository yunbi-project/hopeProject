<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 모집 게시글 작성</title>

<link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateBoardForm.css">

<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main>
	
		<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">후원 모집 글 작성</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
        
		<section>
            <form action="${contextPath}/donate/insertBoard" method="post" class="y_program_detail">
                <table class="y_table">
                    <tr>
                        <td>제목</td>
                        <td><input name="programName" class="donateInput" type="text" placeholder="제목을 입력하세요" style="width:1100px;"></td>
                    </tr>
                    <tr>
                        <td>대표이미지</td>
                        <td><input type="file"></td>
                    </tr>

                    
                    <tr>
                        <td>봉사 기간</td>
                        <td>시작일 : <input name="programActivityStartDate" class="donateInput" type="date"> - 종료일 : <input name="programActivityEndDate" class="donateInput" type="date"></td>
                    </tr>
                    <tr>
                        <td>봉사 시간</td>
                        <td>
                        		<select name="activityTime" class="donateInput y_c">
                        			<option value="1">오전</option>
                        			<option value="2">오후</option>
                        		</select>
                        </td>
                    </tr>
                    <tr>
                        <td>모집 기간</td>
                        <td><input name="programEnrollEndDate" id="programEnrollEndDate" class="donateInput" type="date" max="${programActivityStartDate }">까지</td>
                    </tr>
                    <tr>
                        <td>활동 주간 유형</td>
                        <td>
                        		<select name="activityDays" class="donateInput y_c">
                        			<option value="1">평일</option>
                        			<option value="2">주말</option>
                        		</select>
                        </td>
                    </tr>
                    <tr>
                        <td>모집 인원</td>
                        <td><input name="programCapacity" class="donateInput" type="number" min="1" max="5000" placeholder="최소 1, 최대 5000 / 숫자만 입력해주세요" style="width:1100px;"></td>
                    </tr>
                    <tr>
                        <td>봉사 장소</td>
                        <td>
                        <select name="activityLocation">
                        	<option value="1${activityLocation }">서울&경기</option>
                        	<option value="2${activityLocation }">강원</option>
                        	<option value="3${activityLocation }">충청</option>
                        	<option value="4${activityLocation }">전라</option>
                        	<option value="5${activityLocation }">경상</option>
                        </select>
                        <input name="activityLocation" class="donateInput" type="text" placeholder="상세 장소" style="width:1000px;"></td>
                    </tr>
                    <tr>
                        <td>봉사 유형</td>
                        <td>
                        		<select name="activityType" class="donateInput y_c">
                        			<option value="1">정기</option>
                        			<option value="2">일시</option>
                        		</select>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
         				<td>
         				 	<textarea id="summernote" name="programContent"></textarea></td>
                    </tr>

                </table>
                <div class="y_donate_back_btn">
                    <button class="y_program_btn1" type="submit">작성</button>
                    <button class="y_donate_back_btn1" href="${contextPath}/program/list">목록</button>
                </div>
            </form>
        </section>
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
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>