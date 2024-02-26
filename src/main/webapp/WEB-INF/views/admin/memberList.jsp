<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망의 조각 Admin</title>
	<link href="${contextPath}/resources/style/css/hyun.css/admin/memberList.css" rel="stylesheet">
	
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
                        <h1 class="h3 mb-0 text-gray-800">회원관리 리스트/관리</h1>
                    </div>
                    
                    <div class="secede">
                    	<input type="checkbox" class="secede_check">탈퇴한 회원포함
                   		<!-- Topbar Search -->
		                <form
		                    class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		                    <div class="input-group">
		                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
		                            aria-label="Search" aria-describedby="basic-addon2">
		                        <div class="input-group-append">
		                            <button class="btn btn-primary" type="button">
		                                <i class="fas fa-search fa-sm"></i>
		                            </button>
		                        </div>
		                    </div>
		                </form>
	                </div>

					<div class="memberList_table">
						<table>
							<thead>
								<tr>
									<th>이메일</th>
									<th>이름</th>
									<th>소셜구분</th>
									<th>소셜타입</th>
									<th>가입승인</th>
									<th>회원관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>ahemswl9806@naver.com</td>
									<td>이현영</td>
									<td>N</td>
									<td>-</td>
									<td>일반회원</td>
									<td>
										<button>정지</button>
										<button>회원정보 확인</button>
									</td>
								</tr>
								<tr>
									<td>aaa@naver.com</td>
									<td>이고래</td>
									<td>N</td>
									<td>-</td>
									<td>탈퇴회원</td>
									<td>
										-
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>