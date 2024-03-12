<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>희망의 조각 Admin</title>

</head>
<style>
.list-btn{
    display: inline-block;
    padding: 10px 20px;
    background-color: #83a80ba3;
    color: #fff;
    border: none; /* 테두리 없애기 */
    border-radius: 5px; /* 테두리 모서리를 둥글게 설정 */
    transition: background-color 0.3s; /* 배경색 변경에 대한 전환 효과 설정 */
    text-decoration: none;
    border-radius: 5px;
    margin: 0 5px; /* 버튼들 사이의 간격을 조정합니다. */
    cursor: pointer;
}

.list-btn:hover{
    background-color: #6b8a0c;
    
}

.donateList-btn{
    display: inline-block;
    padding: 7px 13px;
    background-color: #f14152;
    color: #fff;
    border: none; /* 테두리 없애기 */
    border-radius: 5px; /* 테두리 모서리를 둥글게 설정 */
    transition: background-color 0.3s; /* 배경색 변경에 대한 전환 효과 설정 */
    text-decoration: none;
    border-radius: 5px;
    margin: 0 5px; /* 버튼들 사이의 간격을 조정합니다. */
    cursor: pointer;
}


.donateList-btn:hover{
    background-color: #c82333;
    
}


.flex{
	display: flex !important;
}

.flex div:nth-of-type(1){
	margin-right: 20px;
}

.proTitle{
	text-align:left;
	cursor: pointer;
}

.proTitle:hover{
	font-weight: bold;
}

.donateTitle{
	text-align:left;
	cursor: pointer;
}

.donateTitle:hover{
	font-weight: bold;
}

.activityList{
	margin: 20px 0px 20px 0px;
}
</style>

