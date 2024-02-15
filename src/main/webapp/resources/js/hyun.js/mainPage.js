/**
 * 
 */

 $(function(){
    // 자원재순환 hover 했을 때 효과
    // 이미지와 텍스트 요소를 가져옵니다.
    const image = document.querySelector('.h_group .h_line-6');
    const text17 = document.querySelector('.h_text-wrapper-17');
    const text20 = document.querySelector('.h_text-wrapper-20');

    // 이미지와 텍스트에 hover 이벤트를 설정합니다.
    function applyHoverEffect() {
        text17.style.color = 'green'; // 텍스트의 색상을 초록색으로 변경합니다.
        image.style.opacity = 0.7; // 이미지의 불투명도를 조정합니다.
    }

    function removeHoverEffect() {
        text17.style.color = ''; // 텍스트의 색상을 원래대로 돌립니다.
        image.style.opacity = ''; // 이미지의 불투명도를 원래대로 돌립니다.
    }

    function applyHoverEffectText20() {
        text17.style.color = 'green'; // 텍스트의 색상을 초록색으로 변경합니다.
        image.style.opacity = 0.7; // 이미지의 불투명도를 조정합니다.
    }

    function removeHoverEffectText20() {
        text17.style.color = ''; // 텍스트의 색상을 원래대로 돌립니다.
        image.style.opacity = ''; // 이미지의 불투명도를 원래대로 돌립니다.
    }

    // 이미지와 텍스트에 hover 이벤트를 추가합니다.
    image.addEventListener('mouseover', applyHoverEffect);
    image.addEventListener('mouseout', removeHoverEffect);
    text17.addEventListener('mouseover', applyHoverEffect);
    text17.addEventListener('mouseout', removeHoverEffect);
    text20.addEventListener('mouseover', applyHoverEffectText20);
    text20.addEventListener('mouseout', removeHoverEffectText20);



    // 참여문화
    const image1 = document.querySelector('.h_line-8');
    const text18 = document.querySelector('.h_text-wrapper-18');
    const text21 = document.querySelector('.h_text-wrapper-21');

    // 이미지와 텍스트에 hover 이벤트를 설정합니다.
    function applyHoverEffect1() {
        text18.style.color = 'green'; // 텍스트의 색상을 초록색으로 변경합니다.
        image1.style.opacity = 0.7; // 이미지의 불투명도를 조정합니다.
    }

    function removeHoverEffect1() {
        text18.style.color = ''; // 텍스트의 색상을 원래대로 돌립니다.
        image1.style.opacity = ''; // 이미지의 불투명도를 원래대로 돌립니다.
    }

    function applyHoverEffectText21() {
        text18.style.color = 'green'; // 텍스트의 색상을 초록색으로 변경합니다.
        image1.style.opacity = 0.7; // 이미지의 불투명도를 조정합니다.
    }

    function removeHoverEffectText21() {
        text18.style.color = ''; // 텍스트의 색상을 원래대로 돌립니다.
        image1.style.opacity = ''; // 이미지의 불투명도를 원래대로 돌립니다.
    }

    // 이미지와 텍스트에 hover 이벤트를 추가합니다.
    image1.addEventListener('mouseover', applyHoverEffect1);
    image1.addEventListener('mouseout', removeHoverEffect1);
    text18.addEventListener('mouseover', applyHoverEffect1);
    text18.addEventListener('mouseout', removeHoverEffect1);
    text21.addEventListener('mouseover', applyHoverEffectText21);
    text21.addEventListener('mouseout', removeHoverEffectText21);


    // 국내외지원
    const image2 = document.querySelector('.h_line-10');
    const text19 = document.querySelector('.h_text-wrapper-19');
    const text22 = document.querySelector('.h_text-wrapper-22');

    // 이미지와 텍스트에 hover 이벤트를 설정합니다.
    function applyHoverEffect2() {
        text19.style.color = 'green'; // 텍스트의 색상을 초록색으로 변경합니다.
        image2.style.opacity = 0.7; // 이미지의 불투명도를 조정합니다.
    }

    function removeHoverEffect2() {
        text19.style.color = ''; // 텍스트의 색상을 원래대로 돌립니다.
        image2.style.opacity = ''; // 이미지의 불투명도를 원래대로 돌립니다.
    }

    function applyHoverEffectText22() {
        text19.style.color = 'green'; // 텍스트의 색상을 초록색으로 변경합니다.
        image2.style.opacity = 0.7; // 이미지의 불투명도를 조정합니다.
    }

    function removeHoverEffectText22() {
        text19.style.color = ''; // 텍스트의 색상을 원래대로 돌립니다.
        image2.style.opacity = ''; // 이미지의 불투명도를 원래대로 돌립니다.
    }

    // 이미지와 텍스트에 hover 이벤트를 추가합니다.
    image2.addEventListener('mouseover', applyHoverEffect2);
    image2.addEventListener('mouseout', removeHoverEffect2);
    text19.addEventListener('mouseover', applyHoverEffect2);
    text19.addEventListener('mouseout', removeHoverEffect2);
    text22.addEventListener('mouseover', applyHoverEffectText22);
    text22.addEventListener('mouseout', removeHoverEffectText22);



    // 다중 슬라이드 
    new Swiper('.swiper-container', {

        slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
        spaceBetween : 30, // 슬라이드간 간격
        slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    
        // 그룹수가 맞지 않을 경우 빈칸으로 메우기
        // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
        loopFillGroupWithBlank : true,
    
        loop : true, // 무한 반복
    
        pagination : { // 페이징
            el : '.swiper-pagination',
            clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        navigation : { // 네비게이션
            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
        },
    });
});