<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부하기 리스트</title>
<link rel="stylesheet" href="./resources/style/css/yunbi.css/yProgramDonate.css">
<script src="./resources/js/yunbi.js/yProgramDonate.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<section>
        <article class="h_boardTitle">
            <h1>기부하기</h1>
            <p>기부금을 통해 세상을 발전시킵니다.</p>
        </article>
    </section>
<section>
    <div class="y_donate_top1">
      <h1>기부하기</h1>
    </div>
    <div class="y_donate_top2">
      <span>진행중인 활동만</span>
      <img src='./resources/images/donate/check-circle.svg' onclick="toggleIng()" class="y_image_activityOnly no"/>
    </div>

<div class="y_list">
    <div class="y_list_box">
            <img src='./resources/style/img/sample1.png' class="y_list_image"></img>
              <span>식사해결이 어려운 어르신에게 사랑의 반찬 전달하기</span>
              <progress value="30" min="0" max="100" id="progress">value%</progress>
              <span>~ 2024.01.01</span>
              <span class="y_floatRight"> 100%</span>
    </div>
    <div class="y_list_box">
            <img src='./resources/style/img/sample1.png' class="y_list_image"></img>
              <span>식사해결이 어려운 어르신에게 사랑의 반찬 전달하기</span>
              <progress value="30" min="0" max="100" id="progress">value%</progress>
              <span>~ 2024.01.01</span>
              <span class="y_floatRight"> 100%</span>
    </div>
    <div class="y_list_box">
            <img src='./resources/style/img/sample1.png' class="y_list_image"></img>
              <span>식사해결이 어려운 어르신에게 사랑의 반찬 전달하기</span>
              <progress value="30" min="0" max="100" id="progress">value%</progress>
              <span>~ 2024.01.01</span>
              <span class="y_floatRight"> 100%</span>
    </div>
    <div class="y_list_box">
            <img src='./resources/style/img/sample1.png' class="y_list_image"></img>
              <span>식사해결이 어려운 어르신에게 사랑의 반찬 전달하기</span>
              <progress value="30" min="0" max="100" id="progress">value%</progress>
              <span>~ 2024.01.01</span>
              <span class="y_floatRight"> 100%</span>
    </div>
</div>
    
    </section>
    <<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>