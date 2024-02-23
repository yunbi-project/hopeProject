<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="${contextPath}/resources/style/css/hyun.css/donateProduct.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/hyun.js/donateProduct.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <section>
        <article class="h_boardTitle">
            <h1>물품기부</h1>
            <p>물품기부를 통해 자원을 재순환 시킵니다.</p>
        </article>
    </section>

    <main style="text-align: center;">
        <h1 class="h_donationGood_division">물품기부 신청자 구분</h1>
        <span>원활한 신청 정보 관리를 위해 해당사항을 선택해주세요!</span>
        <div class="radio_div" style="margin-top: 80px; text-align: center;">
            <!-- 첫 번째 라디오 버튼 -->
            <label class="radio-container">
                <input name="donateGood" type="radio" value="개인" checked>
                <span class="checkmark">개인</span>
            </label>
            <!-- 두 번째 라디오 버튼 -->
            <label class="radio-container">
                <input name="donateGood" type="radio" value="기업">
                <span class="checkmark">기업</span>
            </label>
        </div>

        <!-- 개인 -->
        <div>
            <p class="donate_p" id="donateGood_individual">
                물품기부를 통해 아동청소년, 미혼모, 독거노인, 위기가정, 기타취약계층을 지원하며<br>
                지파운데이션 나눔가게를 통해 자원이 재순환 되고 일자리가 창출되며 환경을 보호할 수 있습니다.
            </p>
        </div>

        <!-- 기업 -->
        <div>
            <p class="donate_p" id="donateGood_enterprise" style="display: none;">
                기업의 판매, 재고물품 기부를 통해<br>
                아동청소년, 미혼모, 독거노인, 위기가정, 기타취약계층을 지원하며<br>
                희망의 조각 나눔가게를 통해 기업의 물품이 자원재순환 되고<br>
                일자리가 창출되며 환경을 보호할 수 있습니다.
            </p>
        </div>

        <div style="border:1px solid black; width: 1100px; margin: 0 auto;"></div>

        <!-- 기부 가능 물품 알아보기 -->
        <div style="text-align: center; margin-top: 50px; margin-bottom: 20px;">
            <h2><img class="donateGoodNumber" src="https://cdn-icons-png.flaticon.com/128/3097/3097244.png">기부가능 물품 알아보기</h2>
            <span>물품 기부는 새상품만 기부 가능합니다.</span>
        </div>
        <section class="donateGoodList" style="text-align: center;">
            <div class="donateGoods">
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/생리대.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/의류_잡화.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/화장품.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/생활용품.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/가전제품.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/유아용품.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/건강기능식품.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/위생용품.png"></a>
                <a href="${contextPath }/product/donateProductForm"><img class="donateGood_images" src="${contextPath }/resources/style/img/product/기타.png"></a>
            </div>
            <div class="donateGoodSelect">
                <ul style="margin:0%;">
                    <li onclick="showImage(0)" class="clicked">생리대</li>
                    <li onclick="showImage(1)">의류/잡화</li>
                    <li onclick="showImage(2)">화장품</li>
                    <li onclick="showImage(3)">생활용품</li>
                    <li onclick="showImage(4)">가전제품</li>
                    <li onclick="showImage(5)">유아용품</li>
                    <li onclick="showImage(6)">건강기능식품</li>
                    <li onclick="showImage(7)">위생용품</li>
                    <li onclick="showImage(8)">기타</li>
                </ul>
            </div>
        </section>

        <!-- 기부 절차 -->
        <section  style="margin-top: 50px; margin-bottom: 50px;">
            <h2><img class="donateGoodNumber" src="https://cdn-icons-png.flaticon.com/128/3097/3097266.png">기부절차</h2>
            <div class="donateGoodHow">
                <div class="donateGoodHowList">
                    <h3><span>01.</span> 후원문의</h3>
                    <p>품목, 수량 등 기부물품의 정보 작성 및 신청</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/7773/7773012.png">
                </div>
                <img class="donateGoodHowList_img" src="https://cdn-icons-png.flaticon.com/128/137/137624.png">
                <div class="donateGoodHowList">
                    <h3><span>02.</span> 접수 및 협의</h3>
                    <p>문의주신 내용을 토대로 기부가능여부 협의</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/5560/5560312.png">
                </div>
                <img class="donateGoodHowList_img" src="https://cdn-icons-png.flaticon.com/128/137/137624.png">
                <div class="donateGoodHowList">
                    <h3><span>03.</span> 물품 기부</h3>
                    <p>후원물품 발송 및 입고</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/12259/12259341.png">
                </div>
                <div class="donateGoodHowList">
                    <h3><span>04.</span> 기부금 영수증 발행</h3>
                    <p>검수 이후 기부금 영수증 발행</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/3734/3734681.png">
                </div>
                <img class="donateGoodHowList_img"src="https://cdn-icons-png.flaticon.com/128/137/137624.png">
                <div class="donateGoodHowList">
                    <h3><span>05.</span> 지원 및 판매</h3>
                    <p>취약계층 직접 지원 및 나눔가게 판매</p>
                    <img src="https://cdn-icons-png.flaticon.com/128/9009/9009879.png">
                </div>
            </div>

        </section>
        
        <!-- 모달 -->
	    <section id="myModal" class="modal">
	    	<div class="modal-content">
		    	<!-- 모달 내용 -->
		        <span class="close" id="closeModal">&times;</span>
		        <div class="tip">
		        	<img style="width:50px" src="https://cdn-icons-png.flaticon.com/128/4201/4201973.png">
		          	<span>물품 기부 내역을 수정하기 위해서는 물품기부번호가 필요합니다.</span>
		        </div>
		        <div class="tip1">
		        	<span>※ 물품 기부 번호 조회의 경우, 배송완료 되지 않은 건에 대해서만 조회됩니다.</span>
		        </div>
		        
		        <article class="donateModalForm">
			        <div class="donateModifyTitle">
			        	<div id="productNoCheck">물품 기부 번호 조회</div>
			        	<div id="productModify">물품 기부 수정 정보 입력</div>
			        </div>
			        
			        <div id="donateNoCheck" class="donateNoCheck">
			        	<span>전화번호 입력 *</span><br>
			        	<input type="text" name="phone" id="donateNoPhone" class="phoneInput" placeholder="-빼고 전화번호 입력">
			        	<input type="button" class="donateGoodBtn" id="donateGoodBtn" value="인증요청">
			        	<input type="text" id="certificationNumber" class="phoneInput" placeholder="인증번호 4자리 입력" required>
	                	<input type="button" style="background-color:#abe138;" id="certificationNumberBtn" class="donateGoodBtn1" value="인증 확인">
			        	<button type="button" id="viewBtn" class="productBtn">조회하기</button>
			        </div>
			        
			        <!-- 물품기부번호 조회 결과 -->
			        
			        <div class="donateNoCheckResult" style="display:none">

			        </div>
			        
			        <div id="donateModifyForm" class="donateModifyForm">
				        <div>
				        	<span>물품기부번호 입력 *</span>
				        	<input type="text"  class="donateInput" id="productNo" name="productNo" placeholder="물품기부번호 입력">
				        </div>
				        
				        <div>
			        		<span>이름 입력 *</span>
			        		<input type="text" class="donateInput" id="puserName" name="puserName" placeholder="이름 입력">
			        	</div>
				        
				        <div>
				        	<span>전화번호 입력 *</span>
				        	<input type="text" name="phone" id="modifyPhone" class="phoneInput" placeholder="-빼고 전화번호 입력">
				        	<input type="button" class="donateGoodBtn" id="donateGoodBtn1" value="인증요청">
				        	<input type="text" id="certificationNumber1" class="phoneInput" placeholder="인증번호 4자리 입력" required>
				        	<input type="button" style="background-color:#abe138;" id="certificationNumberBtn1" class="donateGoodBtn1" value="인증 확인">
			        	</div>
			        	
						<input type="button" class="resetFilters" value="필터해제" onclick="resetFilters()">
			        	<button type="button" id="modifyBtn" class="productBtn">수정하기</button>
			        </div>
		        </article>
	      	</div>
	    </section>
        
        <!-- 기부 방법 -->
        <section>
            <h1 ><img class="donateGoodNumber" src="https://cdn-icons-png.flaticon.com/128/3097/3097290.png">기부 방법</h1>
            <div class="h_donationGood_articleList">
                <article class="h_donationGood_article">
                    <h3 style="text-align: center; background-color: rgb(201, 200, 200); margin: 0px; padding:20px;">택배발송</h3>
                    <div style="padding: 20px;">
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">희망의 조각은 기부금으로 운영되는 단체로, 더많은 이웃을 돕기위해 선불택배로 기부물품을 발송해주시기 바랍니다.</p>
                        <p>박스무게 : 15kg 이하</p>
                        <p>박스크기 : 우체국 5호 박스 사이즈 (가로+세로+높이≤ 120cm 이하)</p>
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">후원물품은 물품기부 신청 후 아래의 주소로 발송 부탁드립니다.</p>
                        <p>주소 : 경기도 성남시 분당구 판교로 256번길 7</p>
                    </div>
                </article>
    
                <article class="h_donationGood_article1">
                    <h3 style="text-align: center; background-color: rgb(201, 200, 200); margin: 0px; padding:20px;">직접기증</h3>
                    <div style="padding: 20px;">
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">물류창고와 가까운 경우 직접 방문하여 기증하실 수 있습니다.</p>
                        <p><img class="donateGoodHow_img" src="https://cdn-icons-png.flaticon.com/128/7949/7949317.png">방문 전 방문일정 전달 부탁드립니다.</p>
                        <p>문의 : 1588-7701</p>
                    </div>
                </article>
            </div>
        </section>

        <button class="h_donationGood_article_btn" >물품 기부 신청하기</button>
        <button class="h_donationGood_article_btn1" id="openModal">물품 기부 내역 수정하기</button>
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(document).ready(function() {
		    $(".h_donationGood_article_btn").click(function() {
		        // 선택된 라디오 버튼의 값을 가져오기
		        var donateType = $("input[name='donateGood']:checked").val();
	
		        // donateProductForm.jsp로 값 전달
		        $.ajax({
		            type: "POST",
		            url: "product.bo",
		            data: { donateType: donateType }, // 전달할 데이터
		            success: function(response) {
		                // 성공적으로 값을 전달한 후의 처리
		                console.log("데이터 전달 성공");
		                
		             	// 페이지 이동
		                window.location.href = "product/donateProductForm";
		            },
		            error: function() {
		                // 오류 발생 시 처리
		                console.log("데이터 전달 실패");
		            }
		        });
		    });
		    
		    
		    
		    
			//휴대폰 번호 인증 물품기부번호 찾기
			var code2 = "";
			$("#donateGoodBtn").click(function(){
			    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
			    var phoneNumber = $("#donateNoPhone").val();
			    $.ajax({
			        type:"POST", // post 형식으로 발송
			        url:"/hope/sendSMS1.do", // controller 위치
			        data: {phone:phoneNumber}, // 전송할 ㅔ이터값
			        cache : false,
			        success:function(data){
			            if(data == "error"){ //실패시 
			                alert("휴대폰 번호가 올바르지 않습니다.")
			            }else{            //성공시        
			                alert("휴대폰 전송이  됨.")
			                code2 = data; // 성공하면 데이터저장
			            }
			        }
			    });
			});
			
			// 휴대폰 번호 인증 물품기부 수정하기
			$("#donateGoodBtn1").click(function(){
			    alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
			    var phoneNumber = $("#modifyPhone").val();
			    $.ajax({
			        type:"POST", // post 형식으로 발송
			        url:"/hope/sendSMS1.do", // controller 위치
			        data: {phone:phoneNumber}, // 전송할 ㅔ이터값
			        cache : false,
			        success:function(data){
			            if(data == "error"){ //실패시 
			                alert("휴대폰 번호가 올바르지 않습니다.")
			            }else{            //성공시        
			                alert("휴대폰 전송이  됨.")
			                code2 = data; // 성공하면 데이터저장
			            }
			        }
			    });
			});
			 
			
			//휴대폰 인증번호 대조 (물품기부번호 찾기)
			$("#certificationNumberBtn").click(function(){
			    if($("#certificationNumber").val() == code2){ // 위에서 저장한값을 교함
			        alert('인증성공')
			    }else{
			        alert('인증실패')
			    }
			});
			
			//휴대폰 인증번호 대조 (물품기부 수정)
			$("#certificationNumberBtn1").click(function(){
			    if($("#certificationNumber1").val() == code2){ // 위에서 저장한값을 교함
			        alert('인증성공')
			    }else{
			        alert('인증실패')
			    }
			});
			
			
			// 조회하기 버튼 클릭시
			$("#viewBtn").click(function(){
				
		        var phone = $("#donateNoPhone").val();
		        
		     	// 입력한 인증번호를 가져옵니다.
		        var certificationNumber = $("#certificationNumber").val();
		     	
		     	// 인증번호 입력란이 비어있는지 확인합니다.
		        if (!certificationNumber) {
		            alert("인증번호를 입력해주세요.");
		            return false; // 함수 종료
		        }

		        // 입력한 인증번호와 저장된 인증번호를 비교합니다.
		        if (certificationNumber != code2) {
		            // 인증번호가 일치하지 않는 경우
		            alert("인증번호 확인을 다시 해주세요.");
		            return false; // 함수 종료
		        } 
		        
		     	// 인증번호가 일치하는 경우에만 아래 코드 실행
		        $.ajax({
		            type:"POST",
		            url: "productNoCheck.bo",
		            data: {phone : phone},
		            success : function(response){
		                console.log("물품기부번호 조회 성공");
		                $("#donateNoCheck").hide();
		                $(".donateNoCheckResult").show();
		                
		                // 여기에 성공 시 실행할 코드를 추가합니다.
		                $(".donateNoCheckResult").empty(); // 이전 결과를 지우고 다시 채워넣는다
		                if(response.length === 0) {
		                    $(".donateNoCheckResult").append("<span class='noShow'>조회된 물품기부번호가 없습니다.</span>");
		                } else {
		                    $.each(response, function(index, pro) {
		                        var resultDiv = "<div class='donateResult'>" +
		                                            "<div class='donateResult_content'>" +
		                                                "<span style='color:red; font-weight:bold;'>물품기부번호</span>" +
		                                                "<span>문의유형</span>" +
		                                                "<span>이름</span>" +
		                                                "<span>기부물품</span>" +
		                                                "<span>배송방법</span>" +
		                                            "</div>" +
		                                            "<div style='border: 1px solid #D8D8D8;'></div>" +
		                                            "<div class='donateResult_db'>" +
		                                                "<span style='color:red; font-weight:bold;'>" + pro.productNo + "번</span>" +
		                                                "<span>" + pro.productType + " 후원</span>" +
		                                                "<span>" + pro.puserName + "</span>" +
		                                                "<span>" + pro.categoryName + "</span>" +
		                                                "<span>" + pro.productWay + "</span>" +
		                                            "</div>" +
		                                        "</div>";
		                        $(".donateNoCheckResult").append(resultDiv);
		                    });
		                }
		            },
		            error:function() {
		                console.log("물품기부번호 조회 실패");
		            }
		        });
		    });	
			
			// 수정하기 버튼 클릭 시 
			$("#modifyBtn").click(function(){
			    
			    var phone = $("#modifyPhone").val();
			    var productNo = $("#productNo").val();
			    var puserName = $("#puserName").val();
			    
			    
		     	// 입력한 인증번호를 가져옵니다.
		        var certificationNumber = $("#certificationNumber1").val();
		     	
		     	// 인증번호 입력란이 비어있는지 확인합니다.
		        if (!certificationNumber) {
		            alert("인증번호를 입력해주세요.");
		            return false; // 함수 종료
		        }

		        // 입력한 인증번호와 저장된 인증번호를 비교합니다.
		        if (certificationNumber != code2) {
		            // 인증번호가 일치하지 않는 경우
		            alert("인증번호 확인을 다시 해주세요.");
		            return false; // 함수 종료
		        } 
			    
			    
			    if (!productNo.trim()) {
			        alert("물품 기부 번호를 입력하세요.");
			        return false; // 폼 제출 막기
			    }
			    
			    if (!puserName.trim()) {
			        alert("이름을 입력하세요.");
			        return false; // 폼 제출 막기
			    }
			    
			    // 필드값 유효한지 검증
			    if (!phone.trim()) {
			        alert("휴대폰 번호를 입력하세요.");
			        return false; // 폼 제출 막기
			    }
			    
			    
			    $.ajax({
			        type: "POST",
			        url: "productUpdateCheck.bo",
			        data: {
			            phone: phone,
			            productNo: productNo,
			            puserName: puserName
			        },
			        success: function(response){
			            console.log("데이터 전달 성공");
			            
			         	// 서버로부터 받은 응답을 검사하여 데이터가 없을 경우 처리
			            if (response == null) {
			                alert("일치하는 정보가 없습니다.");
			            } else {
			                // Ajax 요청이 성공한 후에 페이지 이동
			                window.location.href = "product/donateProductUpdate";
			            }
			        },
			        error: function() {
			            // 오류 발생 시 처리
			            alert("일치하는 정보가 없습니다.");
			            console.log("데이터 전달 실패");
			        }
			    });
			});
		});
   </script>
    
</body>
</html>