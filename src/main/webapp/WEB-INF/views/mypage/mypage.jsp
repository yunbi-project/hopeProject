<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<link rel="stylesheet" href="resources/style/css/dowon.css/mypage.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<div class="d-div-wrapper">
		<div class="top-bar">
			<div class="rectangle"></div>
			<div class="title">기부,봉사활동, 즐겨찾기 내역 마이페이지</div>
		</div>

		<div class="section">
			<div class="avatar"></div>
			<div class="container">
				<div class="text-wrapper">임도원</div>
				<div class="selection"></div>
			</div>
		</div>

		<div class="navigation-wrapper">
			<div class="navigation">
				<div class="tab" id="donation-tab">기부</div>
				<div class="divider">|</div>
				<div class="tab" id="volunteer-tab">봉사활동</div>
				<div class="divider">|</div>
				<div class="tab" id="bookmark-tab">즐겨찾기</div>
			</div>
		</div>


		<div class="div-donation-content">

			<div class="title-4">기부활동</div>

			<div class="list">
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="icon">💸</div>
							</div>
						</div>
				<c:forEach var="m" items="${list}">
						<div class="frame-2">
							<div class="title-3">${m.productDate}</div>
							<div class="subtitle">${m.productAmount}</div>
						</div>
				</c:forEach>							
					</div>
				</div>
				
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="icon">💸</div>
							</div>
						</div>
						<div class="frame-2">
							<div class="title-3">2021년 07월 28일</div>
							<div class="subtitle">후원 금액: 500,000원</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="icon">💸</div>
							</div>
						</div>
						<div class="frame-2">
							<div class="title-3">2020년 12월 05일</div>
							<div class="subtitle">후원 금액: 100,000원</div>
						</div>
					</div>
				</div>
			</div>

		</div>


		<div class="div-volunteer-content">

			<div class="title-4">봉사활동</div>

			<div class="list">
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="icon-2">🤝</div>
							</div>
						</div>
						<div class="frame-2">
							<div class="title-3">2021년 10월 15일</div>
							<div class="subtitle">XXX 활동</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="icon-2">🤝</div>
							</div>
						</div>
						<div class="frame-2">
							<p class="title-3">2021년 07월 28일 ~ 2022년 07월 28일</p>
							<div class="subtitle">XXX 활동</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="article">

						<div class="image-container">
							<div class="frame">
								<div class="icon-2">🤝</div>
							</div>
						</div>

						<div class="frame-2">
							<div class="title-3">2020년 12월 05일</div>
							<div class="subtitle">XXX 활동</div>
						</div>
					</div>
				</div>
			</div>



		</div>


		<div class="div-bookmark-content">


			<div class="title-4">즐겨찾기</div>
			<div class="list">
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="overlap-group">
									<div class="icon-2">💛</div>
								</div>
							</div>
						</div>
						<div class="frame-2">
							<p class="title-3">
								모집기한<br />2021년 10월 15일 ~ 2021년 10월 30일
							</p>
							<div class="subtitle">즐겨찾기한 활동 제목</div>
						</div>
						<div>
							<button class="heartBtn" onclick="addLike()">
								<i class=" xi-heart-o xi-2x"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="frame">
								<div class="overlap-group">
									<div class="icon-2">💛</div>
								</div>
							</div>
						</div>
						<div class="frame-2">
							<p class="title-3">
								모집기한<br />2021년 07월 28일 ~ 2021년 08월 28일
							</p>
							<div class="subtitle">즐겨찾기한 활동 제목</div>
						</div>
						<div>
							<button class="heartBtn" onclick="addLike()">
								<i class=" xi-heart-o xi-2x"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="article">
						<div class="image-container">
							<div class="image-container">
								<div class="frame">
									<div class="overlap-group">
										<div class="icon-2">💛</div>
									</div>
								</div>
							</div>
						</div>
						<div class="frame-2">
							<p class="title-3">
								모집기한<br />2020년 12월 05일 ~ 2020년 12월 25일
							</p>
							<div class="subtitle">즐겨찾기한 활동 제목</div>
						</div>
						<div>
							<button class="heartBtn" onclick="addLike()">
								<i class=" xi-heart-o xi-2x"></i>
							</button>
						</div>
					</div>
				</div>
			</div>



		</div>
			<div class="component">
				<div class="page">
					<div class="num"><</div>
				</div>
				<div class="page">
					<div class="num">1</div>
				</div>
				<div class="page">
					<div class="num">2</div>
				</div>
				<div class="page">
					<div class="num">3</div>
				</div>
				<div class="page">
					<div class="num">4</div>
				</div>
				<div class="page">
					<div class="num">5</div>
				</div>
				<div class="page">
					<div class="num">></div>
				</div>
			</div>

		<script src="resources/js/dowon.js/mypage.js"></script>
</body>
</html>