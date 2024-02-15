<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 만들기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="../resources/js/yunbi.js/yProgramDonate.js"></script>
<link rel="stylesheet" href="../resources/style/css/yunbi.css/yProgramDonate.css">
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
                <div class="y_program_detail">
                    <table class="y_table">
                        <tr>
                            <td>제목</td>
                            <td><input class="donateInput" type="text" placeholder="제목을 입력하세요"></td>
                        </tr>
                        <tr>
                            <td>봉사 기간</td>
                            <td>시작일 : <input class="donateInput" type="date"> - 종료일 : <input class="donateInput" type="date"></td>
                        </tr>
                        <tr>
                            <td>봉사 시간</td>
                            <td>
                            	<form method="post" action="insert" name="pinsert">
                            		<select name="time" class="donateInput y_c">
                            			<option value="오전">오전</option>
                            			<option value="오후">오후</option>
                            		</select>
                            	</form>
                            </td>
                        </tr>
                        <tr>
                            <td>모집 기간</td>
                            <td><input class="donateInput" type="date">까지</td>
                        </tr>
                        <tr>
                            <td>활동 주간 유형</td>
                            <td>
                            	<form action="#">
                            		<select name="days" class="donateInput y_c">
                            			<option value="평일">평일</option>
                            			<option value="주말">주말</option>
                            		</select>
                            	</form>
                            </td>
                        </tr>
                        <tr>
                            <td>모집 인원</td>
                            <td><input class="donateInput" type="text" placeholder="숫자만 입력해주세요"></td>
                        </tr>
                        <tr>
                            <td>봉사 장소</td>
                            <td><input class="donateInput" type="text" placeholder="시/도를 포함해주세요"></td>
                        </tr>
                        <tr>
                            <td>봉사 유형</td>
                            <td>
                            	<form action="#">
                            		<select name="type" class="donateInput y_c">
                            			<option value="정기">정기</option>
                            			<option value="일시">일시</option>
                            		</select>
                            	</form>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
             				<td>
             				 	<textarea id="summernote"></textarea></td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td><input type="file"></td>
                        </tr>
                    </table>
                    <div class="y_donate_back_btn">
                        <button class="y_program_btn1">작성</button>
                        <button class="y_donate_back_btn1">목록</button>
                    </div>
                </div>
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
				    <script >
            	$(".y_program_btn1").submit( e => {
            		e.preventDefault();
            		
            		//j쿼리로 선택한 태그
            		const $frm = $(e.target);
            		
            		const restaurant = $frm.find("[name=restaurant]").val();
            		const name = $frm.find("[name=name]").val();
            		const price = $frm.find("[name=price]").val();
            		const type = $frm.find("[name=type]:checked").val();
            		const taste = $frm.find("[name=taste]:checked").val();
            		
            		const menu = {
            				restaurant,	name, price, type, taste
            		};
            		
            		$.ajax({
            			url : '${contextPath}/program/insert',
            			data : JSON.stringify(p),
            			contentType : "application/json; charset=UTF-8",
            			method : "post",
            			success : function (data) {
            				console.log(data)
            			},
            			error : console.log,
            			complete(){
            				//에러든 성공이든 실행됨
            				e.target.reset();
            			}
            		})
            	})
            </script>
     <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script src="../resources/summernote/js/summernote-lite.js"></script>
<script src="../resources/summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/summernote/summernote-lite.css">
</html>