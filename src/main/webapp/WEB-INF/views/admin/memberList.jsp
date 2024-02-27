<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.hope.user.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	ArrayList<User> userList = (ArrayList<User>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망의 조각 Admin</title>
	<link href="${contextPath}/resources/style/css/hyun.css/admin/memberList.css" rel="stylesheet">
	
	<script src="${contextPath }/resources/js/hyun.js/admin/sb-admin-2.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                   		<!-- Topbar Search -->
		                <form
		                    class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		                    <div class="input-group">
		                        <input type="text" class="form-control bg-light border-0 small" placeholder="이름검색" id="formuserName"
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
									<th>핸드폰</th>
									<th>로그인타입(3-G|4-N)</th>
									<th>가입승인</th>
									<th>회원관리</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="user">
								<tr>
									<td>${user.email }</td>
									<td>${user.userName }</td>
									<td>${user.phone }</td>
									<td>${user.loginType }</td>
									<td>${user.status }</td>
									<td>
										<button onclick="showStopModal('${user.userNo}')">정지</button>
										<button onclick="showUserInfoModal('${user.userNo}')">회원정보 확인</button>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 모달 추가 -->
							<div class="modal" id="stopModal" tabindex="-1" role="dialog" aria-labelledby="stopModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="stopModalLabel">사용자 정지</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <form id="stopForm">
							          <div class="form-group">
							            <label for="stopReason">정지 사유</label>
							            <input type="text" class="form-control" id="stopReason" name="stopReason">
							          </div>
							          <input type="hidden" id="stopUserNo" name="userNo">
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary" id="stopUserBtn">확인</button>
							      </div>
							    </div>
							  </div>
							</div>
							
													<!-- 모달 추가 -->
						<div class="modal" id="userInfoModal" tabindex="-1" role="dialog" aria-labelledby="userInfoModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="userInfoModalLabel">회원정보 확인</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="userNo" name="userNo">
                <div class="form-group">
                    <label for="inputEmail">Email</label>
                    <input type="email" class="form-control" id="inputEmail" name="inputEmail" readonly>
                </div>
                <div class="form-group">
                    <label for="inputName">Name</label>
                    <input type="text" class="form-control" id="inputName" name="inputName" >
                </div>
                <div class="form-group">
                    <label for="inputPhone">Phone</label>
                    <input type="tel" class="form-control" id="inputPhone" name="inputPhone" placeholder="소셜로그인시 휴대폰번호 없습니다.">
                </div>
                <div class="form-group">
                    <label for="inputLoginType">Login Type</label>
                    <input type="text" class="form-control" id="inputLoginType" name="inputLoginType" readonly>
                </div>
                <div class="form-group">
                    <label for="inputStatus">Status</label>
                    <input type="text" class="form-control" id="inputStatus" name="inputStatus" readonly>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control" id="inputAddress" name="inputAdditionalInfo" placeholder="소셜로그인시 주소 없습니다.">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="updateUserBtn">Edit</button>
            </div>
        </div>
    </div>
</div>
						
						
			<!-- 이름 검색 -->
		<script>
		$('.input-group-append button').click(function(){
		    var userName = $('#formuserName').val();
		    console.log(userName);
		    
		    if (userName.trim() === "") { // 입력된 이름이 없을 경우 기존 리스트를 보여줍니다.
		    	window.location.reload();
		    	return;
		    }
		    
		    $.ajax({
		        url : "${contextPath}/admin/searchUserByName",
		        type : "POST",
		        data : {
		            userName : userName 
		        },
		        success : function(response) {
		            // 검색된 사용자 정보를 테이블에 추가하기 전에 tbody를 비운다.
		            $("tbody").empty();
		            
		            // 검색된 사용자 정보를 테이블에 추가
		            $.each(response, function(index, user) {
		                var tableRow = "<tr>" +
		                                "<td>" + user.email + "</td>" +
		                                "<td>" + user.userName + "</td>" +
		                                "<td>" + user.phone + "</td>" +
		                                "<td>" + user.loginType + "</td>" +
		                                "<td>" + user.status + "</td>" +
		                                "<td>" +
		                                    "<button onclick='showStopModal(" + user.userNo + ")'>정지</button>" +
		                                    "<button onclick='showUserInfoModal(" + user.userNo + ")'>회원정보 확인</button>" +
		                                "</td>" +
		                               "</tr>";
		                $("tbody").append(tableRow); // 검색된 사용자 정보를 테이블의 tbody에 추가
		            });
		        }
		    });
		});    
		</script>	
										
						
			<!-- 회원정보 확인 모달 -->		
				<script>
				    function showUserInfoModal(userNo) {
				        $('#userNo').val(userNo);
				        console.log(userNo);
				        
				        // Ajax 요청
				        $.ajax({
				        	url : "${contextPath}/admin/getUserOne",
				        	type : "GET",
				        	data : { userNo : userNo},
				        	dataType : "json",
				        	success : function(response) {
				        		$('#userNo').val(response.userNo);
				        		$('#inputEmail').val(response.email);
				        		$('#inputName').val(response.userName);
				        		$('#inputPhone').val(response.phone);
				        		$('#inputLoginType').val(response.loginType);
				        		$('#inputStatus').val(response.status); 
				        		$('#inputAddress').val(response.address); 
				        	},
				        	error: function(xhr, status, error) {
				        		console.error("error user info :" , error);
				        	}
				        });
				        
				        $('#userInfoModal').modal('show');
				    }
				</script>	
				
				
				<!-- 회원정보 확인 수정 -->
				<script>
				$('#updateUserBtn').click(function() {
				    var userNo = $('#userNo').val();
				    var userName = $('#inputName').val();
				    var phone = $('#inputPhone').val();
				    var address = $('#inputAddress').val();
				    
				    $.ajax({
				        url: "${contextPath}/admin/updateUserInfo",
				        type: "POST",
				        data: {
				            userNo: userNo,
				            userName: userName,
				            phone: phone,
				            address: address
				        },
				        success: function(response) {
				            if (response === "success") {   
				                alert("회원 정보가 업데이트되었습니다.");
				                window.location.href = "${contextPath}/admin/memberList";
				            } else {
				                alert("회원 정보가 업데이트 되지 않았습니다.");
				            }
				        },
				        error: function(xhr, status, error) {
				            alert("서버 오류가 발생했습니다." , error);
				        }   
				    });
				});
				</script>
								
				<!-- 정지 버튼 모달 및 ajax -->								
				<script>
					  // 정지 버튼 클릭시 모달 표시
					  function showStopModal(userNo) {
					    $('#stopUserNo').val(userNo); // 사용자 번호 설정
					    $('#stopModal').modal('show'); // 모달 표시
					  }
					
					  // 확인 버튼 클릭시 AJAX로 서버에 탈퇴 요청 보냄
					  $('#stopUserBtn').click(function() {
					    var userNo = $('#stopUserNo').val(); // 사용자 번호
					    var stopReason = $('#stopReason').val(); // 정지 사유
					
					    $.ajax({
					      url: "${contextPath}/admin/deleteUser",
					      type: 'POST',
					      data: {
					        userNo: userNo,
					        reason: stopReason
					      },
					      success: function(response) {
					        alert('사용자가 정지되었습니다.');
					        $('#stopModal').modal('hide'); // 모달 숨김
					        window.location.reload();
					      },
					      error: function(xhr, status, error) {
					        alert('사용자 정지 실패: ' + error);
					      }
					    });
					  });
				</script>
											
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>