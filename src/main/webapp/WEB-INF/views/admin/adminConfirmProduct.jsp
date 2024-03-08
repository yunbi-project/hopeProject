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
                        <h1 class="h3 mb-0 text-gray-800">게시판 관리</h1>
                        	<div class="btn_confirm">
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/boardManagement'">물품기부</button>
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/P'">봉사활동</button>
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/D'">후원모집</button>
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/R'">나눔후기</button>
							<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/C'">자유게시판</button>						
						</div>
                    </div>
				
				<c:if test="${not empty param.condition}">
										<c:set var="url"
											value="&condition=${param.condition}&keyword=${param.keyword}" />
										</c:if>

				
						<div class="tbl_frm01">
						<button class="btn_medium" onclick="window.location.href='${contextPath}/admin/confirm/product'">수령확인내역</button>
							<div class="search_boardList">
		                    	<span class="h_titleLine"></span>
		                    	<span style="font-size:20px;">물품기부신청내역</span>
			                </div>
						</div>
						<div class="boardList_table">
						
						    <table>
						     <colgroup>
							        <col style="width: 5%;">
							        <col style="width: 5%;">
							        <col style="width: 10%;">
							        <col style="width: 10%;">
							        <col style="width: 10%;">
							        <col style="width: 15%;">
							        <col style="width: 5%;">
							        <col style="width: 10%;">
							        <col style="width: 5%;">						        
							    </colgroup>
						        <thead >
						            <tr>
						                <th>번호</th>
						                <th>유형</th>
						                <th>이름</th>
						                <th>기업명</th>
						                <th>전화번호</th>						          
						                <th>이메일</th>						          
						                <th>물품수량</th>						          
						                <th>신청날짜</th>							                			          
						                <th>종류</th>
						            </tr>
						        </thead>
						        <tbody >
						          <c:forEach var="b" items="${list}">
						            <tr >
						                <td rowspan="2" >${b.productNo }</td>
						                <td>${b.productType }</td>
						                <td>${b.puserName}</td>
						                <td>${b.businessName }</td>
						                <td>${b.phone}</td>
						                <td>${b.email}</td>
						                <td>${b.productAmount}</td>
						                <td>${b.productDate}</td>						                
						                <td>${b.categoryName}</td>
						            </tr>
						            <tr style="margin-bottom:10px;">
						            <td>문의사항</td>
						            <td colspan="4" >${b.inquiryContent}</td>
						            <td>비고</td>
						            <td></td>	
						            <td></td>
						            </tr>
						    </c:forEach>
						        </tbody>
						    </table>
						</div>
				
				</div>
			</div>
		</div>

	</div>
	
</body>
</html>									