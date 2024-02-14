<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/style/css/hyun.css/common.css">
<link rel="stylesheet" href="./resources/style/css/yunbi.css/yProgramDonate.css">
<script src="./resources/js/yunbi.js/yProgramDonate.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<section>
        <article class="h_boardTitle">
            <h1>자원봉사</h1>
            <p>자원봉사 함께 나아가는 더 나은 세상.</p>
        </article>
    </section>
<section>
<!--                 <div class="y_banner_top"> -->
<!--                     <div class="y_banner_left"> -->
<!--                         <h1>자원봉사 활동</h1> -->
<!--                         <p>아름다운가게는 경제, 사회, 환경이 조화를 이루며 공동체가 자립하고 성장하는 '지속가능한 변화'를 꿈꿉니다. 이를 위해, 우리는 다양한 이해관계자들과 자발성, 상호성, 평등성에 기반한 관계를 구축하고 '참여를 통한 나눔' 문화를 확산하기 위한 최선의 노력을 기울이고 있습니다.</p> -->
<!--                     </div> -->
<!--                     <div class="y_banner_right"> -->
<!--                         <img src="./images/passion2.jpg" /> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="y_program_detail">
                    <span>진행중</span><img src ="./resources/images/program/heart.svg" class="heart_logo no" onclick="toggleLike()"></img>
                    <h1>도서관 서가 정리 활동</h1>
                    <img src="./resources/style/img/sample1.png" class="y_program_detail_main_img"></img>

                    <table class="y_table">
                        <tr>
                            <td>봉사 기간</td>
                            <td>2024. 03. 01 ~ 2024. 03. 31</td>
                        </tr>
                        <tr>
                            <td>봉사 시간</td>
                            <td>오전</td>
                        </tr>
                        <tr>
                            <td>모집 기간</td>
                            <td>2024. 03. 01 ~ 2024. 03. 31</td>
                        </tr>
                        <tr>
                            <td>활동 요일</td>
                            <td>월, 수, 금</td>
                        </tr>
                        <tr>
                            <td>모집 인원</td>
                            <td>2 / 30</td>
                        </tr>
                        <tr>
                            <td>봉사 장소</td>
                            <td>서울시 강남구 시립도서관</td>
                        </tr>
                        <tr>
                            <td>봉사 유형</td>
                            <td>정기</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td id="">'에코파티메아리'는 쓰임을 다한 소재에 새로운 쓰임을 더한 업사이클 디자인 브랜드로 기부되어 오는 ‘버려지는 것’들 중 가죽, 의류, 기타 친환경적인 소재들을 발굴해 새로운 쓰임을 디자인하여 실용 적인 패션잡화 및 친환경 캠페인 제품들을 만듭니다.
이로 인해 환경에 대한 사람들의 관심을 유발하고 지구를 지키는 에코라이프스타일의 확산을 추구합니다.

006년 5월, 아름다운가게는 국내 최초 리사이클 디자인 제품 브랜드 ‘에코파티메아리’를 론칭 했습니다. 에코디자인사업은 자연과 삶의 환경을 생각하는 지점에서부터 디자인되는 것으로 다양한 분야에서 에코디자인이라는 이름으로 친환경적인 것을 의미합니다. 그런 지점에 아름다운가게 역시 버려지는 것들에 대해 친환경적인 것을 추구하며 그에 따라 버려지는 것들에 대한 고민을 시작하게 되었습니다. 이제는 에코디자인 사업 내에 리사이클(재활용)을 넘어 새로운 가치를 부여한 제품을 탄생시키는 업사이클 디자인이란 이름으로 보다 명확한 개념으로 전세계적으 로 업사이클 디자인운동이 시작되고 있습니다.
에코파티메아리는 2006년, 쌈지리사이클링 디자인 그룹과 공동으로 런칭하여 현수막에코백, 리 사이클 한 구두 등 대한민국에 파격적인 리사이클패션을 선보였으며, 2009년에는 아름다운가게 단독 브랜드로서의 매장을 가지고 운영. 여러 디자이너들, 단체들과의 협업을 통해 다양한 패션 잡화제품을 세상에 내놓았습니다. 같은 해에 뉴욕 현대미술관(MoMA)에 전시되었으며, 현재 아 름다운가게 전국 주요 매장과 에이랜드 등 편집숍을 통해 소비자들과 만나 업사이클 브랜드로서 의 입지를 확장해 나가고 있습니다.</td>
                        </tr>
                    </table>
                    <div class="y_donate_back_btn">
                        <button class="y_program_btn1" onclick='applyProgram()'>지원하기</button>
                        <button class="y_donate_back_btn1" href='/programList'>목록</button>
                    </div>
                </div>
            </section>
     <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>