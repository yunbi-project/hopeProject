<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .chatting-area{
        margin :auto;
        height : 600px;
        width : 800px;
        margin-top : 50px;
        margin-bottom : 500px;
    }
    #exit-area{
        text-align:right;
        margin-bottom : 10px;
    }
    .display-chatting {
        width:42%;
        height:450px;
        border : 1px solid gold;
        overflow: auto; /*스크롤 처럼*/
        list-style:none;
        padding: 10px 10px;
        background : lightblue;
        z-index: 1;
        margin: auto;
        background-image : url(${contextPath}/resources/main/chunsickbackground.png);
        background-position: center;
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
        width: 32%;
        resize : none;
    }
    #send{
        width:20%;
    }
    .myChat{
        text-align: right;
    }
    .myChat > p {
        background-color : gold;
    }
    .chatDate{
        font-size : 10px;
    }
</style>
</head>
<body>

<div class="chatting-area">
			<div id="exit-area">
				<button class="btn btn-outline-danger" id="exit-btn">나가기</button>
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
						${msg.chatNo }
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
	<!-- 소켓JS 프론트버전 pom.xml l에서 라이브러리 불러온거 가져왔음. -->
	
	<script>
		// chat.js에서 사용하기 위한 전역변수 등록
		const userNo = '${loginUser.userNo}';
		const userName = '${loginUser.userName}';
		const chatNo = '${chatNo}';
		const contextPath = '${contextPath}';
		
		// 웹소켓 객체 생성. /chat이라는 요청주소를 통해 웹소켓 객체를 생성
		let chattingSocket = new SockJS(contextPath+"/chat/room/4");
		console.log("웹 소켓 연결 상태:", chattingSocket.readyState);
		console.log("contextpath 경로 확인 : ", contextPath);
		console.log("chatNo 경로 확인 : ", chatNo);
		console.log("userName 경로 확인 : ", userName);
		
		/* 
			WebSocket
			- 브라우저와 웹서버간의 통신을 지원하는 프로토콜.
			
			*전 이중 통신(Full Duplex) : 두대의 단말기가 데이터를 송수신하기위해, 각각 독립된 회선을 사용하는 방식
				ex) 전화기
				
			- HTML5부터 지원
			- JAVA에서는 7버전부터 지원(에러때문에 8이상부터 사용 권장)
			- Spring Framework 4버전 이상부터 지원.
		*/
		
	</script>
	
	<script>
	/**
	 * 
	 */

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
	document.getElementById("send").addEventListener('click' , sendMessage); //아이디값 send 클릭하면 sendMessage 함수 실행하겠다.

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
	   	     
	        // 데이터 전달시 js의 객체형태로는 웹소켓에 전달못함.
	        // 브라우저에서는 js 해독이 가능하나 자바에서는 js 객체 해독못함.
	        // 그럼으로 반드시 json으로 변환해주기
	        const jsonParsedMessage = JSON.stringify(chatMessage);
	        
	        console.log("보내는 메시지:" , jsonParsedMessage);

	        // send(값) : 웹소켓 핸들러로 값을 보내는 역할을 하는 함수.
	        // send로 전달된 데이터는 웹소켓핸들러의 내부의 handleTextMessage함수가 수신함.
	        chattingSocket.send(jsonParsedMessage);

	        inputChatting.value = "";
	    }
	}

	// 서버 웹소켓핸들러에서 클라이언트 소켓으로  메세지를 전달(send)하는 구문을 감지하는 이벤트핸들러
	chattingSocket.onmessage = function(e) {
	    console.log(e.data);
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

	    // 내가쓴 채팅인지, 상대방이 슨 채팅인지 확인
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
	    location.href = `${contextPath}/chat/chat/${chatNo}/exit`;
	}

	</script>
	
	<!-- <script type="text/javascript" src="./resources/js/gun.js/chat.js"></script> -->


</body>
</html>