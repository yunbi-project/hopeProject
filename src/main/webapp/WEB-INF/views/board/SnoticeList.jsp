<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/style/css/sangjun.css/SnoticeList.css">
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
                            <div class="Sn-TextLabel" >공지사항</div>
                        </div>
                    </div>
                </div>
              
                <div class="Sn-selection">
                    <div>
                        <div class="Sn-component-1" >                         
                            <div class="Sn-chip-1">
                                <div class="Sn-text-1">글쓰기</div>
                            </div>
                            <div class="Sn-chip-2" >
                                <div class="Sn-text-2"  onclick="window.location.href='${contextPath}/board/Q">
                                    자주묻는질문</div>
                            </div>
                        </div>
                    </div>
                </div>
              
                <div class="Sn-section">
                    <table class="Sn-table">
                        <thead>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성날짜</th>
                            <th>조회수</th>
                          
                        </thead>
                        <tbody>   
                        <c:choose>
                        <c:when test="${empty list}">
                        	<tr>
                        		<td colspan="5">게시글이 없습니다.</td>
                        	</tr>
                        </c:when>
                        <c:otherwise>
                        <c:forEach var="b" items="${list}">
                            <tr>
                                <td>${b.boardNo}</td>
                                <td>${b.boardTitle}</td>
                                <td>${b.userNo}</td>
                                <td>${b.createDate}</td>
                                <td>${b.count}</td>                               
                            </tr>                    
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>                         
                            
                          
                        </tbody>
                        <!-- 리스트의 각 항목에 대해 이 구조를 반복합니다 -->
                    </table>
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
                                    <div class="Sn-btn">
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