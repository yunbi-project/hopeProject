<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<!-- css -->
<link rel="stylesheet"
	href="resources/style/css/dowon.css/editprofile.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<c:choose>
		<c:when test="${empty loginUser}">
			<!-- 로그인 하지 않을 경우 -->
			<script>
				alert("로그인이 필요합니다.");
				window.location.href = "/login"; // 로그인 페이지로 이동하도록 설정할 수 있습니다.
			</script>
		</c:when>

		<c:otherwise>
			<div class="container">
				<h2>내 정보 변경</h2>
				<form action="editprofile" method="post">
					<div class="form-group">
						<label for="name">이름:</label> <input type="text" id="name"
							name="userName" required>
					</div>
					<div class="form-group">
						<label for="phone">핸드폰 번호:</label> <input type="text" id="phone"
							name="phone" placeholder="-빼고 입력해주세요." required>
					</div>
					<div class="form-group">
						<label for="address">주소:</label>
						<input type="text" id="postcode" name="postcode" placeholder="우편번호" required><br>
						<input type="text" id="address" name="address" placeholder="주소" required><br>
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" required><br>
						<button id="openAddressPopup" type="button" class="form_btn" onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>
					<div class="form-group">
						<input type="submit" value="저장">
					</div>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById('address').value = data.address;
                    document.getElementById('detailAddress').focus();
                }
            }).open();
        }
    </script>
</body>
</html>
