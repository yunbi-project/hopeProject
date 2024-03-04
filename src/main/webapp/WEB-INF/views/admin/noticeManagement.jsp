<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망의 조각 Admin</title>
	
	<link href="${contextPath}/resources/style/css/hyun.css/admin/boardManagement.css" rel="stylesheet">
	<script src="${contextPath }/resources/js/hyun.js/admin/sb-admin-2.min.js"></script>
</head>
	
<body>
	
	   <!-- Page Wrapper -->
    <div id="wrapper">
    
    	<jsp:include page="/WEB-INF/views/admin/common/navBar.jsp"/>

        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
            	<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">공지사항 관리</h1>
                    </div>
                    
					<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/insert/N'">등록</button>
					<form id="search-form" method="get" action="N">
						<div class="tbl_frm01">
							<div class="search_boardList">
		                    	<span class="h_titleLine"></span>
		                    	<span style="font-size:20px;">구분 검색</span>
			                </div>
							<table>
								<colgroup>
									<col class="w100">
									</col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">검색어</th>
										<td>
											<select name="condition">
												<option value="title">제목</option>
											</select>
											<input type="text" name="keyword" value class="frm_input" size="30">
										</td>
									</tr>									
								</tbody>
							</table>								
						</div>
						<div class="btn_confirm">
							<input type="submit" value="검색" class="btn_medium"> 
							<input type="reset" value="초기화" id="frmRest" class="btn_medium grey">
						</div>
						<div class="boardList_table">
						
						    <table>
						    <colgroup>
							        <col style="width: 5%;">
							        <col style="width: 70%;">
							        <col style="width: 15%;">
							        
							       
							    </colgroup>
						        <thead>
						            <tr>
						                <th class="adminNoticeNo">공지번호</th>
						                <th class="adminNoticetitle">제목</th>
						                <th>작성일</th>
						             
						            </tr>
						        </thead>
						        <tbody>
						        <c:forEach var="b" items="${list}">						        
						            <tr onclick="movePage(${b.boardNo})">
						                <td>${b.boardNo}</td>
						                <td class="adminNoticetitle" style="text-align: left;">${b.boardTitle}</td>
						                <td>${b.createDate }</td>						                						               
						            </tr>
						         </c:forEach>
						         
						        </tbody>
						    </table>
						</div>
						<c:if test="${not empty param.condition}">
						<c:set var="url"
							value="&condition=${param.condition}&keyword=${param.keyword}" />
						</c:if>
						<div id="pagingArea">
						<ul class="pagination">
							<c:if test="${pi.currentPage ne 1}">
								<li class="page-item"><a class="page-link"
									href="?currentPage=${pi.currentPage-1}${url}">Previous</a></li>
							</c:if>
							<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
								<li class="page-item"><a class="page-link"
									href="?currentPage=${p}${url}">${p}</a></li>
							</c:forEach>
							<c:if test="${pi.currentPage ne pi.maxPage}">
								<li class="page-item"><a class="page-link"
									href="?currentPage=${pi.currentPage+1}${url}">Next</a></li>
							</c:if>
						</ul>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function movePage(bno){
			location.href="${contextPath}/admin/detail/N/"+bno
		}
	</script>
</body>
</html>									