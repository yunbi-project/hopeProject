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
<link rel="stylesheet" href="../resources/style/css/sangjun.css/SstoryList.css">
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
    <div class="Sn-wrapper1" >
        <div class="Sn-wrapper2" >
            <div>
                <div>
                    <div>
                        <div>
                            <div class="Sn-TextLabel">이야기</div>
                        </div>
                    </div>
                </div>
              
                <div class="Sn-selection">
                    <div>
                        <div class="Sn-component-1" >                         
                            <div class="Sn-chip-1">
                                <div class="Sn-text-1">글쓰기</div>
                            </div>
                            <div class="Sn-chip-2">
                                <div class="Sn-text-2" onclick="window.location.href='${contextPath}/board/R'">나눔후기</div>
                            </div>
                        </div>
                    </div>
                </div>
              
                <div class="Ss-section">
                    <div class="Ss-container"></div>
                    <div class="Ss-list">
                      	<c:choose>
                        <c:when test="${empty list}">
                        	 <div  class="Ss-nonList">
                           	 	<span>게시글이 없습니다.</span>
                        	</div>
                        </c:when>
                        <c:otherwise>
                        <c:forEach var="b" items="${list}">                    
                        <div class="Ss-article">
                            <div class="Ss-image-container">
                                <div class="Ss-image"><img src="../resources/images/board/HOPE_logo.png"></div>
                            </div>
                            <div class="Ss-frame">
                                <div class="Ss-title">${b.boardTitle}</div>
                                <div class="Ss-subtitle">${b.boardContent}</div>                               
                            </div>
                            <div class="Ss-storydate">
                                <p class="Ss-date">${b.createDate}</p>
                                <p class="Ss-count">${b.count}</p>                                
                            </div>
                        </div> 
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>                               
                    </div>
                </div>          
                
                <div id="pagingArea">           
                    <ul class="pagination">            	
                        <li class="page-item">
                            <a class="page-link">Previous</a>
                        </li>           	
                        <li class="page-item">
                            <a class="page-link">1</a>
                            <a class="page-link">2</a>
                            <a class="page-link">3</a>
                        </li>             
                        <li class="page-item">
                            <a class="page-link">Next</a>
                        </li>           
                    </ul>
                </div>
                <div class="archive-search">
                    <form class="search-form" action="/archives/category/notice">
                                    <div class="Ss-btn">
                            <input type="text" class="archive-search-text input-md width-280px" name="search-text" placeholder="제목 또는 내용 검색을 입력하세요">
                            <input type="submit" class="green" value="검색">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>