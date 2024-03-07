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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<style>
    /* 그래프 크기 조절 */
    #myAreaChart {
        max-width: 100%;
        max-height: 100%;
    }
</style>
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- 회원가입 수 -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                회원 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalUsers[0].totalUsers}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 기부금액 통계 -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                기부금액 합계</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalAmount} 원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 게시글 합계 -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1"> 게시글 수
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${totalBoard} 게시글</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 채팅방 합계 -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"> 채팅방 합계 
                                                </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> ${totalChat}개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

			
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // JSON 데이터 파싱
        const jsonData = ${json};
        console.log(jsonData);
        
        // 중복된 날짜를 제거하고 월별 기부금액을 저장할 맵
        const saleMap = new Map();
        
        // 데이터 처리 - 역순으로 처리
        for (let i = 0; i < jsonData.length; i++) {
            const dateParts = jsonData[i].date.split('-');
            const year = parseInt(dateParts[0]); // 연도
            const month = parseInt(dateParts[1]); // 월
            
            // 연도와 월을 결합하여 날짜 키 생성
            const formattedDate = year + '-' + month;
            
            if (!saleMap.has(formattedDate)) {
                saleMap.set(formattedDate, 0);
            }
            
            // 기부금액 합산
            const currentAmount = saleMap.get(formattedDate);
            const newAmount = currentAmount + jsonData[i].sale;
            saleMap.set(formattedDate, newAmount);
        }
        
        // 중복 제거된 월별 기부금액 데이터 추출
        const monthList = Array.from(saleMap.keys());
        const saleList = Array.from(saleMap.values());
        
        // Chart.js를 사용하여 차트 그리기
        const ctx = document.getElementById('myAreaChart');
        if(ctx) {
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: monthList,
                    datasets: [{
                        label: '월별 기부금액',
                        data: saleList,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        } else {
            console.error('Canvas element with ID "myAreaChart" not found.');
        }
    });
</script>
<br>
                        <!-- 기부금액 통계 -->
                        <div class="d-flex flex-row justify-content-between">
    <!-- 기부금액 통계 -->
    <div class="col-xl-8 col-lg-7">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">기부금액</h6>
                <div class="dropdown no-arrow">
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                        aria-labelledby="dropdownMenuLink">
                    </div>
                </div>
            </div>
            <!-- Card Body -->
            <div class="card-body" id="chartgrahpe">
                <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- 회원 리스트 -->
    <div class="col-xl-4 col-lg-5">
        <div style="width: 500px; height: 410px; overflow-y: auto; border: 1px solid #ccc; border-radius: 5px; padding: 10px;">
            <table style="width: 100%;">
                <thead>
                    <tr style="background-color: #f2f2f2;">
                        <th style="padding: 8px; text-align: left;">회원이름</th>
                        <th style="padding: 8px; text-align: left;">가입일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <td style="padding: 8px;">${user.userName}님이</td>
                            <td style="padding: 8px;">${user.createDate}에 가입했습니다.</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>

</html>