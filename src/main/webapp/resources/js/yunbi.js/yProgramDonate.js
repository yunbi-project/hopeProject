function toggleUnlike() {
    let unlikes = {
        //userNo: '${loginUser.userNo}',
        programNo: '${programNo}'
    };
    $.ajax({
        url: '${contextPath}/program/unlike/' + unlikes.programNo, // 좋아요 취소하는 요청을 보내는 URL
        data: JSON.stringify(unlikes),
        type: 'post',
        contentType: 'application/json;charset=UTF-8',
        success: function() {
            // 좋아요가 취소되었을 때 수행할 작업 추가
            alert('찜한 봉사활동이 취소되었습니다.');
        }
    })
}

// 프로그래스 바의 value 값을 서서히 증가시키는 함수
function animateProgress() {
    var progressBar = document.getElementById('progress');
    var value = 0;
    var interval = 20; // 갱신 간격 (밀리초)
    var targetValue = progressBar.getAttribute('value'); // 프로그래스 바의 목표 값

    // 목표 값까지 서서히 증가시키는 애니메이션
    var animation = setInterval(function() {
        value++;
        progressBar.value = value;
        if (value >= targetValue) {
            clearInterval(animation);
        }
    }, interval);
}

// 프로그래스 바의 애니메이션 시작
animateProgress();

