<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="./resources/style/css/common.css">
    <link rel="stylesheet" href="./resources/style/css/hyun/donateGoodsForm.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./resources/js/common/header.js"></script>
    <script src="./resources/js/hyun/donateGoodsForm.js"></script>
</head>
<body>
    <header class="common">
        <div class='h_header'>
            <div class="h_headerLogo">
                <img src='/images/hyun/' alt="logo" />
            </div>
            <div class='h_headerSelect'>
                <div>
                    <div>홈</div>
                    <div>후원모집</div>
                    <div>물품기부</div>
                    <div class="hoverToShowMenu_activity">활동</div>
                    <div class="hoverToShowMenu_news">소식</div>
                </div>
            </div>
            <div class='h_headerLogin'>
                <ul>
                    <li>로그인</li>
                    <li> | </li>
                    <li>회원가입</li>
                </ul>
            </div>
        </div>
        <div class='h_headerMenu headerMenu_news'>
            <ul class='h_headerMenu_1'>
                <h4>소식</h4>
                <li>행복한 변화와 이야기를 전해드립니다.</li>
            </ul>
            <ul class='h_headerMenu_2'>
                <li>커뮤니티(나눔후기/자유게시판)</li>
                <li>공지사항</li>
                <li>자주 묻는 질문 FAQ</li>
            </ul>
            <ul class='h_headerMenu_3'>
                <li><img src='/images/hyun/희망의조각.png' alt="image" /></li>
            </ul>
        </div>
        <div class='h_headerMenu headerMenu_activity'>
            <ul class='h_headerMenu_1'>
                <h4>활동</h4>
                <li>도움이 가장 필요한 곳에 후원자님의 사랑을 전달합니다.</li>
            </ul>
            <ul class='h_headerMenu_2'>
                <li>봉사활동 지원하기</li>
            </ul>
            <ul class='h_headerMenu_3'>
                <li><img src='/images/hyun/희망의조각.png' alt="image" /></li>
            </ul>
        </div>
    </header>

    <main>
        <h2 style="text-align: center; margin-top: 70px; font-size: 25px;">물품 기부 신청</h2>
        <div class="donateGoodFormBorder"></div>
        <section class="donateGoodForm">
            <div class="donateGoodForm_List">
                <p>문의 유형</p>
                <p id="h_companyName">기업명</p>
                <p id="h_manager">담당자명</p>
                <p id="h_name">이름</p>
                <p>연락처</p>
                <p>이메일</p>
                <p style="height: 400px;">기부물품종류</p>
                <p>기부물품수량</p>
                <p style="height: 100px;">기부방법</p>
                <p style="height: 90px;">기부금영수증<br> 발급 여부</p>
                <p id="h_businessNumber" hidden>사업자번호</p>
                <p id="h_residentNumer" hidden>주민등록번호</p>
                <p>기타문의 혹은<br> 요청사항</p>
            </div>

            <div class="donateGoodForm_List_1">
                <div style="margin: 0px 0px 10px 0px;">
                    <label style="margin-right: 50px;" class="radio-container">
                        <input name="donateGood" id="personalItems" type="radio" value="개인물품후원" required>
                        <span class="checkmark">개인물품후원</span>
                    </label>
                    <!-- 두 번째 라디오 버튼 -->
                    <label class="radio-container">
                        <input name="donateGood" id="businessItems" type="radio" value="기업물품후원" required>
                        <span class="checkmark">기업물품후원</span>
                    </label>
                </div>

                <!-- 기업 -->
                <input type="text" id="h_businessNameInput" class="donateGoodInput" placeholder="기업명 입력" required>
                <input type="text" id="h_managerInput" class="donateGoodInput" placeholder="담당자명 입력" required>

                <!-- 개인 -->
                <input type="text" id="h_nameInput" class="donateGoodInput" placeholder="이름 입력" required>



                <!-- 연락처 -->
                <div>
                    <input type="text" style="width: 350px;" class="donateGoodInput" placeholder="'-'빼고 숫자만 입력" required>
                    <input type="button" class="donateGoodBtn" value="인증요청">
                </div>

                <!-- 이메일 -->
                <input type="text" class="donateGoodInput" placeholder="example@hope.co.kr" required>

                <!-- 기부물품종류 -->
                <div class="donateGoodRadio_List">
                    <p>유통기한 1년이상, 새상품만 기부가 가능합니다.</p>
                    <label><input type="radio" name="donateGoodType" value="생리대" required><span>생리대</span></label>
                    <label><input type="radio" name="donateGoodType" value="의류/잡화" required><span>의류/잡화</span></label>
                    <label><input type="radio" name="donateGoodType" value="화장품" required><span>화장품</span></label>
                    <label><input type="radio" name="donateGoodType" value="생활용품" required><span>생활용품</span></label>
                    <label><input type="radio" name="donateGoodType" value="가전제품" required><span>가전제품 (제조일 기준 10년이하 새상품)</span></label>
                    <label><input type="radio" name="donateGoodType" value="유아용품" required><span>유아용품</span></label>
                    <label><input type="radio" name="donateGoodType" value="건강기능식품" required><span>건강기능식품 (식약처 인증)</span></label>
                    <label><input type="radio" name="donateGoodType" value="위생용품" required><span>위생용품</span></label>
                    <label><input type="radio" name="donateGoodType" value="학용품" required><span>학용품</span></label>
                    <label><input type="radio" name="donateGoodType" value="도서" required><span>도서 (중고도서 불가)</span></label>
                </div>

                <!-- 기부물품 수량 -->
                <input type="text" class="donateGoodInput" placeholder="(예 : 의류 3천벌, 5대봉)" required>

                <!-- 기부방법 -->
                <p style="font-size: 15px;">희망의 조각은 기부금으로 운영되는 단체로 더 많은 이웃을 돕기 위해 기부자 부담으로 물품을 발송해 주시기 바랍니다.</p>
                <select class="donateGoodSelect" required>
                    <option value="택배발송">택배발송</option>
                    <option value="용달발송">용달발송</option>
                    <option value="방문기부">방문기부 (10~17시, 점심시간 12시-13시 제외)</option>
                </select>

                <!-- 기부금영수증 발급 여부 -->
                <div class="donateGoodRadio_List">
                    <p style="font-size: 15px; margin-top: 30px;">후원물품 도착 기준 3주 소요되며, 기타 상황에 따라 변동될 수 있습니다</p>
                    <label><input type="radio" id="h_receiptY" name="donateGoodsreceipt" value="Y" required><span>예</span></label>
                    <label><input type="radio" id="h_receiptN" name="donateGoodsreceipt" value="N" required><span>아니요</span></label>
                </div>

                <!-- 사업자 번호 -->
                <input type="text" id="h_businessNumberInput" class="donateGoodInput" placeholder="사업자번호 입력" required hidden>

                <!-- 주민등록번호 -->
                <input type="text" id="h_residentNumerInput" class="donateGoodInput" placeholder="주민등록번호 입력" required hidden>

                <!-- 기타문의 혹은 요청사항 -->
                <input type="text" style="width: 450px; height: 150px; margin: 20px 0px 40px 0px;" >
            </div>
        </section>
    </main>

</body>
</html>tml>