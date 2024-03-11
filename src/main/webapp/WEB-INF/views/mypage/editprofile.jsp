<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page import="java.util.StringTokenizer" %>s
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<!-- css -->
<link rel="stylesheet"
	href="resources/style/css/dowon.css/editprofile.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<c:choose>
		<c:when test="${empty loginUser}">
			<!-- 로그인 하지 않을 경우 -->
			<script>
				alert("로그인이 필요합니다.");
				window.location.href = "${contextPath}/login"; // 로그인 페이지로 이동하도록 설정할 수 있습니다.
			</script>
		</c:when>
		<c:otherwise>

			<section class="modify-area">
				<h2 style="margin-top:50px;">내 정보 변경</h2>
					<form action="editprofile" method="post">
						<div class="form-group1">
							<p class="modify-p">이름 <span class="valid">다른 유저와 겹치지 않도록 입력해주세요. (2~20자)</span></p>
							<input type="text" class="edit" id="name" placeholder="이름을 입력해주세요." name="userName" value="${loginUser.userName}" required>
						</div>
						<div class="form-group1">
							<p class="modify-p">전화번호 <span class="valid">'-'를 제외하고 숫자만 입력해주세요.</span></p>
							<input type="text" class="edit" id="phone" placeholder="-빼고 입력해주세요." name="phone" value="${loginUser.phone}" required>
						</div>
						<div class="form-group1">
							<p class="modify-p">주소 <span class="valid">우편번호 찾기를 이용해 정확한 주소를 입력해주세요.</span></p>
							<input type="text" class="edit" id="address" name="address" placeholder="주소" value="${loginUser.address.split(',')[0]}" required>
							<input type="text" class="edit" id="postcode" name="postcode" placeholder="우편번호" required value="${loginUser.address.split(',')[1]}">
							<input type="text" class="edit" id="detailAddress" name="detailAddress" placeholder="상세주소" required value="${loginUser.address.split(',')[2]}">
						</div>

						<button id="openAddressPopup" type="button" class="form_btn"
							onclick="execDaumPostcode()">우편번호 찾기</button>

						<div class="form-group">
							<input type="submit" value="저장">
						</div>
					</form>
			</section>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById('address').value = data.address;
					document.getElementById('detailAddress').focus();
				}
			}).open();
		}
	</script>

</body>
</html>
