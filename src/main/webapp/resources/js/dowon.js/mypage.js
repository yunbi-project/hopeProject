// 모든 .heartBtn 요소를 가져옵니다.
const heartButtons = document.querySelectorAll(".heartBtn");

// 각각의 버튼에 대해 반복하여 이벤트 리스너를 추가합니다.
heartButtons.forEach(function(button) {
    // 버튼의 초기 상태를 설정합니다.
    button.innerHTML = '<i class="xi-heart xi-2x"></i>';
    button.style.color = 'red'; // 빨간색으로 설정
    button.classList.add('liked'); // liked 클래스 추가

    // 클릭 이벤트 리스너를 추가합니다.
    button.addEventListener('click', function() {
        // 현재 클릭된 버튼의 상태를 확인합니다.
        const isLiked = button.classList.contains('liked');
        
        // 현재 상태에 따라 버튼을 업데이트합니다.
        if (isLiked) {
            // 이미 좋아요 상태인 경우, 빈 하트로 변경
            button.innerHTML = '<i class="xi-heart-o xi-2x"></i>';
            button.style.color = ''; // 색상 제거
            button.classList.remove('liked'); // liked 클래스 제거

            // 부모 요소인 .row를 찾아 삭제합니다.
            const rowElement = button.closest('.row');
            if (rowElement) {
                rowElement.remove();
            }
        } else {
            // 좋아요 상태가 아닌 경우, 빨간색 하트로 변경
            button.innerHTML = '<i class="xi-heart xi-2x"></i>';
            button.style.color = 'red'; // 색상 추가
            button.classList.add('liked'); // liked 클래스 추가
        }
    });
});




document.addEventListener("DOMContentLoaded", function() {
    // 기부 탭 클릭 시
    document.getElementById('donation-tab').addEventListener('click', function() {
        showContent('donation');
    });

    // 봉사활동 탭 클릭 시
    document.getElementById('volunteer-tab').addEventListener('click', function() {
        showContent('volunteer');
    });

    // 즐겨찾기 탭 클릭 시
    document.getElementById('bookmark-tab').addEventListener('click', function() {
        showContent('bookmark');
    });

    // 초기에 기부 탭 내용을 보이도록 설정
    showContent('donation');

    function showContent(tabName) {
        // 모든 탭 숨기기
        const tabContents = document.querySelectorAll('.div-donation-content, .div-volunteer-content, .div-bookmark-content');
        tabContents.forEach(function(content) {
            content.style.position = 'absolute'; // 모든 탭의 위치를 화면 밖으로 이동
            content.style.left = '-9999px'; // 화면 왼쪽 밖으로 이동
            content.style.top = '-9999px'; // 화면 위쪽 밖으로 이동
        });

        // 선택한 탭의 내용 보이기
        const selectedContent = document.querySelector('.div-' + tabName + '-content');
        selectedContent.style.position = 'static'; // 선택한 탭의 위치를 원래 위치로 변경
    }
});

function redirectToEditPage() {
        // 내정보 변경 페이지로 이동
        window.location.href = '/hope/editprofile';
    }
