<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="../resources/js/yunbi.js/yProgramDonate.js"></script>
<link rel="stylesheet" href="../resources/style/css/yunbi.css/yProgramDonate.css">
<link rel="stylesheet" href="../resources/style/css/common.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">봉사 활동 지원 신청</h2>
    <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
<section>
                <form action="${contextPath}/program/insert" method="post" class="y_program_detail">
                    <table class="y_table">
                        <tr>
                            <td>제목</td>
                            <td><input name="programName" class="donateInput" type="text" placeholder="제목을 입력하세요" style="width:1100px;" required></td>
                        </tr>
                        <tr>
                            <td>봉사 기간</td>
                            <td>시작일 : <input name="programActivityStartDate" class="donateInput" type="date" required> - 종료일 : <input name="programActivityEndDate" class="donateInput" type="date" required></td>
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
                            <td><input name="programEnrollEndDate" id="programEnrollEndDate" class="donateInput" type="date" max="${programActivityStartDate }" required>까지</td>
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
                            <td><input name="programCapacity" class="donateInput" type="number" min="1" max="5000" placeholder="최소 1, 최대 5000 / 숫자만 입력해주세요" style="width:1100px;" required></td>
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
                            <td>내용</td>
             				<td>
             				 	<textarea id="summernote" name="programContent"></textarea></td>
                        </tr>
                    </table>
                    <div class="y_donate_back_btn">
                        <button class="y_program_btn1" type="submit">작성</button>
                    </div>
                </form>
                        <button class="y_donate_back_btn1" onclick="window.location.href='${contextPath}/program/list'">목록</button>
            </section>
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
				        
				        function alertMessage() {
				        var alertMessage = "${alertMessage}";
				        if(alertMessage !== "") {
				            alert(alertMessage);
				            // 또는 모달 창을 띄워 메시지를 보여줄 수도 있습니다.
				        }
				        }
				        window.onload = alertMessage;
			</script>
			 <script>
			// 시작일 입력 요소 가져오기
			 var startDateInput = document.getElementsByName('programActivityStartDate')[0];

			 // 종료일 입력 요소 가져오기
			 var endDateInput = document.getElementsByName('programActivityEndDate')[0];

			 // 마감일 입력 요소 가져오기
			 var enrollmentEndDateInput = document.getElementsByName('programEnrollEndDate')[0];

			 // 오늘 날짜 생성
			 var today = new Date();
			 var year = today.getFullYear();
			 var month = today.getMonth() + 1;
			 var day = today.getDate();

			 // 월과 일이 한 자리 수일 경우 두 자리로 만들기
			 month = month < 10 ? '0' + month : month;
			 day = day < 10 ? '0' + day : day;

			 var currentDate = year + '-' + month + '-' + day;

			 // 시작일은 최소 오늘부터 선택 가능
			 startDateInput.setAttribute('min', currentDate);
			 
			 // 마감일은 최소 오늘부터 선택 가능
			 enrollmentEndDateInput.setAttribute('min', currentDate);

			 // 시작일 변경 시 이벤트 처리
			 startDateInput.addEventListener('change', function() {
			     // 선택한 시작일 가져오기
			     var startDate = new Date(this.value);

			     // 종료일 입력 요소의 최솟값 설정 / 시작일 이후
			     endDateInput.setAttribute('min', this.value);

			     // 종료일과 마감일의 유효성 검사
			     validateEndDate();
			     validateEnrollmentEndDate();
			 });

			 // 종료일 변경 시 이벤트 처리
			 endDateInput.addEventListener('change', function() {
			     // 종료일을 변경할 때마다 마감일의 최댓값을 설정
			     enrollmentEndDateInput.setAttribute('max', this.value);

			     // 종료일과 마감일의 유효성 검사
			     validateEndDate();
			     validateEnrollmentEndDate();
			 });

			 // 시작일과 종료일의 유효성 검사 함수
			 function validateEndDate() {
			     // 선택한 시작일과 종료일 가져오기
			     var startDate = new Date(startDateInput.value);
			     var endDate = new Date(endDateInput.value);

			     // 종료일이 시작일 이전인지 확인
			     if (endDate < startDate) {
			         alert("종료일은 시작일보다 미래 날짜여야 합니다.");
			         endDateInput.value = ''; // 종료일 초기화
			     }
			 }

			 // 시작일과 마감일의 유효성 검사 함수
			 function validateEnrollmentEndDate() {
			     // 선택한 종료일과 마감일 가져오기
			     var endDate = new Date(endDateInput.value);
			     var enrollmentEndDate = new Date(enrollmentEndDateInput.value);

			     // 마감일이 종료일 이전인지 확인
			     if (enrollmentEndDate <= endDate) {
			         alert("마감일은 종료일보다 미래 날짜여야 합니다.");
			         enrollmentEndDateInput.value = ''; // 마감일 초기화
			     }
			 }
</script>


     <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
</html>