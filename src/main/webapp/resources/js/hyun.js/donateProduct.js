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
    
    
    
    
    // 모달 열기
    $("#openModal").click(function() {
        $("#myModal").fadeIn();
    });

    // 모달 닫기
    $("#closeModal").click(function() {
        $("#myModal").fadeOut();
        $(".donateInput, .phoneInput").val("");
    });


    // 모달 외부를 클릭하면 닫기
    $(window).click(function(event) {
        var modal = $("#myModal");
        if (event.target === modal[0]) {
          modal.fadeOut();
        }
    });
      
    
    
    // 초기 상태 설정
    $("#productNoCheck").css("background-color", "#ABe138"); // productNoCheck에 배경색 설정
    $("#donateNoCheck").show(); // donateNoCheck 보이도록 설정
    $("#donateModifyForm").hide(); // donateModifyForm 숨기도록 설정
    
    // productModify 클릭 시 이벤트 처리
    $("#productModify").click(function() {
        // donateModifyForm 보이도록 설정
        $("#donateModifyForm").show();
        // donateNoCheck 숨기도록 설정
        $("#donateNoCheck").hide();
        // productNoCheck 배경색 제거
        $("#productNoCheck").css("background-color", "");
        // productModify 배경색 설정
        $("#productModify").css("background-color", "#ABe138");
		$(".donateInput, .phoneInput").val("");
		$("#donateNoCheckResult").hide();
    });

    // productNoCheck 클릭 시 이벤트 처리
    $("#productNoCheck").click(function() {
        // donateModifyForm 숨기도록 설정
        $("#donateModifyForm").hide();
        // donateNoCheck 보이도록 설정
        $("#donateNoCheck").show();
        // productModify 배경색 제거
        $("#productModify").css("background-color", "");
        // productNoCheck 배경색 설정
        $("#productNoCheck").css("background-color", "#ABe138");
        $(".donateInput, .phoneInput").val("");
        $("#donateNoCheckResult").hide();
    });
      
  
    

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


// 카테고리, 도시 입력, 날짜 초기화
function resetFilters() {
    $(".donateInput, .phoneInput").val("");
  }



