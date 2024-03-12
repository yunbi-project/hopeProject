<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 모집 게시글 수정</title>

<link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateBoardForm.css">
<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<main>
	
		<h2 style="text-align: center; margin-top: 70px; font-size: 25px;">후원 모집 글 수정</h2>
        <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>
        
		<section>
            <form action="${contextPath}/donate/updateDonateBoard/${donate.donateNo}" method="post" class="y_program_detail" enctype="multipart/form-data">
                <table class="y_table">
                    <tr>
                        <td>제목</td>
                        <td><input name="donateTitle" class="donateInput" type="text" placeholder="제목을 입력하세요" style="width:1100px;" value="${donate.donateTitle}" required></td>
                    </tr>
                    <tr>
                        <td>대표이미지</td>
                        <td>
	                        <c:set var="img" value="${contextPath}/resources/images/donate/${donate.changeName}" />
	                        <c:set var="imgNo" value="${donate.fileNo}" />
                        	<c:if test="${donate.changeName eq null}">
                        		<img class="preview" style="border:none; width: 300px; height:auto;"><br>
                        	</c:if>
                        	<c:if test="${donate.changeName ne null}">
	                        	<img class="preview" style="border:none; width: 300px; height:auto;" src="${img}"><br>
                        	</c:if>
	                        <input type="file" name="upfiles" class="form-control inputImage" accept="images/*" id="img" >
	                        <span class="delete-image" data-no="${imgNo}" style="border:none; cursor:pointer;" >&times;</span>
	                        <div id="previewName" style="border:none;">${donate.originName }</div>
	                        <input type="hidden" name="originName" value="${donate.originName}" />
                            <input type="hidden" name="changeName" value="${donate.changeName}" />
							<input type="hidden" name="deleteList" id="deleteList" value="" />
	                    </td>
                    </tr>
                    <tr>
                        <td>후원 모집 기간</td>
                        <td>시작일 : <input name="donateStartDate" class="donateInput" type="date" value="${donate.donateStartDate }" required> - 종료일 : <input name="donateEndDate" class="donateInput" type="date" value="${donate.donateEndDate }" required></td>
                    </tr>
                    <tr>
                    	<td>후원 재단</td>
                    	<td><input name="donateFoundation" class="donateInput" type="text" placeholder="후원 재단 입력하세요" value="${donate.donateFoundation }" required></td>
                    </tr>
                    <tr>
                        <td>목표 금액</td>
                        <td>
                        	<input name="donateHope" class="donateInput" id="onlyNum" type="text" style="margin-right: 10px;" placeholder=",을 제외한 숫자만 입력하세요" value="${donate.donateHope }" required>
                        	<span style="margin-left: 10px; border:none;" id="money"><fmt:formatNumber value="${donate.donateHope}" type="currency" pattern="#,###원"/></span>
                        </td>
                    </tr>
                    <tr>
                        <td>태그 유형 선택</td>
                        <td>
                      		<select name="tagId" class="donateInput y_c"  required>
                      			<c:forEach var="t" items="${tag}">
                      				<c:choose>
                      					<c:when test="${donate.tagName eq t.tagName}">
	                      					<option value="${t.tagId}" selected>${t.tagName}</option>
                      					</c:when>
                      					<c:otherwise>
		                       				<option value="${t.tagId}">${t.tagName}</option>
                      					</c:otherwise>
                      				</c:choose>
								</c:forEach>
                      		</select>
                      		
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
         				<td>
         				 	<textarea id="summernote" class="summernote" name="donateContent" required>${donate.donateContent }</textarea></td>
                    </tr>
                    
                </table>
                <div class="btn-group">
                    <button class="modify-btn" type="submit">수정</button>
                    <button class="modify-btn" type="button" onclick="window.location.href ='${contextPath}/donate/list'">목록</button>
                </div>
            </form>
        </section>
	</main>
	
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
	        
	        
	        
	        // 시작일과 종료일 입력 상자 가져오기
	        var startDateInput = $('input[name="donateStartDate"]');
	        var endDateInput = $('input[name="donateEndDate"]');

	        // 날짜 입력이 변경될 때마다 확인
	        startDateInput.change(validateDates);
	        endDateInput.change(validateDates);

	        function validateDates() {
	            var startDate = new Date(startDateInput.val());
	            var endDate = new Date(endDateInput.val());

	            // 날짜가 선택되지 않았을 때는 검사하지 않음
	            if (!startDate || !endDate) {
	                return;
	            }

	            // 종료일이 시작일보다 앞서는 경우
	            if (endDate < startDate) {
	                alert('종료일은 시작일보다 늦어야 합니다. 다시 선택해주세요.');
	                // 날짜 입력값 초기화
	                endDateInput.val('');
	            }
	            // 시작일이 종료일보다 앞서는 경우
	            else if (startDate > endDate) {
	                alert('시작일은 종료일보다 빨라야 합니다. 다시 선택해주세요.');
	                // 날짜 입력값 초기화
	                startDateInput.val('');
	            }
	        }
	        
	        
	        
	        // 숫자만 입력을 감지하는 함수
	        $("#onlyNum").on("input", function() {
	            var sanitizedValue = $(this).val().replace(/[^0-9]/g, '');
	            $(this).val(sanitizedValue);
	        });

	        // 숫자만 입력을 확인하는 함수
	        $("input[name='donateHope']").on("change", function() {
	            var inputValue = $(this).val();

	            // 입력 값이 숫자가 아닌 경우
	            if (isNaN(inputValue) || inputValue === "") {
	                alert("숫자만 입력하세요. 한글이나 영어는 입력할 수 없습니다.");
	                $(this).val("");
	            }
	        });
	        
	        
	        
	        // 입력이 변경될 때마다 실행되는 함수 정의
	        $('#onlyNum').on('input', function() {
	            // 입력된 값에서 숫자만 추출하여 콤마로 구분된 통화 형식으로 변환
	            var currencyValue = $(this).val().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            
	            // 변환된 값을 화면에 출력할 요소에 설정
	            $('#money').text(currencyValue + "원");
	        });
	        
	        // 이미지 파일 입력 요소에 change 이벤트 리스너 등록
	        $('#img').change(function() {
	            // 이미지가 변경될 때마다 previewName 요소를 숨깁니다.
	            $('#previewName').hide();
	        });
	        
		    
	        // 이미지가 있어야만 넘어갈 수 있도록 설정
		    // 수정 버튼 요소를 가져옴
	        const modifyBtn = document.querySelector('.modify-btn');

	        // 수정 버튼 클릭 이벤트 추가
	        modifyBtn.addEventListener('click', function(event) {
	            // 이미지 미리보기 요소를 가져옴
	            const previewImage = document.querySelector('.preview');

	            // 이미지 미리보기 요소가 없거나 src 속성이 비어있으면 기본 동작 막음
	            if (!previewImage || !previewImage.getAttribute('src')) {
	                event.preventDefault(); // 기본 동작 막음
	                alert('이미지를 선택해주세요.');
	            }
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
		
		
		
		// 사진 첨부  --------------------------------------------------------------------
			const inputImage = document.querySelectorAll('.inputImage'); // input type = file
			const preview = document.querySelectorAll('.preview'); // img
			const deleteImage = document.querySelectorAll('.delete-image'); // 삭제버튼들
			
			const deleteList = document.querySelector("#deleteList"); // hidden 태그
			const deleteSet = new Set();
			// 키값이 중복이 안됨. X 버튼이 눌릴때마다 추가추가 될건데 같은 값이 계속 추가되면 안되니 set으로 일차적으로 추가할 예정
			
			inputImage.forEach( function ( value, index  ){
				//현재 반복중인 file태그
				value.addEventListener('change', function(){
					if(this.files[0] != undefined){// 선택한 파일이 있는경우
						const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
						reader.readAsDataURL(this.files[0]);
						
						// reader가 파일을 다 읽어온 경우
						reader.onload = function(e) {
							preview[index].setAttribute("src", e.target.result);
						}
					}else{ // 파일이 선택되지 않았을때 (취소)
						preview[index].removeAttribute("src");
					}	
					
					let no = $(this).next().data('no')
					if(no != undefined && no) deleteSet.add(no); // span태그(x버튼) // 매개변수로 no 키값을 가져오고 있음
					deleteList.value = [...deleteSet];
				})
				
				// X 버튼을 클릭하였을때 사진 삭제하도록 설정
				deleteImage[index].addEventListener('click', function(){
					
					// 현재 미리보기가 존재하는 경우에 삭제처리되도록 수정
					if(preview[index].getAttribute("src") != "") {
						
						// 미리보기 삭제 + input태그 비워주기
						preview[index].removeAttribute("src");
						inputImage[index].value = "";
						
						// data.no
						let no = this.dataset.no;  // 이미지번호 or undefined
						
						if(no != undefined) deleteSet.add(no);  // 얻어온 no값을 저장함. no가 undefined가 아닐때만!
						
						// 저장되어있던 이미지를 "삭제"하고자할 때 사용
						deleteList.value = [...deleteSet] // 깊은복사 // 객체(set)를 배열로 변환
						
						$('#previewName').hide();
					}
				})
			})
		
		
			
	</script>
	
	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>