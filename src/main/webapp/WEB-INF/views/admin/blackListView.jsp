<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.hope.user.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
    ArrayList<User> userList = (ArrayList<User>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망의 조각 신고내역</title>
<link href="${contextPath}/resources/style/css/hyun.css/admin/memberList.css" rel="stylesheet">
<script src="${contextPath }/resources/js/hyun.js/admin/sb-admin-2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div id="wrapper">
    
    <jsp:include page="/WEB-INF/views/admin/common/navBar.jsp"/>

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">

            <jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>

            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">신고내역 리스트/관리</h1>
                </div>

                <div class="secede">
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="사용자번호 검색"
                                id="userNoInput" aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" onclick="searchByUserNo()">
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
                                <th>블랙리스트 번호</th>
                                <th>정지사유</th>
                                <th>정지날짜</th>
                                <th>사용자 번호</th>
                                <th>상태</th>
                                <th>가입승인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="user">
                                <tr>
                                    <td>${user.blackListNo}</td>
                                    <td>${user.reason}</td>
                                    <td>${user.updateDate}</td>
                                    <td>${user.userNo}</td>
                                    <td>${user.status}</td>
                                    <td>
                                        <button onclick="showStopModal('${user.userNo}')">정지풀기</button>
                                        <button onclick="showUserInfoModal('${user.userNo}')">회원정보 확인</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">정지풀기</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    정말 회원의 정지를 푸시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="button" class="btn btn-primary" id="confirmButton">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function showStopModal(userNo) {
        $('#myModal').modal('show'); 

        $('#confirmButton').click(function () {
            releaseStop(userNo); 
            $('#myModal').modal('hide'); 
        });
    }

    function releaseStop(userNo) {
        $.ajax({
            url: "${contextPath}/admin/releseStop",
            type: "POST",
            data: {
                userNo: userNo
            },
            success: function (response) {
                alert("정지가 해제되었습니다.");
                location.reload();
            },
            error: function (xhr, status, error) {
                alert("서버 오류가 발생했습니다.")
            }
        })
    }
    
    // 검색 버튼 클릭 시
    $('.input-group-append button').click(function(){
        var userNo = $('#userNoInput').val();
        searchByUserNo(userNo);
    });

    // 사용자 번호를 통한 검색
    function searchByUserNo(userNo) {
        $.ajax({
            url: "${contextPath}/admin/searchByUserNo",
            type: "POST",
            data: {
                userNo: userNo
            },
            success: function (response) {
                // 여기서 회원 리스트를 업데이트하는 로직을 추가하세요
            },
            error: function (xhr, status, error) {
                alert("서버 오류가 발생했습니다.");
            }
        })
    }
</script>

</body>
</html>
