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
        padding: 5% 10%;
        width: 100%;
    }
    h2 {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background-color: #fff;
    }
    th, td {
        padding: 12px 15px;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .btn-primary {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        cursor: pointer;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .btn-danger {
        background-color: #dc3545;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        cursor: pointer;
    }
    .btn-danger:hover {
        background-color: #c82333;
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
    }
    .modal-header, .modal-footer {
        border-bottom: 1px solid #ccc;
        padding: 10px 0;
    }
    .modal-title {
        margin: 0;
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
</style>
</head>
<body>
	
<div class="content">
    <h2>채팅방목록</h2>
    <table>
    <thead>
        <tr>
            <th>방번호</th>
            <th>채팅방 제목(주제)</th>
            <th>개설자</th>
            <th>참여인수</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty list}">
                <tr>
                    <td colspan="4">존재하는 채팅방이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list}" var="chat">
                    <tr>
                        <td>${chat.chatNo}</td>
                        <td>
                            ${chat.chatTitle}
                            <c:if test='${!empty loginUser }'>
                                <button onclick="location.href = '<%=request.getContextPath() %>/chat/room/${chat.chatNo}'">참여</button>
                            </c:if>
                        </td>
                        <td>${chat.userName}</td>
                        <td>${chat.cnt}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

    <div class="btn-area">
        <button onclick="toggleModal()" class="btn btn-danger">채팅방 만들기</button>
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