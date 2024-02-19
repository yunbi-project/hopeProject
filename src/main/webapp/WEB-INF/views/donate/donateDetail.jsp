<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부하기 상세보기</title>
<link rel="stylesheet" href="../resources/style/css/yunbi.css/yProgramDonate.css">
<link rel="stylesheet" href="../resources/style/css/common.css">
<script src="../resources/js/yunbi.js/yProgramDonate.js"></script>
<script src="../resources/js/common/header.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<section>
        <article class="h_boardTitle">
            <h1>기부하기</h1>
            <p>기부금을 통해 세상을 발전시킵니다.</p>
        </article>
    </section>
            <section>
                <div class="y_donate_detail_top">
                    <div class="y_donate_detail_img">
                    <img src="./resources/style/img/sample1.png"/>
                    </div>
                    <div class="y_donate_detail_info">
                        <h1>아이들이 밝은 세상을 볼 수 있도록 안경을 선물해주세요</h1>
                        <h2 class="y_donate_detail_text1">7,123,456</h2>
                        <p class="y_donate_detail_text1">10,000,000</p>
                        <progress id="progress" value="30" min="0" max="100">value%</progress>

                        <div class="y_donate_detail_list_box">
                            <p>🥰 총 nn명이 참여했습니다.</p>
                        </div>
                        <div class="y_donate_detail_list_box">
                            <p>😎 현재 71% 달성</p>
                        </div>
                        <div class="y_donate_detail_list_box">
                            <p>😎 D - 365 남음</p>
                        </div>
                        <div class="y_donate_back_btn">
                            <button class="y_donate_back_btn1">기부하기</button>
                        </div>  
                    </div>
                </div>

                <div class="y_donate_detail_bottom">
                    <div class="y_donate_detail_content">
                    <h3>소개</h3>
                    <p>
    그룹홈에는 학대 피해 아동이 갈수록 늘어나고 있습니다
    그룹홈(아동공동생활가정)은 보호가 필요한 아동과 청소년을 가정과 같은 환경에서 돌보는 소규모 아동보호시설로 아파트, 
    주택 등 주거시설에서 시설장과 보육사가 7명 이내 아이들과 24시간 생활하는 곳입니다. 2022년 기준 
    전국 518개소 그룹홈에서 학대 피해 아동과 청소년을 보호하고 있으며, 서울에만 64개 그룹홈에서 300명 넘는 
    아이들이 생활하고 있습니다. 아이들에게 또 다른 집이 되어주며 정부 지원을 받지만 한정된 
    예산으로 아이들의 의식주는 물론 기타 교육비, 의료비까지 책임지기 턱없이 부족한 상황입니다. 하지만 최근 들어 늘어나는 학대 피해
    아동으로 그룹홈은 수용 공간 부족에 시달리고 있습니다. 그리고 그중 대부분이 학대로 인한 장애와 신체적, 정신적 충격을 가지고 입소를 합니다.
    콘텐츠 이미지 모음Slide 1 of 3이전 슬라이드다음 슬라이드슬라이드1 / 3시력 검사를 받고 있는 아동
    시력 검사를 받고 있는 아동새로 맞춘 안경을 착용해보는 아동성장기 아동∙청소년의 시력 교정아이들이 보는 세상이 밝았으면 좋겠습니다.
    아프리카 속담 중에 ‘한 아이를 키우려면 온 마을이 필요하다.’라는 속담이 있습니다. 세상에 태어났다는 것만으로 축복받아야 할 어린이들을 
    잘 키워 내기 위해서는 사회 전체의 관심과 돌봄이 필요하다는 의미일 것입니다. 경기 침체와 물가 상승으로 모두가 힘든 하루하루를 살아가고 있습니다. 
    그러다보니 도움이 필요한 우리 이웃을 위한 온정의 손길도 많이 줄어든 것을 해피피플도 체감하고 있습니다. 
    카카오같이가치 후원자 여러분, 그룹홈에서 보호를 받고 있는 학대 피해 아동이 보는 안경 넘어 세상이 
    아름다울 수 있도록 여러분의 많은 관심과 후원 부탁드립니다.
                    </p>
                    </div>
                    <div class="y_donate_detail_countList">
                        <h3>최근 참여한 기부자</h3>
                        <div class="y_donate_detail_list_box">
                            <p>1234번째 기부자</p>
                            <p>10,000 기부</p>
                            <p>2024. 01. 01</p>
                        </div>
                    </div>
                </div>
                <div class="y_donate_back_btn">
                <button class="y_donate_back_btn1" href="${contextPath}/donate/list">목록</button> 
                </div>   
            </section>
            <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>