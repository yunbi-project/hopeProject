<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원모집</title>
<link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateList.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <section>
        <article class="h_boardTitle">
            <h1>후원모집</h1>
            <p>기부금을 통해 세상을 발전시킵니다.</p>
        </article>
    </section>

    <h2 style="text-align: center; margin-top: 70px; font-size: 25px;">후원모집</h2>
    <div class="donateGoodFormBorder" style="margin-left: auto; margin-right: auto;"></div>


    <main>
        <div class="center_div">
            <div class="donate_tag">
                <button type="button" style="background-color: #191919; color: white;" id="all" value="0" class="doante_all">전체</button>
                <button type="button" id="income_family" value="1" color="black" class="doante_all">#저소득가정</button>
                <button type="button" id="female" value="2" color="black" class="doante_all">#여성</button>
                <button type="button" id="youth" value="3" color="black" class="doante_all">#청년</button>
                <button type="button" id="our_society" value="4" color="black" class="doante_all">#우리사회</button>
                <button type="button" id="Neighbors_need" value="5" color="black" class="doante_all">#어려운이웃</button>
                <button type="button" id="silver" value="6" color="black" class="doante_all">#실버세대</button>
                <button type="button" id="disabled" value="7" color="black" class="doante_all">#장애인</button>
                <button type="button" id="child" value="8" color="black" class="doante_all">#아동/청소년</button>
                <button type="button" id="animals" value="9" color="black" class="doante_all">#유기동물</button>
            </div>
        </div>
        <div class="right_div">
            
            <div class="tag_count_end" id="tag_recent">
                <img id="tag_img2" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png" >
                <span>최신순</span>
            </div>
            <div class="tag_count_end" id="tag_count">
                <img id="tag_img1" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png" hidden>
                <span>조회순</span>
            </div>
            <div class="tag_count_end" id="tag_end">
                <img id="tag_img3" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png" hidden>
                <span>종료임박순</span>
            </div>
            <div class="tag_count_end" id="end_list">
            	<img id="tag_img4" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png" hidden>
                <span>마감된 후원</span>
            </div>
        </div>
		
		<form class="searchDonateList.bo" method="get" action="${contextPath}/donate/list">
			<div class="searchBar">
				<select class="custom-select" name="condition">
					<option value="foundation"
						${param.condition eq 'foundation'? 'selected':'' }>협회</option>
					<option value="title"
						${param.condition eq 'title'? 'selected':'' }>제목
				</select>
				<input type="text"
					class="archive-search-text input-md width-280px" name="keyword"
					value="${param.keyword}" placeholder="제목 또는 협회 검색을 입력하세요">
				<input type="submit" class="green" value="검색">
			</div>
		</form>
		
		<c:if test="${loginUser.userNo eq 1}">
			<a href="${contextPath }/donate/boardInsert"><button type="button" class="report-btn">글쓰기</button></a>
		</c:if>
		
		
        <section class="donate_section">
        	<c:choose>
        		<c:when test="${empty list }">
        			<p class="empty_board">게시글이 없습니다.</p>
        		</c:when>
        		<c:otherwise>
        			<c:forEach items="${list}" var="d">
			        	<div class="donate_board" onclick="detail(${d.donateNo})">
			                <div class="donate_board_div" data-tagid="${d.tagId}" data-count="${d.count}" data-end="${d.ceilDayDiff}" data-date="${d.donateCreateDate}" data-enddate="${d.donateEndDate}">
			                    <c:if test="${d.changeName eq null}">
				                    <img class="donateList_img" src="https://msf.or.kr/sites/all/themes/msfkorea/images/img-high-value-slide-04.jpg">
			                    </c:if>
			                    <c:if test="${d.changeName ne null }">
				                    <img class="donateList_img" src="${contextPath}/resources/images/donate/${d.changeName}">
			                    </c:if>
			                    <span class="donateList_title">${d.donateTitle }</span>
			                    <span class="donateList_foundation">${d.donateFoundation }</span>
			                    <progress
			                        class="progress"
			                        id="progress"
			                        value="${d.achRate}"
			                        min="0"
			                        max="100"
			                    ></progress>
			                    <div class="progress_value">
			                        <span><fmt:formatNumber value="${d.sumDonate}" type="currency" pattern="#,###"/>원</span>
			                        <span>${d.achRate > 100 ? 100 : d.achRate}%</span>
			                    </div>
			                    <c:if test="${d.ceilDayDiff <= 14}">
				                    <div class="ending_imminent">종료임박</div>
				                </c:if>
				                <c:if test="${d.donateEndDate lt currentDate}">
				                	<div class="ending_imminent">종료</div>
								</c:if>
			                </div>
			            </div>
		           	</c:forEach>
        		</c:otherwise>
        	</c:choose>

        </section>
    </main>
    
    

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script>
		// 상세페이지로 이동
		function detail(donateNo){
			location.href="${contextPath}/donate/detail/"+donateNo
		}
		
		$(document).ready(function() {
			
		    var currentDate = new Date(); // 현재 날짜를 가져옴
		    var clickedTagId = 0; // 초기에는 전체 태그를 나타내는 0으로 설정합니다.
		    
		    $('.donate_board').each(function() {
		        var endDate = new Date($(this).find('.donate_board_div').data('enddate')); // donate_board_div 내의 data-enddate 속성값을 가져옵니다.
		        if (endDate > currentDate) {
		            $(this).show(); // 종료되지 않은 기부는 보이게 합니다.
		        } else {
		            $(this).hide(); // 종료된 기부는 숨깁니다.
		        }
		    });
			
		    $('#tag_recent').click(function() {
		    	sortListByRecent();
		        $('#tag_img2').removeAttr('hidden');
		        $('#tag_img1').attr('hidden', 'hidden');
		        $('#tag_img3').attr('hidden', 'hidden');
		        $('#tag_img4').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_count span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_end span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#end_list span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_count span').nextAll().attr('hidden', 'hidden');
		        $('#tag_end span').nextAll().attr('hidden', 'hidden');
		        $('#end_list span').nextAll().attr('hidden', 'hidden');
		        
		        
				filterAndSortList(clickedTagId, 'recent'); // 선택된 태그에 따라 리스트 필터링 후 최신순으로 정렬

		        
		    });

		    $('#tag_end').click(function() {
		    	sortListByEnd();
		        $('#tag_img3').removeAttr('hidden');
		        $('#tag_img1').attr('hidden', 'hidden');
		        $('#tag_img2').attr('hidden', 'hidden');
		        $('#tag_img4').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_count span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_recent span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#end_list span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_count span').nextAll().attr('hidden', 'hidden');
		        $('#tag_recent span').nextAll().attr('hidden', 'hidden');
		        $('#end_list span').nextAll().attr('hidden', 'hidden');
		        

		        filterAndSortList(clickedTagId, 'end'); // 선택된 태그에 따라 리스트 필터링 후 종료임박순으로 정렬

		    });

		    $('#tag_count').click(function() {
		    	sortListByCount();
		        $('#tag_img1').removeAttr('hidden');
		        $('#tag_img2').attr('hidden', 'hidden');
		        $('#tag_img3').attr('hidden', 'hidden');
		        $('#tag_img4').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_recent span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_end span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#end_list span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_recent span').nextAll().attr('hidden', 'hidden');
		        $('#tag_end span').nextAll().attr('hidden', 'hidden');
		        $('#end_list span').nextAll().attr('hidden', 'hidden');
	
		        
	
	            filterAndSortList(clickedTagId, 'count'); // 선택된 태그에 따라 리스트 필터링 후 조회순으로 정렬
		        

		    });
		    
		    
		    
		    $('#end_list').click(function() {
		    	
		        $('#tag_img4').removeAttr('hidden');
		        $('#tag_img2').attr('hidden', 'hidden');
		        $('#tag_img3').attr('hidden', 'hidden');
		        $('#tag_img1').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_recent span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_end span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_count span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_recent span').nextAll().attr('hidden', 'hidden');
		        $('#tag_end span').nextAll().attr('hidden', 'hidden');
		        $('#tag_count span').nextAll().attr('hidden', 'hidden');
		        
		        
		        filterAndSortList(clickedTagId, 'end_list');

		    });

		    $('.doante_all').click(function() {
		        // 클릭된 요소의 배경색과 글자색을 변경하고, 나머지 요소의 배경색과 글자색을 초기화
		        $(this).css({'background-color': '#191919', 'color': 'white'}).siblings().css({'background-color': 'white', 'color': 'black'});
		        // 클릭된 버튼의 value 값 가져오기
		        clickedTagId = $(this).val();
		        filterContent(clickedTagId);
		    });

		    

		    
		    // 내용 필터링 함수
		    function filterContent(tagId) {
		        $(".donate_board").each(function() {
		            var endDate = new Date($(this).find('.donate_board_div').data("enddate"));
		            var boardTagId = parseInt($(this).find('.donate_board_div').data("tagid"));
		            if ((tagId === "0" || boardTagId === parseInt(tagId)) && endDate > currentDate) {
		                $(this).show(); // 보여주기
		            } else {
		                $(this).hide(); // 숨기기
		            }
		        });
		    }

		    // 최신순 정렬 함수
		    function sortListByRecent() {
		        var $list = $('.donate_section');
		        var $items = $list.children('.donate_board');
		        $items.sort(function(a, b) {
		            var keyA = new Date($(a).find('.donate_board_div').data('date'));
		            var keyB = new Date($(b).find('.donate_board_div').data('date'));
		            return keyB - keyA;
		        });
		        $list.append($items);
		    }

		    // 종료임박순 정렬 함수
		    function sortListByEnd() {
		        var $list = $('.donate_section');
		        var $items = $list.children('.donate_board');
		        $items.sort(function(a, b) {
		            var keyA = parseInt($(a).find('.donate_board_div').data('end'));
		            var keyB = parseInt($(b).find('.donate_board_div').data('end'));
		            return keyA - keyB;
		        });
		        $list.append($items);
		    }

		    // 조회순 정렬 함수
		    function sortListByCount() {
		        var $list = $('.donate_section');
		        var $items = $list.children('.donate_board');
		        $items.sort(function(a, b) {
		            var keyA = parseInt($(a).find('.donate_board_div').data('count'));
		            var keyB = parseInt($(b).find('.donate_board_div').data('count'));
		            return keyB - keyA;
		        });
		        $list.append($items);
		    }

		    // "마감된 후원" 버튼 클릭 시 종료된 후원만 보여줍니다.
		    function showClosedDonations() {
		        $('.donate_board').each(function() {
		            var endDate = new Date($(this).find('.donate_board_div').data('enddate')); // 종료일을 가져옴
		            var boardTagId = parseInt($(this).find('.donate_board_div').data('tagid')); // 태그 ID를 가져옴
		            // 종료된 후원이면서 선택된 태그에 해당하는 경우에만 보여줍니다.
		            if (endDate < currentDate && (clickedTagId == 0 || boardTagId == clickedTagId)) {
		                $(this).show(); // 보여주기
		            } else {
		                $(this).hide(); // 숨기기
		            }
		        });
		    }
		    
		    function filterAndSortList(tagId, sortType) {
		        $(".donate_board").each(function() {
		            var endDate = new Date($(this).find('.donate_board_div').data("enddate"));
		            var boardTagId = parseInt($(this).find('.donate_board_div').data("tagid"));
		            if ((parseInt(tagId) === 0 || boardTagId === parseInt(tagId)) && endDate > currentDate) {
		                $(this).show(); // 보여주기
		            } else {
		                $(this).hide(); // 숨기기
		            }
		        });

		        if (sortType === 'recent') {
		            sortListByRecent(); // 최신순으로 정렬
		        } else if (sortType === 'count') {
		            sortListByCount(); // 조회순으로 정렬
		        } else if (sortType === 'end') {
		            sortListByEnd(); // 종료임박순으로 정렬
		        } else if (sortType == 'end_list'){
		        	showClosedDonations();
		        }
		    }

		});

		
		
	</script>
	
	
	
</body>
</html>