<body id="page-top">
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
                    <h1 class="h3 mb-2 text-gray-800">활동보고서 등록</h1>
                   	<button class="activityList list-btn" onclick="window.location.href='${contextPath}/activityreport/P'">활동보고서 리스트로 이동</button>

                    <!-- DataTales Example -->
                    <div class="flex">
	                    <div class="card shadow mb-4" style="width:900px;">
	                        <div class="card-header py-3" >
	                            <h6 class="m-0 font-weight-bold text-primary">봉사활동 마감</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                            	<c:choose>
	                            		<c:when test="${empty proList}">
	                            			<div style="text-align: center; font-weight: bold; font-size:20px;">
	                            				<span>봉사활동 종료 게시글이 없습니다.</span>
	                            			</div>
	                            		</c:when>
	                            		<c:otherwise>
		                            		<table class="table table-bordered program" id="dataTable" width="100%" cellspacing="0">
			                                    <thead>
			                                        <tr style="text-align:center;">
			
			                                            <th style="width:70px;">번호</th>
			                                            <th style="width:400px; ">제목</th>
			                                            <th style="width:170px;">활동종료일</th>
			                                            <th style="width:120px;">지역</th>
			                                            <th style="width:100px;"></th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
		                            			<c:forEach items="${proList}" var="p">
			                                        <tr style="text-align:center;">
			                                            <td>${p.programNo }</td>
			                                            <td class="proTitle"  onclick="window.location.href='${contextPath}/program/detail/${p.programNo}'">${p.programName }</td>
			                                            <td>${p.programActivityEndDate}</td>
			                                            <td>${p.activityLocation }</td>
			                                            <td>
										        			<button type="button" class="btn btn-primary" id="stopUserBtn" onclick="window.location.href='${contextPath}/activityreportinsert/P/${p.programNo}'">등록</button>
										        		</td>
			                                        </tr>
					                            </c:forEach>
			                                    </tbody>
			                                </table>
	                            		</c:otherwise>
	                            	</c:choose>
	                           </div>
	                       </div>
	                 	</div>
	                 	
	                 	<div class="card shadow mb-4">
	                 		<div class="card-header py-3" style="width:900px;">
	                            <h6 class="m-0 font-weight-bold text-primary">후원 마감</h6>
	                        </div>
	                 		<div class="card-body">
	                           <div class="table-responsive">
	                                <c:choose>
	                            		<c:when test="${empty donateList}">
	                            			<div style="text-align: center; font-weight: bold; font-size:20px;">
	                            				<span>후원모집 종료 게시글이 없습니다.</span>
	                            			</div>
	                            		</c:when>
	                            		<c:otherwise>
			                                <table class="table table-bordered donate" id="dataTable" width="100%" cellspacing="0" >
			                                    <thead>
			                                        <tr style="text-align:center;">
			                                            <th style="width:70px;">번호</th>
			                                            <th style="width:400px; ">제목</th>
			                                            <th style="width:170px;">후원종료일</th>
			                                            <th style="width:110px;">담당재단</th>
			                                            <th style="width:100px;"></th>
			                                        </tr>
			                                    </thead>
			
			                                    <tbody>
				                                    <c:forEach items="${donateList}" var="d">
				                                        <tr style="text-align:center;">
				                                            <td>${d.donateNo}</td>
				                                            <td class="donateTitle"  onclick="window.location.href='${contextPath}/donate/detail/${d.donateNo}'">${d.donateTitle}</td>
				                                            <td>${d.donateEndDate}</td>
				                                            <td>${d.donateFoundation}</td>
				                                            <td>
											        			<button type="button" class="btn btn-primary" id="stopUserBtn" onclick="window.location.href='${contextPath}/activityreportinsert/D/${d.donateNo}'">등록</button>
											        		</td>
				                                        </tr>
				                                    </c:forEach>
			                                    </tbody>
			                                </table>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </div>
	                        </div>
	                    </div>
					</div>
                </div>
                <!-- /.container-fluid -->
                
  
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">활동보고서 삭제</h1>

                    <!-- DataTales Example -->
                    <div class="flex">
	                    <div class="card shadow mb-4" style="width:900px; max-height: 1000px; overflow-y: auto;">
	                        <div class="card-header py-3" >
	                            <h6 class="m-0 font-weight-bold text-primary">봉사활동 보고서 리스트</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                            	<c:choose>
	                            		<c:when test="${empty reportPro}">
	                            			<div style="text-align: center; font-weight: bold; font-size:20px;">
	                            				<span>봉사활동 보고서 게시글이 없습니다.</span>
	                            			</div>
	                            		</c:when>
	                            		<c:otherwise>
		                            		<table class="table table-bordered program" id="dataTable" width="100%" cellspacing="0">
			                                    <thead>
			                                        <tr style="text-align:center;">
			
			                                            <th style="width:70px;">번호</th>
			                                            <th style="width:400px; ">제목</th>
			                                            <th style="width:170px;">작성날짜</th>
			                                            <th style="width:100px;"></th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
		                            			<c:forEach items="${reportPro}" var="p">
			                                        <tr style="text-align:center;">
			                                            <td>${p.reportNo }</td>
			                                            <td class="proTitle">${p.reportTitle }</td>
			                                            <td>${p.createDate}</td>
			                                            <td style="width:120px;">
										        			<button type="button" class="donateList-btn" id="stopUserBtn" onclick="window.location.href='${contextPath}/activityreport/delete/P/${p.reportNo}'">삭제</button>
										        		</td>
			                                        </tr>
					                            </c:forEach>
			                                    </tbody>
			                                </table>
	                            		</c:otherwise>
	                            	</c:choose>
	                           </div>
	                       </div>
	                 	</div>
	                 	
	                 	<div class="card shadow mb-4">
	                 		<div class="card-header py-3" style="width:900px; max-height: 1000px; overflow-y: auto;">
	                            <h6 class="m-0 font-weight-bold text-primary">후원모집 보고서 리스트</h6>
	                        </div>
	                 		<div class="card-body">
	                           <div class="table-responsive">
	                                <c:choose>
	                            		<c:when test="${empty reportDon}">
	                            			<div style="text-align: center; font-weight: bold; font-size:20px;">
	                            				<span>후원모집 보고서 게시글이 없습니다.</span>
	                            			</div>
	                            		</c:when>
	                            		<c:otherwise>
			                                <table class="table table-bordered donate" id="dataTable" width="100%" cellspacing="0" >
			                                    <thead>
			                                        <tr style="text-align:center;">
			                                            <th style="width:70px;">번호</th>
			                                            <th style="width:400px; ">제목</th>
			                                            <th style="width:170px;">작성날짜</th>
			                                            <th style="width:100px;"></th>
			                                        </tr>
			                                    </thead>
			
			                                    <tbody>
				                                    <c:forEach items="${reportDon}" var="d">
				                                        <tr style="text-align:center;">
				                                            <td>${d.reportNo}</td>
				                                            <td class="donateTitle">${d.reportTitle}</td>
				                                            <td>${d.createDate}</td>
				                                            <td style="width:120px;">
											        			<button type="button" class="donateList-btn" id="stopUserBtn" onclick="window.location.href='${contextPath}/activityreport/delete/D/${d.reportNo}'">삭제</button>
											        		</td>
				                                        </tr>
				                                    </c:forEach>
			                                    </tbody>
			                                </table>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </div>
	                        </div>
	                    </div>
					</div>
                </div>
                <!-- /.container-fluid -->
		</div>
	</div>
</div>

 
</body>

</html>