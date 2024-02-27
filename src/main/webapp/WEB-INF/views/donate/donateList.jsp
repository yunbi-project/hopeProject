<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부하기 리스트</title>
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
                <button type="button" style="background-color: #191919; color: white;" id="all" color="black" class="doante_all">전체</button>
                <button type="button" id="income_family" color="black" class="doante_all">#저소득가정</button>
                <button type="button" id="female" color="black" class="doante_all">#여성</button>
                <button type="button" id="youth" color="black" class="doante_all">#청년</button>
                <button type="button" id="our_society" color="black" class="doante_all">#우리사회</button>
                <button type="button" id="Neighbors_need" color="black" class="doante_all">#어려운이웃</button>
                <button type="button" id="silver" color="black" class="doante_all">#실버세대</button>
                <button type="button" id="disabled" color="black" class="doante_all">#장애인</button>
                <button type="button" id="child" color="black" class="doante_all">#아동/청소년</button>
                <button type="button" id="animals" color="black" class="doante_all">#유기동물</button>
            </div>
        </div>
        <div class="right_div">
            <div class="tag_count_end" id="tag_count">
                <img id="tag_img1" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png">
                <span>조회순</span>
            </div>
            <div class="tag_count_end" id="tag_recent">
                <img id="tag_img2" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png" hidden>
                <span>최신순</span>
            </div>
            <div class="tag_count_end" id="tag_end">
                <img id="tag_img3" class="tag_img" src="https://cdn-icons-png.flaticon.com/128/11498/11498426.png" hidden>
                <span>종료임박순</span>
            </div>
        </div>

		<div class="searchBar">
			<select class="custom-select" name="condition">
				<option value="content"
					${param.condition eq 'content'? 'selected':'' }>내용</option>
				<option value="title"
					${param.condition eq 'title'? 'selected':'' }>제목</option>
			</select>
			<input type="text"
				class="archive-search-text input-md width-280px" name="keyword"
				value="${param.keyword}" placeholder="제목 또는 내용 검색을 입력하세요">
			<input type="submit" class="green" value="검색">
		</div>


        <section class="donate_section">
        	<c:choose>
        		<c:when test="${empty list }">
        			<p class="empty_board">게시글이 없습니다.</p>
        		</c:when>
        		<c:otherwise>
        			<c:forEach items="${list}" var="d">
			        	<div class="donate_board">
			                <div class="donate_board_div">
			                    <img class="donateList_img" src="https://mud-kage.kakaocdn.net/dn/bUto3A/btsCJj2tBh0/NEXxP5yHYZ7QfufVWbuUm0/c1400x788.jpg?type=thumb&opt=C700x700">
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
			                        <span>${d.sumDonate}원</span>
			                        <span>${d.achRate}%</span>
			                    </div>
			                    <div class="ending_imminent">종료임박</div>
			                </div>
			            </div>
		           	</c:forEach>
        		</c:otherwise>
        	</c:choose>

        </section>
    </main>


	<script>
		function detail(donateNo){
			location.href="${contextPath}/donate/detail/"+donateNo
		}
		
		$(document).ready(function() {
		    $('#tag_recent').click(function() {
		        $('#tag_img2').removeAttr('hidden');
		        $('#tag_img1').attr('hidden', 'hidden');
		        $('#tag_img3').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_count span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_end span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_count span').nextAll().attr('hidden', 'hidden');
		        $('#tag_end span').nextAll().attr('hidden', 'hidden');
		    });

		    $('#tag_end').click(function() {
		        $('#tag_img3').removeAttr('hidden');
		        $('#tag_img1').attr('hidden', 'hidden');
		        $('#tag_img2').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_count span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_recent span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_count span').nextAll().attr('hidden', 'hidden');
		        $('#tag_recent span').nextAll().attr('hidden', 'hidden');
		    });

		    $('#tag_count').click(function() {
		        $('#tag_img1').removeAttr('hidden');
		        $('#tag_img2').attr('hidden', 'hidden');
		        $('#tag_img3').attr('hidden', 'hidden');
		        $(this).find('span').css({'font-weight': 'bold', 'color': 'black'});
		        $('#tag_recent span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_end span').css({'font-weight': 'normal', 'color': 'rgb(72, 72, 72)'});
		        $('#tag_recent span').nextAll().attr('hidden', 'hidden');
		        $('#tag_end span').nextAll().attr('hidden', 'hidden');
		    });

		    $('.doante_all').click(function() {
		        // 클릭된 요소의 배경색과 글자색을 변경하고, 나머지 요소의 배경색과 글자색을 초기화
		        $(this).css({'background-color': '#191919', 'color': 'white'}).siblings().css({'background-color': 'white', 'color': 'black'});
		    });

		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>