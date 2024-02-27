<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/style/css/sangjun.css/SFAQList1.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
  <section>
        <article class="h_boardTitle">
            <h1>자원봉사</h1>
            <p>자원봉사 함께 나아가는 더 나은 세상.</p>
        </article>
    </section>
    <div class="Sn-wrapper1">
        <div class="Sn-wrapper2" >
            <div>
                <div>
                    <div>
                        <div>
                            <div style="cursor:pointer;" class="Sn-TextLabel" onclick="window.location.href='${contextPath}/board/Q'">자주묻는질문</div>
                        </div>
                    </div>
                </div>
              
                <div class="Sn-selection">
                    <div>
                        <div class="Sn-component-1" >                         
                            <div class="Sn-chip-1">
                                <div class="Sn-text-1" onclick="window.location.href='${contextPath}/board/insert/Q'">등록</div>
                            </div>
                            <div class="Sn-chip-2" >
                                <div class="Sn-text-2" onclick="window.location.href='${contextPath}/board/N'">공지사항</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Sn-selection-2">
                    <div>
                        <div class="Sn-component-2" >                         
                            <div class="Sn-chip-3">
                                <div class="Sn-text-3" onclick="window.location.href='${contextPath}/board/Q/1'">물품기부</div>
                            </div>
                            <div class="Sn-chip-4" >
                                <div class="Sn-text-4" onclick="window.location.href='${contextPath}/board/Q/2'">
                                    후원하기</div>
                            </div>
                            <div class="Sn-chip-5" >
                                <div class="Sn-text-5" onclick="window.location.href='${contextPath}/board/Q/3'">
                                    자원활동</div>
                            </div>
                          
                        </div>
                    </div>
                </div>
                <div class="Sn-section">
                    <div id="Accordion_wrap">
                        <c:choose>
                        <c:when test="${empty list}">
                        	 <div class="Ss-nonList">
                            <span>게시글이 없습니다.</span>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <c:forEach var="b" items="${list}">
                         <div class="que">
                            <span>${b.boardTitle}</span>
                            <div class="arrow-wrap">
                            	<button class="delete-btn" onclick="deleteBoard(${b.boardNo})">삭제</button>
                                <span class="arrow-top">↑</span>
                                <span class="arrow-bottom">↓</span>
                            </div>
                        </div>
                        <div class="anw">
                            <span>${b.boardContent }</span>
                        </div>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                        
                    </div>
                </div>               
            </div>
        </div>
    </div>
    <script>
    function deleteBoard(boardNo) {
        var boardTypeNo = 'Q'; // boardTypeNo 값을 설정하거나 동적으로 가져옵니다.
        var url = '${contextPath}/board/delete/' + boardNo + '?boardTypeNo=' + boardTypeNo;
        window.location.href = url;
    }
        $(".que").click(function() {
        	event.preventDefault(); 
        $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300);
        });
       
    </script>
    </main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>