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
                        <h1 class="h3 mb-0 text-gray-800">FAQ 관리</h1>
                    </div>
                    

						<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/Q'">전체</button>
						<div class="btn_confirm">
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/faqList1'">물품기부</button>
							<button class="btn_medium grey" onclick="window.location.href='${contextPath}/admin/faqList2'">후원하기</button>
							<button class="btn_medium grey" onclick="window.location.href='${contextPath}/admin/faqList3'">봉사활동</button>
						</div>
						<div class="boardList_table">
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/insert/Q'">등록</button>
						    <table>
								    <thead>
								        <tr>
								            <th>번호</th>
								            <th>질문</th>
								            <th>구분</th>
								            <th>삭제</th>
								        </tr>
								    </thead>
								    <tbody id="faqTableBody">
								        <c:forEach var="b" items="${list}">
								            <!-- 질문 -->
								            <tr>
								                <td rowspan="2">${b.boardNo}</td>
								                <td>${b.boardTitle}</td>
								                <td rowspan="2">${b.faqTypeName }</td>
								                <td rowspan="2"><button onclick="deleteBoard(${b.boardNo})">삭제</button></td>
								            </tr>
								            <!-- 답변 -->
								            <tr>
								                <td>${b.boardContent}</td>
								            </tr>
								        </c:forEach>
								    </tbody>
								</table>

						</div>
						
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script>
	function deleteBoard(boardNo) {
        var boardTypeNo = 'Q'; // boardTypeNo 값을 설정하거나 동적으로 가져옵니다.
        var url = '${contextPath}/admin/delete/' + boardNo + '?boardTypeNo=' + boardTypeNo;
        window.location.href = url;
    }
		
	</script>
</body>
</html>									