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
            <form action="${contextPath}/donate/insertDonateBoard" method="post" class="y_program_detail" enctype="multipart/form-data">
                <table class="y_table">
                    <tr>
                        <td>제목</td>
                        <td><input name="donateTitle" class="donateInput" type="text" placeholder="제목을 입력하세요" style="width:1100px;" required></td>
                    </tr>
                    <tr>
                        <td>대표이미지</td>
                        <td>
                        
                        	<img class="preview" style="border:none; width: 300px; height:auto;"><br>
	                        <input type="file" name="upfiles" class="form-control inputImage" accept="images/*" id="img" required>
	                        <span class="delete-image" style="border:none; cursor:pointer;" >&times;</span>
	                    </td>
                    </tr>
                    <tr>
                        <td>후원 모집 기간</td>
                        <td>시작일 : <input name="donateStartDate" class="donateInput" type="date" min="<%= java.time.LocalDate.now() %>" required> - 종료일 : <input name="donateEndDate" class="donateInput" type="date" required></td>
                    </tr>
                    <tr>
                    	<td>후원 재단</td>
                    	<td><input name="donateFoundation" class="donateInput" type="text" placeholder="후원 재단 입력하세요" required></td>
                    </tr>
                    <tr>
                        <td>목표 금액</td>
                        <td>
                        	<input name="donateHope" class="donateInput" id="onlyNum" type="text" style="margin-right: 10px;" placeholder=",을 제외한 숫자만 입력하세요" required>
                        	<span style="margin-left: 10px; border:none;" id="money"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>태그 유형 선택</td>
                        <td>
                      		<select name="tagId" class="donateInput y_c" required>
                      			<c:forEach var="t" items="${tag}">
                       				<option value="${t.tagId}">${t.tagName}</option>
								</c:forEach>
                      		</select>
                      		
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
         				<td>
         				 	<textarea id="summernote" class="summernote" name="donateContent" required></textarea></td>
                    </tr>
                    
                </table>
                <div class="btn-group">
                    <button class="modify-btn" type="submit">작성</button>
                    <a href="${contextPath}/donate/list"><button class="modify-btn" type="button" >목록</button></a>
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
				
			})
			
			// X 버튼을 클릭하였을때 사진 삭제하도록 설정
			deleteImage[index].addEventListener('click', function(){
				
				// 현재 미리보기가 존재하는 경우에 삭제처리되도록 수정
				if(preview[index].getAttribute("src") != "") {
					
					// 미리보기 삭제 + input태그 비워주기
					preview[index].removeAttribute("src");
					inputImage[index].value = "";
				}
			})
		})
		
		
			
	</script>
	
	<!-- 천억 이상은 값 못넣도록 설정 -->
	<script>
        $(document).ready(function() {
            $('#onlyNum').on('input', function() {
                var inputValue = parseInt($(this).val().replace(/,/g, ''));
                var moneyElement = $('#money');

                if (inputValue >= 1000000000) {
                    $(this).val(''); // 입력값 초기화
                    alert('1,000,000,000 이상의 금액은 입력할 수 없습니다.');
                }
            });
        });
    </script>
    
	
	<script src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>