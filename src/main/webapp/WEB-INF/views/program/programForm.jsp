<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="../resources/js/yunbi.js/yProgramDonate.js"></script>
<link rel="stylesheet" href="../resources/style/css/yunbi.css/yProgramDonate.css">
<link rel="stylesheet" href="../resources/style/css/common.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<section>
        <article class="h_boardTitle">
            <h1>자원봉사</h1>
            <p>자원봉사 함께 나아가는 더 나은 세상.</p>
        </article>
    </section>
<section>
                <form action="${contextPath}/program/insert" method="post" class="y_program_detail">
                    <table class="y_table">
                        <tr>
                            <td>제목</td>
                            <td><input name="programName" class="donateInput" type="text" placeholder="제목을 입력하세요"></td>
                        </tr>
                        <tr>
                            <td>봉사 기간</td>
                            <td>시작일 : <input name="programActivityStartDate" class="donateInput" type="date"> - 종료일 : <input name="programActivityEndDate" class="donateInput" type="date"></td>
                        </tr>
                        <tr>
                            <td>봉사 시간</td>
                            <td>
                            		<select name="activityTime" class="donateInput y_c">
                            			<option value="오전">오전</option>
                            			<option value="오후">오후</option>
                            		</select>
                            </td>
                        </tr>
                        <tr>
                            <td>모집 기간</td>
                            <td><input name="programEnrollEndDate" class="donateInput" type="date">까지</td>
                        </tr>
                        <tr>
                            <td>활동 주간 유형</td>
                            <td>
                            		<select name="activityDays" class="donateInput y_c">
                            			<option value="평일">평일</option>
                            			<option value="주말">주말</option>
                            		</select>
                            </td>
                        </tr>
                        <tr>
                            <td>모집 인원</td>
                            <td><input name="programCapacity" class="donateInput" type="text" placeholder="숫자만 입력해주세요"></td>
                        </tr>
                        <tr>
                            <td>봉사 장소</td>
                            <td><input name="activityLocation" class="donateInput" type="text" placeholder="시/도를 포함해주세요"></td>
                        </tr>
                        <tr>
                            <td>봉사 유형</td>
                            <td>
                            		<select name="activityType" class="donateInput y_c">
                            			<option value="정기">정기</option>
                            			<option value="일시">일시</option>
                            		</select>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
             				<td>
             				 	<textarea id="summernote" name="programContent"></textarea></td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td><input type="file"></td>
                        </tr>
                    </table>
                    <div class="y_donate_back_btn">
                        <button class="y_program_btn1" type="submit">작성</button>
                        <button class="y_donate_back_btn1" href="${contextPath}/program/list">목록</button>
                    </div>
                </form>
            </section>
            <script>
				        $(document).ready(function() {
				
				            $('#summernote').summernote({
				                height: 500,
				                minHeight: 500,
				                maxHeight: 500,
				                focus: false,
				                lang: "ko-KR",
				                placeholder: '최대 2048자까지 쓸 수 있습니다'
				            });
				        });
				
			</script>
     <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script src="./resources/summernote/js/summernote-lite.js"></script>
<script src="./resources/summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
</html>