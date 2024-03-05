<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
                <h1 class="logo">
                    <a href="${contextPath}"><img class="h_logo_img" src='${contextPath}/resources/style/img/mainPage/HOPE_logo.png' ></a>
                </h1>

                <nav class="flex">
                    <ul class="flex gnb__depth1" style="height: 100px;">
                        <li>
                            <a href="${contextPath}">홈</a>
                        </li>
                        <li>
                            <a href="${contextPath}/donate/list">후원모집</a>
                        </li>
                        <li>
                            <a href="${contextPath}/product">물품기부</a>
                        </li>
                        <li>
                            <a>활동</a>
                            <div class="gnb__area" style="overflow: hidden;
                            display: none;
                            height: 240px;
                            padding-top: 0px;
                            margin-top: 0px;
                            padding-bottom: 0px;
                            margin-bottom: 0px;">
                                <div class="inner">
                                    <div class="w1200 clearfix">
                                        <div class="gnb__intro">
                                            <h2 style="font-family: 'NanumSquareNeo-Variable'; margin-top: 20px; color:black;">희망의 조각은</h2>
                                            <p>행복한 변화와<br>
                                            이야기를 전해드립니다.</p>
                                        </div>
                                    </div>
                                    <div class="gnb__menu">
                                        <ul class="gnb__depth2" style="margin-top: 40px;">
                                            <li class="gnb__menu__others">
                                                <a href="${contextPath}/program/list">봉사활동 지원하기</a>
                                            </li>
                                            <li class="gnb__menu__others">
                                                <a href="${contextPath}/activityreport">활동보고서</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="gnb__banner">
                                        <a style="cursor:pointer;">
                                            <img src="${contextPath}/resources/style/img/물품기부.jpg">
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </li>
                        <li>
                            <a>소식</a>
                            <div class="gnb__area" style="overflow: hidden;
                            display: none;
                            height: 250px;
                            padding-top: 0px;
                            margin-top: 0px;
                            padding-bottom: 0px;
                            margin-bottom: 0px;">

                                <div class="inner">
                                    <div class="w1200 clearfix">
                                        <div class="gnb__intro">
                                            <h2  style="font-family: 'NanumSquareNeo-Variable'; margin-top: 20px; color:black;">희망의 조각은</h2>
                                            <p>도움이 가장 필요한 곳에<br>
                                            후원자님의 사랑을 전달합니다.</p>
                                        </div>
                                    </div>
                                    <div class="gnb__menu">
                                        <ul class="gnb__depth2">
                                            <li class="gnb__menu__others" style="margin-top:10px;">
                                                <a href="${contextPath}/board/R">나눔후기 게시판</a>
                                            </li>
                                            <li class="gnb__menu__others">
                                                <a href="${contextPath}/board/C">자유 게시판</a>
                                            </li>
                                            <li class="gnb__menu__others">
                                                <a href="${contextPath}/board/N">공지사항</a>
                                            </li>
                                            <li class="gnb__menu__others">
                                                <a href="${contextPath}/board/Q">자주 묻는 질문 FAQ</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="gnb__banner">
                                        <a style="cursor:pointer;">
                                            <img src="${contextPath}/resources/style/img/물품기부.jpg">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>

                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <li class="h_login flex">
                                <a style="margin-left: 100px;" href="${contextPath}/login">회원가입</a>
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
                                        <li><a href="${contextPath}/admin/adminIndex">ADMIN</a></li>
                                        <li><a href="${contextPath}/mypage">마이페이지</li>
                                        <li><a href="http://localhost:8005/hope/chat/chatList">채팅방</a></li>
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
                                        <li><a href="${contextPath}/mypage">마이페이지</li>
                                        <li><a href="http://localhost:8005/hope/chat/chatList">채팅방</a></li>
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
    </script>

</body>
</html>