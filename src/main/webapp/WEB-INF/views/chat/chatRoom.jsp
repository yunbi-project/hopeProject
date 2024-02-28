<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">


  
<style>
    .chatting-area{
         margin: auto;
        width: 800px; /* 채팅방 너비 조정 */
        margin-top: 50px;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        border-radius: 10px;
       
        overflow-y: auto; /* 세로 스크롤 추가 */
        
    }
       .chatting-title {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }
     .chatDate {
        font-size: 8px;
        color: #888;
    }
    #exit-area{
        text-align:right;
        margin-bottom : 10px;
    }
    .display-chatting {
        max-height: 600px; /* 채팅창 최대 높이 */
        overflow-y: auto; /* 세로 스크롤 추가 */
        height: 600px; /* 채팅방 높이 고정 */
        padding: 10px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        list-style: none;
    }
    .img {
        width:100%;
        height:100%;
        position: relative;
        z-index:-100;
    }
    .chat{
        display : inline-block;
        border-radius : 5px;
        padding : 5px;
        background-color : #eee;
    }
    .input-area{
        width:100%;
        display:flex;
        justify-content: center;
    }
    #inputChatting{
        width: calc(100% - 80px); /* 입력창 너비 조정 */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        resize : none;
    }
    #send{
        width:20%;
        background-color: #f0e68c;
    }
    .myChat{
        text-align: right;
    }
    .myChat > p {
        background-color : gold;
    }
     /* 뒤로가기 버튼 */
    #back-btn {
         padding: 8px 15px;
        background-color: transparent;
        border: 2px solid #007bff;
        border-radius: 5px;
        color: #007bff;
        cursor: pointer;
        float: right;
    }

    #back-btn:hover {
        background-color: green;
        color: white;
    }
    /* 제목 스타일링 */
        .chatting-title {
            text-align: center;
            margin: 20px 0;
            font-size: 30px;
            color: #333;
        }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="chatting-area">
				<button id="back-btn">뒤로가기</button>
			<div id="exit-area">

			 <div class="chatting-title">${list[0].chatTitle}</div>
				 
				<!-- <button class="btn btn-outline-danger" id="exit-btn">채팅방 삭제</button> -->
			</div>
			<ul class="display-chatting">
				<c:forEach items="${list}" var="msg">
				
					
					<c:if test='${msg.userNo eq loginUser.userNo }'>
					
						<li class="myChat">
							<span class="chatDate">${msg.createDate }</span>
							<p class="chat">${msg.message }</p>
						</li>
					</c:if>
					<!-- ne : notEqual -->
				<c:if test="${msg.userNo ne loginUser.userNo }">
					<li>
						<b>${msg.userName }</b>
						<p class="chat">${msg.message }</p>
						<span class="chatDate">${msg.createDate }</span>
					</li>
				</c:if>
					</c:forEach>
				
			</ul>
			
			<div class="input-area">
				<textarea id="inputChatting" rows="3"></textarea>
				<button id="send">보내기</button>
			</div>
		</div>
		
				 
		
		
	
	  
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> 
	<!-- 소켓JS 가져옴. -->
	
	<script>
	let backBtn = document.querySelector("#back-btn");
	backBtn.onclick = function() {
	    history.back();
	}
	</script>
	
	<script>
		// chat.js에서 사용하기 위한 전역변수 등록
		const userNo = '${loginUser.userNo}';
		const userName = '${loginUser.userName}';
		const chatNo = '${chatNo}';
		const contextPath = '${contextPath}';
		

		// 컨트롤러 앤드포인트와 중복되면 안됨. 시큐리티로 인해서 chat2로 지정
		let chattingSocket = new SockJS(contextPath + "/chat2" );
		
		/* console.log("웹 소켓 연결 상태:", chattingSocket.readyState);
		console.log("웹 소켓 연결 상태:", chattingSocket);
		console.log("contextpath 경로 확인 : ", contextPath);
		console.log("chatNo 경로 확인 : ", chatNo);
		console.log("userName 경로 확인 : ", userName); */
	</script>
	
	<script>
	

	// 페이지 로딩 완료후 => window.onload , 채팅창을 맨 아래로 내리는 작업
	// 즉시실행함수(IIFE , 속도 빠름, 변수명 중복 문제도 해결)
	(function(){
	     // 채팅방 요소가져오기
	     const display = document.querySelector(".display-chatting");

	   
	 
	     // 채팅창 맨 아래로 내리기
	     display.scrollTop = display.scrollHeight;
	     // scrollTop : 스크롤의 위치
	     // scrollHeight : 스크롤되는 요소(display)의 전체 높이
	})();

	// 채팅메세지 보내기 기능 만들기
	document.getElementById("send").addEventListener('click' , sendMessage); //아이디값 send 클릭하면 sendMessage 함수 실행

	// 채팅메세지 보내기 함수
	function sendMessage(){

	    //db에 저장할 채팅메세지 정보 얻어오기
	    const inputChatting = document.getElementById("inputChatting"); // 채팅이 입력되는 textarea 가져옴

	    // 입력하지않은 경우
	    if(inputChatting.value.trim().length === 0){
	            alert("뭐라도 작성하세요");

	            inputChatting.value="";
	            inputChatting.focus();

	    }else { // 한글자 이상 입력한 경우

	        // 메세지 객체를 생성
	        const chatMessage = {
	            message : inputChatting.value,
	            chatNo  ,
	            userNo ,
	            userName  
	        };
	   	     console.log("보내는 메시지:" , chatMessage);
	   	     
	        // js 겍체형태로 웹소켓 전달못한다. 반드시 json으로 변환해주기
	        const jsonParsedMessage = JSON.stringify(chatMessage);
	        

	        // send(값) : 웹소켓 핸들러로 값을 보내는 역할을 하는 함수.
	        // send로 전달된 데이터는 웹소켓핸들러의 내부의 handleTextMessage함수가 수신함.
	        chattingSocket.send(jsonParsedMessage);

	        inputChatting.value = "";
	    }
	}

	// 서버 웹소켓핸들러에서 클라이언트 소켓으로 메세지를 전달(send)하는 구문을 감지하는 이벤트핸들러
	chattingSocket.onmessage = function(e) {
	    
		// 전달된 메세지는 e.data내부에 (JSON)형태로 보관

	    // 전달받은 메세지를 JS 객체로 변환.
	    const chatMessage = JSON.parse(e.data);

	    const li = document.createElement("li"); // <li>

	    const p = document.createElement("p"); // <p> </p>
	    p.classList.add("chat");

	    // p태그 내부에 글내용추가 및 개행처리
	    p.innerHTML = chatMessage.message.replace(/\\n/gm, "<br>"); // <p class="chat">전달받은메세지</p>

	    const span = document.createElement("span");
	    span.classList.add("chatDate"); // <span class="chatDate"> ?? </span>
	    span.innerText = currentTime(); // <span class="chatDate"> 2024-01-30 </span>

	    // 내가쓴 채팅인지, 상대방이 쓴 채팅인지 확인
	    if(chatMessage.userNo == userNo) {
	        // 내가쓴글
	        li.classList.add("myChat"); // 내가 쓴글에 해당하는 스타일 적용
	        li.append(span , p);
	    }else {
	        // 남이쓴글
	        li.innerHTML = `<b>${chatMessage.userName}</b>`
	        li.append(p,span);
	    }

	    // 채팅방 요소가져오기
	    const display = document.querySelector(".display-chatting");

	      // 채팅창에 채팅내용 추가하기
	      display.append(li);
	     // 채팅창 맨 아래로 내리기
	     display.scrollTop = display.scrollHeight;
	     // scrollTop : 스크롤의 위치
	     // scrollHeight : 스크롤되는 요소(display)의 전체 높이
	   
	}

	// 현재시간 출력 함수 * 2024-01-30
	function currentTime(){
	    const now = new Date();
	    return `${now.getFullYear()}-${now.getMonth() +1 < 10 ? "0" + (now.getMonth() +1) : now.getMonth() + 1}-${now.getDate() < 10 ? "0" + now.getDate() : now.getDate()}`;
	}

	let exitBtn = document.querySelector("#exit-btn");
	exitBtn.onclick = function() {
		location.href = `${contextPath}/chat/${chatNo}/exit`;
	}

	</script>
	
	<!-- <script type="text/javascript" src="./resources/js/gun.js/chat.js"></script> -->
	  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>