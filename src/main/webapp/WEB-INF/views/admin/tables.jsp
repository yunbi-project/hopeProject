<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1 class="h3 mb-2 text-gray-800">기부내역</h1>
                   

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 기부 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>

                                            <th>후원금액</th>
                                            <th>후원자 한마디</th>
                                            <th>회원번호</th>
                                            <th>기부날짜</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${selectDonate}" var="paymentInfo">
                                        <tr>
                                            <td>${paymentInfo.donateAmount } 원</td>
                                            <td>${paymentInfo.optionalText }</td>
                                            <td>${paymentInfo.userNo }</td>
                                            <td>${paymentInfo.createDate }</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                    
                                      <tfoot>
                                        <tr>
                                            <th>후원금액</th>
                                            <th>후원자 한마디</th>
                                            <th>회원번호</th>
                                            <th>기부날짜</th>
                                        </tr>
                                    </tfoot>
                                    
                                    
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
		</div>
	</div>
 
</body>

</html>