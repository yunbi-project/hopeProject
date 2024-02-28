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
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div class="detail_main">
            <section class="detail_section1">
                <div style="position: relative;">
                    <img class="detail_thumnail" src="https://mud-kage.kakaocdn.net/dn/bUto3A/btsCJj2tBh0/NEXxP5yHYZ7QfufVWbuUm0/c1400x788.jpg?type=thumb&opt=C700x700">
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
                        <p class="detail_content">
                            ${donate.donateContent }
                        </p>
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
	                            <span>조용히 기부합니다.</span>
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
                    		<c:when test="${donate.donateEndDate lt currentDate and donate.achRate >= 100}">
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
                value="24"
                min="0"
                max="100"
                ></progress>

                <div class="object_num">
                    <span>${donate.achRate}% 달성</span>
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
                        <span>${donate.donateStartDate } ~ ${donate.donateEndDate }</span>
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
							<div class="donationing">기부하기</div>
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
	                    <div class="other_board">
	                        <img class="other_borad_img" src="https://mud-kage.kakaocdn.net/dn/Y8cjj/btsBUMrdZGI/fqubQmn5EKJ7gUZCDAe1n1/c1400x788.jpg?type=thumb&opt=C700x700">
	                        <div class="other_board_content">
	                            <span>${o.donateTitle }</span>
	                            <span>${o.donateFoundation }</span>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </section>
        </div>
    </main>
    
    
    <a href="${contextPath }/donate/boardInsert/${donate.donateNo}"><button type="button">글쓰기</button></a>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(document).ready(function() {
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
		    
		});
	</script>

</body>
</html>