$(document).ready(function(){
    // 라디오 버튼 변경 이벤트 처리
    $('input[name="donateGood"]').change(function(){
        if($(this).val() === "개인"){
            $('#donateGood_individual').show();
            $('#donateGood_enterprise').hide();
        } else {
            $('#donateGood_individual').hide();
            $('#donateGood_enterprise').show();
        }
    });

        // li 태그를 클릭할 때 배경색 변경
        $('.donateGoodSelect li').click(function() {
            // 모든 li 태그에서 clicked 클래스를 제거
            $('.donateGoodSelect li').removeClass('clicked');
            // 클릭된 li 태그에만 clicked 클래스 추가
            $(this).addClass('clicked');
        });

    
    // 페이지 로드 시 생리대 이미지를 표시
    var firstImage = document.querySelector('.donateGood_images');
    firstImage.style.display = 'block';
    

});




function showImage(index) {
    // 모든 이미지를 숨김
    var images = document.querySelectorAll('.donateGood_images');
    for (var i = 0; i < images.length; i++) {
        images[i].style.display = 'none';
    }

    // 클릭된 인덱스에 해당하는 이미지만 보이도록 함
    images[index].style.display = 'block';
}


