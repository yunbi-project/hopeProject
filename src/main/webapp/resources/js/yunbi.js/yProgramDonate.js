// programDetail 좋아요, 안좋아요
function toggleLike() {
   let likeIcon = $(`.heart_logo`);

   if (likeIcon.hasClass("no")) { //좋아요 하지 않은 상태
		$('.heart_logo').attr('src','./resources/images/program/heart-fill.svg'); 
		alert('찜한 봉사활동은 마이페이지에서 확인 가능합니다.');
        likeIcon.addClass("yes");
        likeIcon.removeClass("no");
   } else { //좋아요 한 상태
   		$('.heart_logo').attr('src','./resources/images/program/heart.svg'); 
        likeIcon.removeClass("yes");
        likeIcon.addClass("no");
   }
}

/* programList*/
function filter() {
	$("input[name='activity_time']:checked").each(function(){
    if( $(this).is(":checked") == true ){
      var checkVal = $(this).val();
      console.log("미완성");
    }
});
}

function toggleIng() {
   let icon = $(`.y_image_activityOnly`);

   if (icon.hasClass("no")) { //좋아요 하지 않은 상태
		$('.y_image_activityOnly').attr('src','./resources/images/donate/check-circle-fill.svg'); 
		alert('임시 alert : 진행중인 활동 On');
        icon.addClass("yes");
        icon.removeClass("no");
   } else { //좋아요 한 상태
   		$('.y_image_activityOnly').attr('src','./resources/images/donate/check-circle.svg'); 
        icon.removeClass("yes");
        icon.addClass("no");
   }
}