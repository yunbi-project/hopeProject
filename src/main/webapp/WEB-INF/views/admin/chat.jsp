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


<style>

    .close {
        background-color: #f44336; 
		  border: none;
		  color: white;
		  padding: 15px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 4px 2px;
		  transition-duration: 0.4s;
		  cursor: pointer;
		  border-radius: 12px;
		  outline: none;
    }
    .buttonagress {
    
    	  background-color: #4CAF50; /* Green */
		  border: none;
		  color: white;
		  padding: 15px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 4px 2px;
		  transition-duration: 0.4s;
		  cursor: pointer;
		  border-radius: 12px;
		  outline: none;"
    }
    

    .close:hover,
    .close:focus {
        color: black; /* 마우스 오버 또는 포커스 시 색상 변경 */
        text-decoration: none; /* 밑줄 제거 */
        cursor: pointer; /* 커서 모양 변경 */
    }
</style>
</head>
<body>

<div id="wrapper">
    
    <jsp:include page="/WEB-INF/views/admin/common/navBar.jsp"/>

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">

            <jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>

            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">채팅방 조회</h1>
                   <!--  <button id="createChatRoomBtn">채팅방 생성</button> -->
                </div>

                <div class="secede">
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="채팅방 검색"
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
                                <th>채팅방 번호</th>
                                <th>채팅방 제목</th>
                                <th>채팅방 생성 유저번호</th>
                                <th>채팅방 인원수</th>
                                <th>버튼</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach items="${list}" var="chat"> 
                                <tr>
                                    <td>${chat.chatNo}</td>
                                    <td>${chat.chatTitle}</td>
                                    <td>${chat.userNo}</td>
                                    <td>${chat.cnt} / 50</td>
                                    <td>
                                        <button onclick="deleteChatRoom('${chat.chatNo}')">채팅방 삭제</button>
                                        <button class="btn btn-primary btn-join" style ="background-color: blue;" id="btn-join" 
                                        onclick="location.href = '<%=request.getContextPath() %>/chat/${chat.chatNo}'" >채팅방 입장</button>
                                    </td>
                                </tr>
                             </c:forEach> 
                        </tbody>
                    </table>
                    
                    <!-- 채팅방 생성 모달 -->
					<div class="modal" id="stopModal" tabindex="-1" role="dialog" aria-labelledby="stopModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="stopModalLabel">채팅방 생성</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <form id="stopForm">
							          <div class="form-group">
							            <label for="stopReason" id="">채팅방 제목</label>
							            <input type="text" class="form-control" id="chatTitle" name="chatTitle" >
							          </div>
							          <input type="hidden" id="stopUserNo" name="userNo">
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary" id="confirmChatRoomCreation">확인</button>
							      </div>
							    </div>
							  </div>
							</div>

					
				<!-- 	<script>
					// 채팅방 생성
					    // 모달 표시를 위한 함수
					    function showModal() {
					        $('#stopModal').modal('show');
					    }
					
					    // 모달 닫기를 위한 함수
					    function closeModal() {
					        $('#stopModal').modal('hide');
					    }
					
					 // 채팅방 생성 버튼 클릭 시 모달 표시
					    $('#createChatRoomBtn').click(function(){
					        showModal();
					    });

					    // 모달 안의 확인 버튼 클릭 시
					    $('#confirmChatRoomCreation').click(function(){
					        var chatTitle = $('#chatTitle').val();
					        $.ajax({
					            url: "${contextPath}/admin/createChatRoom",
					            type: "POST",
					            data: {
					                chatTitle: chatTitle
					            },
					            success: function(response) {
					                if(response === "success") {
					                    alert('채팅방 생성되었습니다.');
					                    $('#stopModal').modal('hide'); // 모달 숨김
					                    window.location.reload(); // 새로고침
					                } else {
					                    alert('채팅방 생성 실패');
					                }
					            },
					            error: function(xhr, status, error) {
					                alert('채팅방 생성 실패: ' + error);
					            }
					        });
					    });
					
					    // 모달 닫기 버튼 클릭 시
					    $('.close').click(function(){
					        closeModal();
					    });
					
					    // 모달 영역 외를 클릭하면 모달 닫기
					    $(document).on('click', function(event) {
					        if ($(event.target).hasClass('modal')) {
					            closeModal();
					        }
					    });
					</script> -->
					
					
					<script>
						// 채팅방 삭제
						 function deleteChatRoom(chatNo) {
					        if (confirm("정말로 이 채팅방을 삭제하시겠습니까?")) {
					            $.ajax({
					                url: "${contextPath}/admin/chat/"+ chatNo + "/deleteChatRoom",
					                type: "GET",
					                success: function (response) {
					                    alert("채팅방이 성공적으로 삭제되었습니다.");
					                    window.location.reload(); // 새로고침
					                },
					                error: function (xhr, status, error) {
					                    alert("채팅방 삭제 중 오류가 발생했습니다.");
					                }
					            });
     						   }}
					</script>
					
					<script>
					    // 채팅방 검색 버튼 클릭 시
					    $('.input-group-append button').click(function(){
					        var chatRoomName = $('#userNoInput').val();
					        searchChatRoom(chatRoomName); // 검색 함수 호출
					    });
					
					    // 채팅방 검색을 위한 AJAX 함수
					    function searchChatRoom(chatRoomName) {
					        $.ajax({
					            url: "${contextPath}/admin/chat/searchChatRoomByName", // 검색을 처리할 컨트롤러 URL
					            type: "POST", // POST 방식으로 요청
					            data: {
					                chatTitle : chatRoomName // 검색할 채팅방 이름 전달
					            },
					            success: function (response) {
					                // 검색 결과를 표시하기 전에 tbody를 비웁니다.
					                $("tbody").empty(); 
					                // 검색된 채팅방 정보를 테이블에 추가합니다.
					                $.each(response, function(index, chatRoom) {
					                    var tableRow = "<tr>" +
					                                        "<td>" + chatRoom.chatNo + "</td>" +
					                                        "<td>" + chatRoom.chatTitle + "</td>" +
					                                        "<td>" + chatRoom.userNo + "</td>" +
					                                        "<td>" + chatRoom.cnt + " / 50</td>" +
					                                        "<td>" +
					                                            " <button onclick=\"deleteChatRoom('" + chatRoom.chatNo + "')\">채팅방 삭제</button>" +
					                                            " <button class=\"btn btn-primary btn-join\" style=\"background-color: blue;\" id=\"btn-join\" " +
					                                            "onclick=\"location.href = '<%=request.getContextPath() %>/chat/" + chatRoom.chatNo + "'\" >채팅방 입장</button>" +
					                                        "</td>" +
					                                    "</tr>";
					                    $("tbody").append(tableRow); 
					                });
					            },
					            error: function (xhr, status, error) {
					                alert("서버 오류가 발생했습니다.");
					            }
					        });
					    }
					</script>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
