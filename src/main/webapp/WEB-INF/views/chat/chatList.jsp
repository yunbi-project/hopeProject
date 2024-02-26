<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅방목록</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }
    .content {
        position: relative; 
        padding: 30px;
        margin: 50px auto; 
        background-color: #f0fff0;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        margin-bottom: 20px;
        color: #333;
        text-align: center;
        font-size: 24px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: #f5fffa;
    }
    th, td {
        padding: 12px 18px;
        text-align: center;
        border: 1px solid #bc8f8f;
    }
    th {
        background-color: #f5fffa;
        color: black;
        font-size: 24px; 
    }
    td {
        font-size: 20px;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .btn-area {
        text-align: center;
        margin-top: 20px;
    }
    .btn-area button {
        margin-right: 10px;
        background-color: #d2b48c;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .btn-area button:hover {
        background-color: #9acd32;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }
    .modal-dialog {
        background-color: #fff;
        width: 300px;
        height: 300px; 
        margin: auto;
        padding: 20px;
        border-radius: 8px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    .modal-header, .modal-footer {
        border-bottom: 1px solid #ccc;
        padding: 15px 0;
        text-align: center;
    }
    .modal-title {
         margin: 0;
            font-size: 20px;
            color: #333;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .form-control {
        width: calc(100% - 40px);
        padding: 10px;
        border-radius: 4px;
        border: 1px solid #ccc;
        margin-bottom: 20px;
    }

    /* 참여와 삭제 버튼 */
    td:nth-child(5){
        display:flex;
        flex-direction: row;
        justify-content: space-around;
    }
    .btn-join, .btn-delete {
        background-color: #9acd32;
        color: #fff;
        border: none;
        border-radius: 7px;
        padding: 10px 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin: 0 5px;
    }

    .btn-join:hover, .btn-delete:hover {
        background-color: #00ff7f;
    }

    /* 뒤로가기 버튼 */
    .btn-back {
        background-color: #d2b48c;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-back:hover {
        background-color: #c82333;
    }
   
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="content">
    <h2>채팅방목록</h2>
    <table>
    <thead>
        <tr>
            <th style="display:none;">방번호</th>
            <th>개설자</th>
            <th style="min-width: 200px;">채팅방 제목(주제)</th> <!-- 길게 만들어줌 -->
            <th style="width:100px;">참여인수</th>
            <th style="width:180px;">삭제</th> <!-- 작게 만듦 -->
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty list}">
                <tr>
                    <td colspan="5">존재하는 채팅방이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list}" var="chat">
                    <c:forEach items="${join}" var="joinItem">
                        <c:if test="${chat.chatNo eq joinItem.chatNo && loginUser.userNo eq joinItem.userNo && joinItem.status eq 'Y'}">
                            <tr>
                                <td style="display:none;">${chat.chatNo}</td>
                                <td>${chat.userName}</td>
                                <td>${chat.chatTitle}</td>
                                <td>${chat.cnt}  /  100</td>
                                <td>
                                    <c:if test='${!empty loginUser }'>
                                        <button class="btn btn-primary btn-join" id="btn-join" onclick="location.href = '<%=request.getContextPath() %>/chat/room/${chat.chatNo}'" >입장</button>
                                    </c:if> 
                                    <form action="<%=request.getContextPath() %>/chat/${chat.chatNo}/exit" method="get">
                                        <button class="btn-delete" type="submit" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

        <div class="btn-area">
        <button onclick="toggleModal()" class="btn btn-danger">채팅방 만들기</button>
        <button onclick="history.back()" class="btn btn-back">뒤로가기</button>
    </div>
</div>

<div id="chatModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">채팅방 만들기</h4>
                <span class="close" onclick="toggleModal()">&times;</span>
            </div>
            
            <form action=<%=request.getContextPath() %>/chat/openChatRoom method="post">
                <div class="modal-body">
                    <label  for="title" class="mr-sm-2" >제목</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="채팅방 제목" id="chatRoomTitle" name="chatTitle">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">만들기</button>
                    <button type="button" class="btn btn-danger" onclick="toggleModal()">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function toggleModal() {
        var modal = document.getElementById("chatModal");
        modal.style.display = modal.style.display === "block" ? "none" : "block";
    }
</script>

</body>
</html>