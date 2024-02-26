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
                    </div>
                    

					<form id="fsearch" method="get">
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
											<select name="sfl">
												<option value="id">아이디</option>
												<option value="name">회원명</option>
												<option value="cellphone">전화번호</option>
											</select>
											<input type="text" name="stx" value class="frm_input" size="30">
										</td>
									</tr>
									<tr>
										<th>유형</th>
										<td>
											<select>
												<option value="">나눔후기</option>
												<option value="">자유</option>
												<option value="">봉사지원</option>
												<option value="">후원모집</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">기간검색</th>
										<td>
											<label for="fr_date" class="sound_only">시작일</label>
											<input type="text" name="fr_date" value id="fr_date" class="frm_input w80 hasDatepicker" maxlength="10">
											~
											<label for="to_date" class="sound_only">종료일</label>
											<input type="text" name="to_date" value id="to_date" class="frm_input w80 hasDatepicker" maxlength="10">
										</td>
									</tr>
								</tbody>
							</table>								
						</div>
						<div class="btn_confirm">
							<input type="submit" value="검색" class="btn_medium"> 
							<input type="button" value="초기화" id="frmRest" class="btn_medium grey">
						</div>
						<div class="boardList_table">
						    <table>
						        <thead>
						            <tr>
						                <th>게시글번호</th>
						                <th>제목</th>
						                <th>작성일</th>
						                <th>조회수</th>
						                <th>작성자</th>
						                <th>게시글 유형</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td>1</td>
						                <td>응어ㅓ억ㄱ</td>
						                <td>2024-02-25</td>
						                <td>50</td>
						                <td>이고래</td>
						                <td>나눔후기</td>
						            </tr>
						        </tbody>
						    </table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>									