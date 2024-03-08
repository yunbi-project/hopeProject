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
                        <h1 class="h3 mb-0 text-gray-800">참여자 명단</h1>
                    </div>
						<button type="button" class="btn_medium" onclick="window.location.href='${contextPath}/admin/P'">돌아가기</button>
						<div class="tbl_frm01">
							<div class="search_boardList">
		                    	<span class="h_titleLine"></span>
		                    	<span style="font-size:20px;">${p.programName}</span>
			                </div>
						</div>
						<div class="boardList_table" style="margin-top:20px;">
							<h4>총인원 : ${p.count }</h4>
						    <table>
						     <colgroup>
							     
							    </colgroup>
						        <thead>
						            <tr>
						                <th>이메일</th>
						                <th>이름</th>
						                <th>전화번호</th>						               
						            </tr>
						        </thead>
						        <tbody>
						         <c:forEach var="b" items="${list}">		
						            <tr>
						                <td>${b.email }</td>
						                <td>${b.userName }</td>
						                <td>${b.phone }</td>
						            </tr>
						            </c:forEach>
						        </tbody>
						    </table>
						</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function programCount(programNo) {       
        var url = '${contextPath}/admin/program/people' + programNo;
        window.location.href = url;
    }
	function deleteProduct(programNo) {
        
        var url = '${contextPath}/admin/delete/product/' + productNo;
        window.location.href = url;
    }
		
	</script>
</body>
</html>									