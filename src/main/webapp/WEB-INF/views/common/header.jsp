<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>희망의 조각</title>
    <!-- css -->
    <link rel="stylesheet" href="/hope/resources/style/css/common.css">
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${contextPath }/resources/js/common/header.js"></script>
</head>
<body>
	<c:if test="${not empty alertMsg}">
	    <script>
	        alert("${alertMsg}");
	    </script>
	    <c:remove var="alertMsg" />
	</c:if>
    <header id="header_new">
        <div class="header__inner w1200">
            <div class="header__btm flex">
                <div class="logo">
                    <a href="${contextPath}"><img class="h_logo_img" src='${contextPath}/resources/style/img/mainPage/HOPE_logo.png' ></a>
                </div>

                <nav class="flex" style="width:1200px;">
                    <ul class="flex gnb__depth1" style="    margin-left: 0px; padding-left: 0px;">
                        <li>
                            <a href="${contextPath}">홈</a>
                        </li>
                        <li>
                            <a href="${contextPath}/donate/list">후원모집</a>
                        </li>
                        <li>
                            <a href="${contextPath}/product">물품기부</a>
                        </li>
                        <li class="activity_li">
                        	<a>활동</a>
                            <div id="activity_menu">
                                <ul id="activity">
                                    <a href="${contextPath}/program/list"><li>봉사활동</li></a>
                                    <a href="${contextPath}/activityreport/P"><li>활동보고서</li></a>
                                </ul>
                            </div>
                        </li>
                        <li class="h_new_li">
                            <a>소식</a>
                            <div id="h_new_menu">
                                <ul id="h_new">
                                    <a href="${contextPath}/board/R"><li>나눔후기</li></a>
                                    <a href="${contextPath}/board/C"><li>자유게시판</li></a>
                                    <a href="${contextPath}/board/N"><li>공지사항</li></a>
                                    <a href="${contextPath}/board/Q"><li>FAQ</li></a>
                                </ul>
                            </div>
                        </li>
                    </ul>

                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <li class="h_login flex">
                                <a href="${contextPath}/singup.me">회원가입</a>
                                <a style="color:black;" href="${contextPath}/login"><div class="nexon_login">로그인</div></a>
                            </li>
                        </c:when>
                        <c:when test="${loginUser.userNo eq 1}">
                            <li class="h_logout flex">
                                <a href="${contextPath}/logout.me">로그아웃</a>
                                <div class="flex logoutSub" onclick="toggleSubMenu()">
                                    <span class="nexon_logout">${loginUser.userName}님</span>
                                    <img class="logoutImg" src="https://cdn-icons-png.flaticon.com/128/748/748063.png">
                                    <ul class="sub_menu">
                                        <a href="${contextPath}/admin/adminIndex"><li>ADMIN</li></a>
                                        <a href="${contextPath}/mypage"><li>마이페이지</li></a>
                                        <a href="http://localhost:8005/hope/chat/chatList"><li>채팅방</li></a>
                                    </ul>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="h_logout flex">
                                <a href="${contextPath}/logout.me">로그아웃</a>
                                <div class="flex logoutSub" onclick="toggleSubMenu()">
                                    <span class="nexon_logout">${loginUser.userName}님</span>
                                    <img class="logoutImg" src="https://cdn-icons-png.flaticon.com/128/748/748063.png">
                                    <ul class="sub_menu">
                                        <a href="${contextPath}/mypage"><li>마이페이지</li></a>
                                        <a href="http://localhost:8005/hope/chat/chatList"><li>채팅방</li></a>
                                    </ul>
                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    
                </nav>
            </div>
        </div>
    </header>

    <script>
	    function toggleSubMenu() {
	        var subMenu = document.querySelector('.sub_menu');
	        if (subMenu.style.display === 'none') {
	            subMenu.style.display = 'block';
	        } else {
	            subMenu.style.display = 'none';
	        }
	    }
	
	    $('.activity_li').hover(function() {
	        // 마우스를 hover할 때
	        $('#activity').stop(true, true).slideDown('slow');
	    }, function() {
	        // 마우스를 hover에서 떼었을 때
	        $('#activity').stop(true, true).slideUp('slow');
	    });
	    
	    $('.h_new_li').hover(function() {
	        // 마우스를 hover할 때
	        $('#h_new').stop(true, true).slideDown('slow');
	    }, function() {
	        // 마우스를 hover에서 떼었을 때
	        $('#h_new').stop(true, true).slideUp('slow');
	    });
    </script>

</body>
</html>