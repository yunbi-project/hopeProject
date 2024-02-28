function toggleUnlike() {
    let unlikes = {
        userNo: '${userNo}',
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