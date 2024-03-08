<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, java.util.Date,
     com.kh.hope.board.model.vo.Board, com.kh.hope.donate.model.vo.Donate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%
    // 현재 날짜를 얻기 위해 Date 객체를 생성합니다.
    Date currentDate = new Date();

    // 현재 날짜에서 월을 가져옵니다. (1부터 시작)
    // getMonth() 메서드는 0부터 시작하므로 1을 더합니다.
    int month = currentDate.getMonth() + 1;
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<link rel="stylesheet"
	href="${contextPath}/resources/style/css/sangjun.css/summernote/summernote-lite.css">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link rel="stylesheet" href="./resources/style/css/hyun.css/mainPage.css">
   
   
    <!-- 슬라이드바 -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   
    <script src="./resources/js/hyun.js/mainPage.js"></script>

    <!-- 다중 슬라이드바 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
        <section id="wrapper">
            <div id="slider-wrap">
                <ul id="slider">
                   <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">CAMPAIGN</h3><br>
                            <div style="border: 4px solid rgb(157, 222, 60); width: 80px;"></div><br>
                            <span>희망의 세상은 그냥 만들어지지 않으니까</span>
                            <h3 style="margin-top: 10px;">희망의 조각</h3>
                            <button class="h_slider_btn" onclick="window.location.href ='${contextPath}/board/R'">자세히 보기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>
                        <img class="slick-slide" src="https://www.v1365.or.kr/new/img/qna/02_top.jpg">
                   </li>

                    <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">DONATION</h3><br>
                            <div style="border: 4px solid rgb(117, 173, 34); width: 80px;"></div><br>
                            <span>나와 우리 그리고 지구를 위한</span>
                            <h3 style="margin-top: 10px;">물품기부</h3>
                            <button  class="h_slider_btn" onclick="window.location.href ='${contextPath}/product'">물품기부 참여하기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>                
                        <img class="slick-slide"  src="https://t1.daumcdn.net/cfile/tistory/27710E3856DD248E35">
                    </li>
                   
                   <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">CAMPAIGN</h3><br>
                            <div style="border: 4px solid rgb(117, 173, 34); width: 80px;"></div><br>
                            <span>자립준비 청년의 내일을 응원해주세요</span>
                            <h3 style="margin-top: 10px;">희망의 함께서기</h3>
                            <button class="h_slider_btn">자세히 보기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>
                        <img class="slick-slide"  src="https://www.beautifulstore.org/wp-content/uploads/2020/08/%EC%A0%9C%EB%AA%A9-%EC%97%86%EC%9D%8C-1-5.png">
                   </li>
                   
                   <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">VOLUNTEER</h3><br>
                            <div style="border: 4px solid rgb(117, 173, 34); width: 80px;"></div><br>
                            <span>나와 세상을 밝히는 시간</span>
                            <h3 style="margin-top: 10px;">희망의 조각 자원봉사</h3>
                            <button class="h_slider_btn" onclick="window.location.href ='${contextPath}/program/list'">바로가기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>
                        <img class="slick-slide"  src="https://www.1365.go.kr/upload/attachments/5615109e-83da-4827-8c8b-d0dbe11827db.png">
                   </li>

                </ul>
               
                 <!--controls-->
                <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
                <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
                <div id="counter"></div>
               
                <div id="pagination-wrap">
                    <ul>
                    </ul>
                </div>
                <!--controls-->  
                       
            </div>
        </section>

        <!-- //visual -->
        <section class="overlap-group">
            <div class="h_rectangle-3" ></div>
            <p class="p">&#34; 모두가 함께하는 나눔과 순환의 희망의 조각 만들기 &#34;</p>
            <div class="h_rectangle-4" ></div>
            <div class="h_group">
                <div class="h_overlap-group-2">
                    <img class="h_line-6" src="https://www.beautifulstore.org/wp-content/themes/bs/images/meta/img_slogan11.png" >
                </div>
            </div>
            <div class="h_overlap-wrapper">
                <div class="h_overlap-2">
                    <img class="h_line-8"  src="https://www.beautifulstore.org/wp-content/themes/bs/images/meta/img_slogan22.png" >
                </div>
            </div>
            <div class="h_overlap-group-wrapper">
                <div class="h_overlap-3">
                    <img class="h_line-10"  src="https://www.beautifulstore.org/wp-content/themes/bs/images/meta/img_slogan33.png" >
                </div>
            </div>
            <div class="h_text-wrapper-17">자원재순환</div>
            <div class="h_text-wrapper-18">참여문화</div>
            <div class="h_text-wrapper-19">국내·외 지원</div>
            <p class="h_text-wrapper-20">일상의 나눔과 자원의 재순환을 통해 세상의 생명을 연장합니다.</p>
            <p class="h_text-wrapper-21">물품기부, 후원, 봉사 등 다양한 참여로 나눔의 가치를 전파합니다.</p>
            <p class="h_text-wrapper-22">소외된 이웃과 사회를 위한 나눔으로 세상을 긍정적으로 변화시킵니다.</p>
          </section>

          <!-- 지금껏 후원한 사람들-->
        <section>
            <div class="donation_people">
                <p class="h_div-2">
                  <span class="h_span">희망의 조각</span>
                  <span class="h_text-wrapper-23">
                    은 국내 대표 비영리공익재단으로 우리 사회의 생태적, 친환경적 변화에 기여하고 국내외 소외계층 및 공익활동을
                    지원하며 시민의식 성장과 풀뿌리공동체 발전을 위해 노력합니다.
                  </span>
                </p>
                <p class="h_text-wrapper-24">지금까지 희망의 조각에는 여러분의 많은 참여와 후원이 있었습니다.</p>
                <div class="h_text-wrapper-25">마음을 나누어주신 든든한 후원자님</div>
                <div class="h_text-wrapper-26">
                  많은 이들의 힘을 주신
                  <br>
                  자원활동가님
                </div>
                <div>
              		<div class="h_text-wrapper-27">0 명</div>
                	<div class="h_text-wrapper-28">0 명</div>
                </div>

                <p class="h_div-3">
                  <span class="h_text-wrapper-29">투명하고 믿을 수 있는 </span>
                  <span class="h_text-wrapper-30">희망의 조각</span>
                  <span class="h_text-wrapper-29"> 재단</span>
                </p>
            </div>
        </section>

        <img class="background-image" style="transform: scaleX(-1); position: absolute;  width:600px; z-index: 1;  margin-top: 1100px;
    margin-left: 900px;"
        src="${contextPath}/resources/style/img/mainPage/notice_background.png">

        <!-- 공지&나눔 소식 -->
        <section style="position: relative; z-index: 2;">
            <article class="shareNews">
                <div style="text-align: center; padding-bottom: 50px; width: 1430px;">
                    <span class="newTitle">희망의 조각 소식</span><span style="font-size:20px;">News & Stories</span>
                </div>


                <div class="all_board main_notice">
                    <div style="display: flex; justify-content: space-between;">
                        <div>
                            <span class="h_titleLine"></span>
                            <span class="h_sharingProjectTitle"><a>공지사항</a></span>
                            <img class="h_shaerNews_arrow" src="${contextPath}/resources/style/img/mainPage/화살표.png">
                            <a href="${contextPath}/board/N"><span class="sharingProjec_more">더보기</span></a>
                        </div>

                        <div style="margin-right: 340px;">
                            <span class="h_titleLine"></span>
                            <span class="h_sharingProjectTitle"><a>나눔소식</a><span style="font-size: 13px; color: rgb(235, 38, 51);"> <%= month %>월  HOT!</span>
                            <img class="h_shaerNews_arrow" src="${contextPath}/resources/style/img/mainPage/화살표.png">
                            <a href="${contextPath}/board/R"><span class="sharingProjec_more">더보기</span></a>
                        </div>
                    </div>
                    
                    
                    <div class="other_board">
                        <ul>
                        	<c:forEach items="${noticeList}" var="n">
	                            <li>
	                                <div class="subject">
	                                    <strong class="notice_mark">공지</strong>
	                                    <a href="${contextPath}/board/detail/N/${n.boardNo}">${n.boardTitle}</a>
	                                    <c:choose>
	                                    	<c:when test="${n.createDate >= sevenDaysAgo}">
			                                    <img class="new" src="https://cdn-icons-png.flaticon.com/128/10785/10785605.png">
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<img class="new_display" src="">
	                                    	</c:otherwise>
	                                    </c:choose>
	                                    <img class="time" src="https://cdn-icons-png.flaticon.com/128/6659/6659457.png">
	                                    <span class="notice_date">${n.createDate }</span>
	                                </div>
	                            </li>
	                            <hr class="notice_hr">
                        	</c:forEach>
                        </ul>
                        
                        <div class="share_board_banner">
                            <div class="slide-wrapper">
							 <%
							    // shareList 리스트 가져오기
							    List<Board> shareList = (List<Board>)request.getAttribute("shareList");
							
							    // shareList가 null이 아니고 비어있지 않은 경우에만 반복문 실행
							    if(shareList != null && !shareList.isEmpty()) {
							        for(Board r : shareList) {
							            // changeName 변수 가져오기
							            String changeName = r.getChangeName();
							            int boardNo = r.getBoardNo();
							%>
							            <%-- changeName이 null인 경우 --%>
							            <% if(changeName == null) { %>
							            	<a href="<%= request.getContextPath() %>/board/detail/R/<%= boardNo %>">
								                <div class="slide"> 
								                    <img style="width:310px; height:300px;" src="https://www.beautifulstore.org/wp-content/uploads/2023/11/%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%A3%E1%84%80%E1%85%B5_1.png">
								                </div>
							                </a>
							            <% } else { %>
							            	<a href="<%= request.getContextPath() %>/board/detail/R/<%= boardNo %>">
								                <div class="slide">
								                    <img style="width:310px; height:300px;" src="<%= request.getContextPath() %>/resources/images/board/R/<%= changeName %>">
								                </div>
							                </a>
							            <% } %>
							<%
							        }
							    }else{
							 %>
						        <div class="slide_none">
							        <img style="width:310px; height:300px;" src="<%= request.getContextPath() %>/resources/images/board/default_image.png">
							    </div>
							<%
							    }
							%>
								
                            </div>
                            <button class="button prev"><img src="https://cdn-icons-png.flaticon.com/128/5697/5697757.png"></button>
                            <button class="button next"><img src="https://cdn-icons-png.flaticon.com/128/5697/5697771.png"></button>
                        </div>

                        <div class="share_board_content">
                            <div class="slide-wrapper">
                            <%
							    // shareList가 null이 아니고 비어있지 않은 경우에만 반복문 실행
							    if(shareList != null && !shareList.isEmpty()) {
							        for(Board r : shareList) {
							            // changeName 변수 가져오기
							            String boardTitle = r.getBoardTitle();
							            String userName = r.getUserName();
							            String boardContent = r.getBoardContent();
							            int boardLength = boardContent.length();
							%>
						
							            <div class="slide slide_content">
			                              	<h3><%= boardTitle %></h3>
			                              	<span><%= userName %></span><br>
			                              	
			                              	<textarea class="textarea summernote" readonly="readonly">
			                              		<%= boardContent %>
			                              	</textarea>
			                              	<% if(boardLength >= 300) { %>
			                              	<span>...</span>
			                              	<% } else {%>
			                              	<span></span>
			                              	<% } %>
						          		</div>
							<%
							        }
							    }else{
							%>
								<div class="slide slide_content">
	                              	<span>아쉽게도 이번달 HOT 게시글이 없어요!</span>
				          		</div>
				          	<%
							    }
							%>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </section>
        
        <!-- 일정 글자수 넘으면 ... 처리 -->
        <script>
		$(document).ready(function() {
			// 썸머노트 초기화
		    $('.summernote').summernote({
		        toolbar: [], // 툴바 비활성화 (읽기 전용으로 설정)
		        airMode: true, // 에어모드 활성화
		        disableResizeEditor: true, // 에디터 크기 조절 비활성화
		        focus: false, // 포커스 설정 (선택사항)
		        codeview: false // 코드 보기 비활성화
		    });
			
			

		    // 썸머노트에 텍스트 삽입
		    $('.summernote').summernote('code', text);

		    // 에디터를 비활성화하여 사용자의 입력을 막습니다.
		    $('.summernote').summernote('disable');

		});
		</script>
		
		<script
		src="${contextPath}/resources/js/sangjun.js/summernote/summernote-lite.js"></script>
		<script
			src="${contextPath}/resources/js/sangjun.js/summernote/lang/summernote-ko-KR.js"></script>


        <!-- 함께하는 나눔 프로젝트 -->
        <section>
        	<article class="sharingProject1">
                <div class="all_board">
                    <span class="h_titleLine"></span>
                    <span class="h_sharingProjectTitle"><a>함께하는 나눔 프로젝트</a></span>
                    <img class="h_shaerNews_arrow" src="${contextPath}/resources/style/img/mainPage/화살표.png">
                    <a href="${contextPath}/donate/list"><span class="sharingProjec_more">더보기</span></a>
					
                    <div class="end_donate_box">
                    	<c:choose>
                    		<c:when test="${empty donate}">
                    			<div style="text-align:center; font-size: 20px; font-weight: bold;">
	                    			<span>곧 마감될 게시글이 존재하지 않아요!</span>
                    			</div>
                    		</c:when>
                    		<c:otherwise>
                    			
		                        <div style="display:flex; align-items: center;
		                        justify-content: space-around; height: 100px;">
		                            <div class="end_donate_find">
		                                <h4>마지막 기부자를 찾습니다 👀</h4>
		                                <p color="gray70" class="bVzSkM izzHXh">목표 달성을 위해 당신의 마음도 함께 나눠주세요!</p>
		                                <!-- <p>목표 달성까지 얼마 남지 않았어요!</p> -->
		                            </div>
		                            <!-- 숫자 카운트 다운 -->
		                            <div class="countdown">
		                                <div class="days timer">
		                                    <h3 class="days__title h3">${donate.ceilDayDiff}</h3>
		                                    <p class="p">Days</p>
		                                </div>
		                                <div class="hours timer">
		                                    <h3 class="hours__title h3"></h3>
		                                    <p class="p">Hours</p>
		                                </div>
		                                <div class="minutes timer">
		                                    <h3 class="minutes__title h3"></h3>
		                                    <p class="p">Minutes</p>
		                                </div>
		                                <div class="seconds timer">
		                                    <h3 class="seconds__title h3"></h3>
		                                    <p class="p">Seconds</p>
		                                </div>
		                            </div>
		                        </div>
		                        
		                        <div class="end_donate_all">
		                            <div class="end_donate_reamount">
		                                <span>남은 금액</span>
		                                <c:choose>
		                                	<c:when test="${donate.sumDonate eq 0}">
			                                	<span class="end_num"><fmt:formatNumber value="${donate.donateHope}" type="currency" pattern="#,###"/>원</span>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<span class="end_num"><fmt:formatNumber value="${donate.donateHope} - ${donate.sumDonate}" type="currency" pattern="#,###"/>원</span>
		                                	</c:otherwise>
		                                </c:choose>
		                            </div>
		                            <div>
		                            	<a href="${contextPath}/donate/detail/${donate.donateNo}">
		                            		<c:choose>
		                            			<c:when test="${donate.changeName eq null}">
			                            			<img style="cursor:pointer; width: 400px; height: 260px; border-radius: 10px;" src="https://msf.or.kr/sites/all/themes/msfkorea/images/img-high-value-slide-04.jpg">
		                            			</c:when>
		                            			<c:otherwise>
					                                <img style="cursor:pointer; width: 400px; height: 260px; border-radius: 10px;" src="${contextPath}/resources/images/donate/${donate.changeName}">
		                            			</c:otherwise>
		                            		</c:choose>
			                                <c:if test="${donate.donateEndDate lt currentDate and donate.ceilDayDiff ne 0}">
					                    		<div class="ending_imminent">종료</div>        
					                    	</c:if>
					                    	<c:if test="${donate.ceilDayDiff eq 0}">
					                    		<div class="ending_imminent">오늘마감</div>
					                    	</c:if>
					                    	<c:if test="${donate.ceilDayDiff <= 14 and donate.ceilDayDiff ne 0}">
					                    		<div class="ending_imminent">종료임박</div>
					                    	</c:if>
		                            	</a>
		                            </div>
		                            <div class="end_donate_content">
		                                <h3>${donate.donateTitle}</h3>
		                                <progress
		                                class="progress"
		                                id="progress"
		                                value="${donate.achRate}"
		                                min="0"
		                                max="100"
		                            ></progress>
		                                <div class="end_donate_money">
		                                    <span><fmt:formatNumber value="${donate.sumDonate}" type="currency" pattern="#,###"/>원</span>
		                                    <span><fmt:formatNumber value="${donate.donateHope}" type="currency" pattern="#,###"/>원 목표</span>
		                                </div>
		                                <div class="end_donate_rate">
		                                    <span>${donate.achRate}% 달성</span>
		                                    <c:choose>
		                                    	<c:when test="${donate.donateEndDate lt currentDate and donate.ceilDayDiff ne 0}">
						                    		<span>모집 종료</span>        
						                    	</c:when>
						                    	<c:when test="${donate.ceilDayDiff eq 0}">
						                    		<span style="color:red; font-weight:bold;">오늘마감</span>
						                    	</c:when>
						                    	<c:otherwise>
						                    		 <span>${donate.ceilDayDiff}일 남음</span>
						                    	</c:otherwise>
		                                    </c:choose>
		                                </div>
		                                <a href="${contextPath}/donate/detail/${donate.donateNo}">
			                                <button type="button" class="donationing">기부하기</button>
		                                </a>
		                            </div>
		                        </div>
                    		</c:otherwise>
                    	</c:choose>

                    </div>
                </div>
            </article>
        	
        	
            <article class="sharingProject">
 
                <div class="swiper-container">
                    <div class="other_donate_title" style="display: flex; align-items: center;">
                    	<img class="other_donate_img" src="https://cdn-icons-png.flaticon.com/128/7626/7626740.png">
            			<span>희망의 조각의 또다른 후원 이야기를 확인해보세요!</span>
            		</div>
	            	<img class="other_donate_bottom" src="${contextPath}/resources/style/img/mainPage/underline.png">
	            	
	            	
                    <div class="swiper-wrapper">
                   	    <%
                   	    	List<Donate> donateList = (List<Donate>)request.getAttribute("donateList");
                   	    
						    // shareList가 null이 아니고 비어있지 않은 경우에만 반복문 실행
						    if(donateList != null && !donateList.isEmpty()) {
						        for(Donate d : donateList) {
						            // changeName 변수 가져오기
						            String donateTitle = d.getDonateTitle();
						            int donateNo = d.getDonateNo();
						            String donateFoundation = d.getDonateFoundation();
						            int donateHope = d.getDonateHope();
						            int ceilDayDiff = d.getCeilDayDiff();
						            int achRate = d.getAchRate();
						            String changeName= d.getChangeName();
						            int sumDonate = d.getSumDonate();
						%>

						            
	                        <div class="swiper-slide">
	                            <div>
                            	<% if(changeName == null) { %>
	                            	<a href="<%= request.getContextPath() %>/donate/detail/<%= donateNo %>">
		                                <img src="https://msf.or.kr/sites/all/themes/msfkorea/images/img-high-value-slide-04.jpg">
	                            	</a>
                            	<% } else { %>
	                            	<a href="<%= request.getContextPath() %>/donate/detail/<%= donateNo %>">
		                                <img src="<%= request.getContextPath() %>/resources/images/donate/<%= changeName %>">
	                            	</a>
                            	<% } %>
                                <div class="h_donation_container">
                                    <div style="margin-top: 5px;height:35px; font-weight:bold;">
                                        <span><%= donateTitle %></span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress_other"
                                        id="progress_other"
                                        value="<%= achRate %>"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div class="other_donate_money">
	                                    <span><%= sumDonate %>원</span>
	                                    <span><%= donateHope %>원 목표</span>
	                                </div>
	                                <div class="other_donate_rate">
	                                    <span><%= achRate %>% 달성</span>
	                                    <span><%= ceilDayDiff %>일 남음</span>
	                                </div>
                                </div>
                            </div>
                        </div>
					<%		}
					    }else{
					%>
						<div class="swiper-slide none_donate">
                             	<span style="font-weight:bold; font-size: 50px; width:1200px !important; text-align:center;">등록된 게시글이 없습니다.</span>
		          		</div>
		          	<%
					    }
					%>
               		</div>
                    <!-- 네비게이션 -->
                    <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                    <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
               
                    <!-- 페이징 -->
                    <div class="swiper-pagination"></div>
                </div>
            </article>
        </section>
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    

	  
	  
    <script>
        // 광고 배너 JS
        var pos = 0;
        var totalSlides = $('#slider-wrap ul li').length;
        var sliderWidth = $('#slider-wrap').width();


        $(document).ready(function(){  
            /*****************
             BUILD THE SLIDER
            *****************/
            //set width to be 'x' times the number of slides
            $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
           
                //next slide  
            $('#next').click(function(){
                slideRight();
            });
           
            //previous slide
            $('#previous').click(function(){
                slideLeft();
            });
           
            /*************************
             //*> OPTIONAL SETTINGS
            ************************/
            //automatic slider
            var autoSlider = setInterval(slideRight, 3000);
           
            //for each slide
            $.each($('#slider-wrap ul li'), function() {

                //create a pagination
                var li = document.createElement('li');
                $('#pagination-wrap ul').append(li);    
            });
           
            //counter
            countSlides();
           
            //pagination
            pagination();
           
            //hide/show controls/btns when hover
            //pause automatic slide when hover
            $('#slider-wrap').hover(
                function(){ $(this).addClass('active'); clearInterval(autoSlider); },
                function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
            );

            // 클릭한 슬라이드로 이동하는 이벤트
            $('#pagination-wrap ul li').click(function() {
                // 클릭한 슬라이드의 인덱스 가져오기
                var clickedIndex = $(this).index();
               
                // 현재 슬라이드의 인덱스와 클릭한 슬라이드의 인덱스 비교
                if (clickedIndex !== pos) {
                    // 클릭한 슬라이드로 이동
                    pos = clickedIndex;
                    $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));
                   
                    // 슬라이드 번호 업데이트
                    countSlides();
                    pagination();
                }
            });
            

        });//DOCUMENT READY
            

        /***********
         SLIDE LEFT
        ************/
        function slideLeft(){
            pos--;
            if(pos==-1){ pos = totalSlides-1; }
            $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
       
            //*> optional
            countSlides();
            pagination();
        }

        /************
         SLIDE RIGHT
        *************/
        function slideRight(){
            pos++;
            if(pos==totalSlides){ pos = 0; }
            $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));
       
            //*> optional
            countSlides();
            pagination();
        }
       
        /************************
         //*> OPTIONAL SETTINGS
        ************************/
        function countSlides(){
            $('#counter').html(pos+1 + ' / ' + totalSlides);
        }

        function pagination(){
            $('#pagination-wrap ul li').removeClass('active');
            $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
        }
        
        
        // 명수 자동 증가
        function countUp(targetElement, start, end, duration) {
            let current = start;
            const range = end - start;
            const increment = end > start ? 1 : -1;
            const stepTime = Math.abs(Math.floor(duration / range));
            const element = document.querySelector(targetElement);
            const timer = setInterval(() => {
              current += increment;
              element.innerHTML = current.toLocaleString() + ' 명';
              if (current === end) {
                clearInterval(timer);
              }
            }, stepTime);
          }
        

          // 숫자 자동으로 증가하는 JS
          countUp('.h_text-wrapper-27', 0, ${total.donateTotal}, 10000); // 3초 동안 0부터 11000까지 증가
          countUp('.h_text-wrapper-28', 0, ${total.activityTotal}, 10000); // 3초 동안 0부터 11000까지 증가
         
    </script>
    
    <!-- 나눔 소식 슬라이드 바 -->
    <script>
        $(document).ready(function() {
        	
        	
            const bannerSlideWrapper = $('.share_board_banner .slide-wrapper');
            const contentSlideWrapper = $('.share_board_content .slide-wrapper');
            let currentIndex = 0;
            const slideCount = $('.slide').length-3;
            const slideWidth = 310; // 슬라이드의 너비


            // 다음 슬라이드로 이동하는 함수
            function nextSlide() {
                currentIndex++;
                if (currentIndex === slideCount) {
                    currentIndex = 0;
                }
                updateSlidePosition();
            }

            // 이전 슬라이드로 이동하는 함수
            function prevSlide() {
                currentIndex--;
                if (currentIndex < 0) {
                    currentIndex = slideCount - 1;
                }
                updateSlidePosition();
            }

            // 현재 슬라이드 위치 업데이트 함수
            function updateSlidePosition() {
                const newPosition = -currentIndex * slideWidth;
                bannerSlideWrapper.css('transform', 'translateX(' + newPosition + 'px)');
                contentSlideWrapper.css('transform', 'translateX(' + newPosition + 'px)');
            }
            
            

            // 다음 버튼 클릭 이벤트 핸들러
            $('.share_board_banner .button.next').click(nextSlide);

            // 이전 버튼 클릭 이벤트 핸들러
            $('.share_board_banner .button.prev').click(prevSlide);

            // 자동으로 다음 슬라이드로 넘어가는 함수
            function autoSlide() {
                nextSlide();
            }

            // 일정한 시간 간격으로 자동으로 다음 슬라이드로 이동
            setInterval(autoSlide, 4000); // 4초마다 슬라이드 변경


            // 초기에 버튼을 투명하게 처리
            $('.button').css('opacity', '0');

            // 마우스가 .share_board_banner에 진입했을 때의 이벤트 처리
            $('.share_board_banner').mouseenter(function() {
                // 버튼 태그들을 천천히 나타나도록 변경
                $('.button').stop().animate({ opacity: 1 }, 'slow');
            });

            // 마우스가 .share_board_banner에서 빠져나왔을 때의 이벤트 처리
            $('.share_board_banner').mouseleave(function() {
                // 버튼 태그들을 천천히 숨기도록 변경
                $('.button').stop().animate({ opacity: 0 }, 'slow');
            });

            $('.next img').hover(
                function() {
                // 마우스를 올렸을 때의 동작
                $(this).attr('src', 'https://cdn-icons-png.flaticon.com/128/318/318476.png'); // 새로운 이미지로 교체
                },
                function() {
                // 마우스를 내렸을 때의 동작
                $(this).attr('src', 'https://cdn-icons-png.flaticon.com/128/5697/5697771.png');
                }
            );

            $('.prev img').hover(
                function() {
                // 마우스를 올렸을 때의 동작
                $(this).attr('src', 'https://cdn-icons-png.flaticon.com/128/318/318477.png'); // 새로운 이미지로 교체
                },
                function() {
                // 마우스를 내렸을 때의 동작
                $(this).attr('src', 'https://cdn-icons-png.flaticon.com/128/5697/5697757.png');
                }
            );
            
            // 슬라이드 쇼 영역의 너비를 동적으로 설정
            function setSlideWrapperWidth() {
                var totalWidth = slideCount * slideWidth;
                bannerSlideWrapper.css('width', totalWidth + 'px');
                contentSlideWrapper.css('width', totalWidth + 'px');
            }

            // 페이지가 로드될 때 한 번 호출하여 초기 너비 설정
            setSlideWrapperWidth();
        });

     	

    </script>

    <!-- 숫자 자동 감소 카운타 다운 -->
    <script>
		function updateCountdown() {
		    // 현재 시간을 가져옵니다.
		    var now = new Date();
		
		    // 다음 날 자정의 시간을 설정합니다.
		    var tomorrow = new Date(now);
		    tomorrow.setDate(tomorrow.getDate() + 1);
		    tomorrow.setHours(0, 0, 0, 0);
		
		    // 현재 시간과 다음 날 자정까지의 차이를 계산합니다.
		    var timeDifference = tomorrow - now;
		
		    // 남은 시간을 시, 분, 초로 변환합니다.
		    var hours = Math.floor(timeDifference / (1000 * 60 * 60));
		    var minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
		    var seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);
		
		    // 결과를 HTML 요소에 표시합니다.
		    $(".hours__title").text(hours);
		    $(".minutes__title").text(minutes);
		    $(".seconds__title").text(seconds);
		}
		
		// 매 초마다 updateCountdown 함수를 호출하여 시간을 업데이트합니다.
		setInterval(updateCountdown, 1000);
		
		// 페이지가 로드될 때 한 번 실행하여 초기 시간을 표시합니다.
		updateCountdown();

    </script>
    


</body>
</html>