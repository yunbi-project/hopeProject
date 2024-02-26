<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망의 조각 Admin</title>

	<!-- Custom fonts for this template-->
    <link href="${contextPath }/resources/style/css/hyun.css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${contextPath }/resources/style/css/hyun.css/admin/sb-admin-2.min.css" rel="stylesheet">

</head>
<style>
    @font-face {
        font-family: 'NanumSquareNeo-Variable';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }

    *{
        font-family: 'NanumSquareNeo-Variable';
    }

</style>

<body>
	<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${contextPath}/admin/index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img style="width:30px;" src="https://cdn-icons-png.flaticon.com/128/2556/2556855.png">
                </div>
                <div class="sidebar-brand-text mx-3">HOPE ADMIN</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${contextPath}/admin/adminIndex">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                management
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Member Pages:</h6>
                        <a class="collapse-item" href="${contextPath}/admin/memberList">회원 리스트/관리</a>
                        <a class="collapse-item" href="cards.html">신고 내역</a>
                        <a class="collapse-item" href="cards.html">블랙리스트</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>게시글 관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Board Pages:</h6>
                        <a class="collapse-item" href="${contextPath}/admin/boardManagement">게시판 관리</a>
                        <a class="collapse-item" href="404.html">댓글 관리</a>
                        <a class="collapse-item" href="blank.html">채팅방 관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>고객센터</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">CUSTOMER SERVICE:</h6>
                        <a class="collapse-item" href="utilities-color.html">공지사항</a>
                        <a class="collapse-item" href="utilities-border.html">FAQ</a>
                        <a class="collapse-item" href="utilities-border.html">회원탈퇴내역</a>
                    </div>
                </div>
            </li>




            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/admin/charts">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>통계</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/admin/tables">
                    <i class="fas fa-fw fa-table"></i>
                    <span>표</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>



        </ul>
        
        
    <!-- Bootstrap core JavaScript-->
    <script src="${contextPath }/resources/style/css/hyun.css/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${contextPath }/resources/style/css/hyun.css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${contextPath }/resources/style/css/hyun.css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${contextPath }/resources/js/hyun.js/admin/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${contextPath }/resources/style/css/hyun.css/admin/vendor/chart.js/Chart.min.js"></script>


    <!-- Page level custom scripts -->
    <script src="${contextPath }/resources/js/hyun.js/admin/demo/chart-area-demo.js"></script>
    <script src="${contextPath }/resources/js/hyun.js/admin/demo/chart-pie-demo.js"></script>
</body>
</html>