<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원모집 상세보기</title>
<link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateDetail.css">
<link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateBoardForm.css">
<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">
	
	<%--아임포트 라이브러리--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div class="detail_main">
            <section class="detail_section1">
                <div style="position: relative;">
                	<c:choose>
                		<c:when test="${donate.changeName eq null}">
		                    <img class="detail_thumnail" src="https://msf.or.kr/sites/all/themes/msfkorea/images/img-high-value-slide-04.jpg">
                		</c:when>
                		<c:otherwise>
                			<img class="detail_thumnail" src="${contextPath}/resources/images/donate/${donate.changeName}">
                		</c:otherwise>
               		</c:choose>
                    <c:choose>
                    <c:when test="${donate.donateEndDate lt currentDate}">
                    	<div class="ending_imminent">종료</div>
                    	
                    </c:when>
                    <c:when test="${donate.ceilDayDiff <= 14}">
                    	<div class="ending_imminent">종료임박</div>
                    </c:when>
                    <c:otherwise >
                    	
                    </c:otherwise>
                    </c:choose>
                </div>

                <div class="detail_select">
                    <label id="information">모금소개</label>
                    <label id="status">기부현황</label>
                </div>

                <div id="donation_information">
                    <div>
                        <textarea class="detail_content" id="summernote" readonly="readonly">
                             ${donate.donateContent}
                        </textarea>
                    </div>
                    
                </div>

                <div id="donation_status" hidden>
                    <div class="donation_status_title">
	                	<c:choose>
	                		<c:when test="${empty payPeople}">
	                			<img src="https://cdn-icons-png.flaticon.com/128/8231/8231317.png">
	                			<span>아쉽게도 아직 후원한 회원이 없어요.<br>
	                			첫 후원자가 되어주세요!</span>
	                		</c:when>
	                		<c:otherwise>
		                        <img src="https://cdn-icons-png.flaticon.com/128/7500/7500376.png">
		                        <span>기부자님들이 보내주신 소중한 마음!<br>
		                        따뜻함 그대로 전달할게요.</span>
	                		</c:otherwise>
	                	</c:choose>
                    </div>
                    <div class="donation_status_box">
                    	<c:forEach items="${payPeople}" var="p">
                    		<div class="donation_status_div">
                    			<c:if test="${p.anonymous eq 'Y'}">
		                            <span>익명의 기부</span>
                    			</c:if>
                    			<c:if test="${p.anonymous eq 'N'}">
                    				<span>${p.userName }</span>
                    			</c:if>
	                            <span><fmt:formatNumber value="${p.donateAmount}" type="currency" pattern="#,###"/>원 기부</span>
	                            <c:if test="${p.optionalText eq null}">
		                            <span>조용히 기부합니다.</span>
	                            </c:if>
	                            <c:if test="${p.optionalText ne null}">
	                            	<span>${p.optionalText}</span>
	                            </c:if>
	                            <span>${p.createDate}</span>
                        	</div>
                    	</c:forEach>
      
                    </div>
                    
                </div>
            </section>
            
            <section class="detail_section2">
                <div class="has_tag">${donate.tagName }</div>
                <span class="detail_title">${donate.donateTitle}</span>
                <div class="detail_donate">
          
                    <div>
                    	<c:choose>
                    		<c:when test="${donate.achRate >= 100}">
                    			<img class="rabbit_img" style="width:140px;" src="https://item.kakaocdn.net/do/7f552a5d038cc7b0b6f99339bbc330baf43ad912ad8dd55b04db6a64cddaf76d">
                    		</c:when>
                    		<c:when test="${donate.donateEndDate lt currentDate and donate.achRate < 100}">
                    			<img class="rabbit_img" style="width:120px;" src="https://media.tenor.com/RSFvAKQkWJoAAAAM/%EC%B6%98%EC%8B%9D-%EC%B6%98%EC%8B%9D%EC%9D%B4.gif">
                    		</c:when>
                    		<c:otherwise>
		                        <img class="rabbit_img"  src="https://og.kakaobank.io/view/ef0356b2-3be9-4187-84c2-53d52ae60279">
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="detail_money">
                        <span><fmt:formatNumber value="${donate.sumDonate}" type="currency" pattern="#,###"/>원</span><br>
                        <span><fmt:formatNumber value="${donate.donateHope}" type="currency" pattern="#,###"/>원 목표</span>
                    </div>
                </div>
                
                <progress
                class="progress"
                id="progress"
                value="${donate.achRate}"
                min="0"
                max="100"
                ></progress>

                <div class="object_num">
                    <span>${donate.achRate > 100 ? 100 : donate.achRate}% 달성</span>
                    <c:choose>
                    	<c:when test="${donate.donateEndDate lt currentDate}">
                    		<span>모금종료</span>
                    	</c:when>
                    	<c:otherwise>
		                    <span>${donate.ceilDayDiff}일 남음</span>
                    	</c:otherwise>
                    </c:choose>
                </div>

                <div class="total_donation">
                	<c:choose>
                		<c:when test="${donate.donateEndDate lt currentDate}">
                			<div style="text-align: center; margin-bottom: 30px; font-weight: bold;">총 <fmt:formatNumber value="${donate.totalCount}" type="currency" pattern="#,###"/>명이 참여했습니다</div>
                		</c:when>
                		<c:otherwise>
		                    <div style="text-align: center; margin-bottom: 30px; font-weight: bold;">총 <fmt:formatNumber value="${donate.totalCount}" type="currency" pattern="#,###"/>명이 참여중입니다</div>
                		</c:otherwise>
                	</c:choose>
                    <div class="total_moneny">
                        <span>총 기부</span>
                        <span><fmt:formatNumber value="${donate.sumDonate}" type="currency" pattern="#,###"/>원</span>
                    </div>

                    <div class="total_date">
                        <span>모집 기간</span>
                        <span>${donate.donateStartDate} ~ ${donate.donateEndDate }</span>
                    </div>


                    <div class="line">
                        <img style="width:6px; margin-right: 10px;"  src="https://cdn-icons-png.flaticon.com/128/5720/5720434.png">
                        <span>공유, 응원으로 참여하면 희망의조각이 기부합니다.</span>
                    </div>
                    <div class="line">
                        <img style="width:6px; margin-right: 10px;" src="https://cdn-icons-png.flaticon.com/128/5720/5720434.png">
                        <span>기부금은 100% 단체에 전달됩니다.</span>
                    </div>
					
					<c:choose>
						<c:when test="${donate.donateEndDate lt currentDate}">
							<div class="donationEnd">모금종료</div>
						</c:when>
						<c:otherwise>
							<c:if test="${empty loginUser}">
								<div class="donationing" onclick="checkLogin()">기부하기</div>
							</c:if>
							<c:if test="${loginUser ne null}">
								<a href="${contextPath}/donate/insertPay/${donate.donateNo}"><div class="donationing">기부하기</div></a>							
							</c:if>
						</c:otherwise>
					</c:choose>
                    

                    <div style="display: flex; justify-content: space-around;">
                        <div class="heart_share">
                            <img class="heart" id="bin_heart" src="https://cdn-icons-png.flaticon.com/128/6063/6063316.png">
                            <img class="heart" hidden id="heart" src="https://cdn-icons-png.flaticon.com/128/2550/2550361.png">
                            <span>300</span>
                        </div>
                        <div style="border: 1px solid rgb(186, 186, 186); margin-top: 20px; height: 30px;"></div>
                        <div class="heart_share">
                            <img class="heart" src="https://cdn-icons-png.flaticon.com/128/4189/4189861.png">
                            <span>공유</span>
                        </div>
                    </div>
                </div>

                <div class="association_donation">
                    <div style="display:flex; align-items: center; margin-bottom: 20px;">
                        <img style="width: 30px; margin-right: 10px;" src="https://cdn-icons-png.flaticon.com/128/5886/5886611.png">
                        <span>${donate.donateFoundation}</span>
                    </div>
                    <div>협회</div>
                </div>

                <div class="with_donation1">
                    <span>같이 기부해요</span>
                    <c:forEach items="${otherList }" var="o">
                    	<c:choose>
                    		<c:when test="${donate.donateNo eq o.donateNo}">
                    		</c:when>
                    		<c:otherwise>
	                    		<a href="${contextPath}/donate/detail/${o.donateNo}">
				                    <div class="other_board">
				                    	<c:if test="${o.changeName eq null}">
					                        <img class="other_borad_img" src="https://msf.or.kr/sites/all/themes/msfkorea/images/img-high-value-slide-04.jpg">
				                    	</c:if>
				                    	<c:if test="${o.changeName ne null }">
				                    		<img class="other_borad_img" src="${contextPath}/resources/images/donate/${o.changeName}">
				                    	</c:if>
				                        <div class="other_board_content">
				                            <span>${o.donateTitle }</span>
				                            <span>${o.donateFoundation }</span>
				                        </div>
				                    </div>
			                    </a>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </c:forEach>
                </div>
            </section>
        </div>
        
    </main>
    
    <c:if test="${loginUser.userNo eq 1}">
	   	<div class="btn-group">
	        <a href="${contextPath }/donate/update/${donate.donateNo}"><button type="button" class="modify-btn">수정</button></a>
	    	<a href="${contextPath }/donate/delete/${donate.donateNo}"><button type="button" class="delete-btn" >삭제</button></a>
	    </div>
    </c:if>

    
    
	
	<script>
		$(document).ready(function() {
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
		    
		    
		    
			
		    // note-editable 클래스가 적용된 요소의 내용이 변경될 때마다 높이를 조정하는 함수 호출
		    $(".note-editable").on("input", function() {
		        adjustEditableHeight(this);
		    });

		    // 페이지 로드될 때 note-editable 클래스가 적용된 요소의 높이 조정
		    $(".note-editable").each(function() {
		        adjustEditableHeight(this);
		    });
		    
		    adjustMainHeight(); // 페이지 로드시 높이 조절 함수 호출

		    $(window).on('resize', function() {
		        adjustMainHeight(); // 창 크기 변경시 높이 재조정 함수 호출
		    });
		    
		    
		    
			
		    // '기부현황' 클릭 시
		    $('#status').click(function() {
		        // '기부현황'에 대한 스타일 변경
		        $(this).css('color', 'black');
		        $(this).css('border-bottom', '2px solid black');
	
		        // '모금소개' 스타일 초기화
		        $('#information').css('color', 'gray');
		        $('#information').css('border-bottom', 'none');
	
		        // donation_status 보여주고 donation_information 숨김
		        $('#donation_status').show();
		        $('#donation_information').hide();
		    });
	
		    // '모금소개' 클릭 시
		    $('#information').click(function() {
		        // '모금소개'에 대한 스타일 변경
		        $(this).css('color', 'black');
		        $(this).css('border-bottom', '2px solid black');
	
		        // '기부현황' 스타일 초기화
		        $('#status').css('color', 'gray');
		        $('#status').css('border-bottom', 'none');
	
		        // donation_information 보여주고 donation_status 숨김
		        $('#donation_information').show();
		        $('#donation_status').hide();
		    });
	
	
		    // 빈하트, 하트 표시
		    $('#heart').click(function(){
		        $('#heart').hide();
		        $('#bin_heart').show();
		    });
	
		    $('#bin_heart').click(function(){
		        $('#bin_heart').hide();
		        $('#heart').show();
		    });
		    
		    var text = "${donate.donateContent}";
		    text = stripHtmlTags(text); // HTML 태그 제거

		    
		});
		
		function stripHtmlTags(html) {
		    let doc = new DOMParser().parseFromString(html, 'text/html');
		    return doc.body.textContent || "";
		}
		
	    function checkLogin() {
	        if (${empty loginUser}) {
	            alert("로그인 후 이용해주세요");
	        } else {
	            // 여기에 기부하기 버튼을 클릭했을 때의 동작을 추가하세요
	        }
	    }
	    
	    
	 // note-editable 클래스가 적용된 요소의 높이를 조정하는 함수
	    function adjustEditableHeight(element) {
	        var editable = $(element);
	        editable.css("height", ""); // 높이 초기화
	        var scrollHeight = editable[0].scrollHeight; // 스크롤 높이
	        editable.css("height", scrollHeight + "px"); // 높이 설정
	    }
	 
	    function adjustMainHeight() {
	        var contentHeight = $('.note-editable').outerHeight() + 600; // 내용의 높이 계산
	        if (contentHeight > 1800) {
	            $('main').height(contentHeight); // main 태그의 높이를 내용의 높이로 설정
	        }
	    }
	</script>


	<script
		src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
	<script
		src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>