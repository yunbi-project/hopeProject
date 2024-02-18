<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .outer {
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        padding: 20px;
        height: 60%;
        width: 100%;
        max-width: 500px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .page-name {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }
    .msgContainer {
        max-height: 300px;
        overflow-y: auto;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 10px;
        width: 100%;
        margin-bottom: 20px;
    }
    .msgReceive {
        margin-bottom: 10px;
    }
    .RmemberId {
        font-weight: bold;
        color: #007bff;
        margin: 0;
    }
    .Rcontent {
        margin: 0;
    }
    .inputContainer {
        display: flex;
        align-items: center;
    }
    #msg {
        flex: 1;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 8px;
        margin-right: 10px;
        width: calc(100% - 100px);
    }
    button[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 8px 16px;
        cursor: pointer;
        width: 100px;
    }
    button[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<div class="container">
    <div class="outer">
        <div class="page-name">실시간 채팅</div>
        <div class="msgContainer">
            <div class="msgReceive">
                <c:forEach var="msgList" items="${msgList}">
                    <p class="RmemberId">누구누구 님 : </p>
                    <p class="Rcontent">메시지 내용</p>
                </c:forEach>
            </div>
        </div>
        <div class="inputContainer">
            <input type='hidden' name="chatKey" id="chatKey" value='${chatKey}'>
            <input type='hidden' name="memberId" id="sender" size="10" value="${loginUser.memberId}">
            <input type="text" id="msg" placeholder="전송할 메세지">
            <button onclick="sendMsg()" type="submit">전송</button>
        </div>
    </div>
</div>


</body>
</html>