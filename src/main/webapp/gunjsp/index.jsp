<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div id="container">
		<header>
			<div id="header-container">
				<h2>Menu</h2>
			</div>
			
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                    <img src="${pageContext.request.contextPath}/resources/images/logo-spring.png" alt="스프링로고" width="50px" />
            </a>
            <!-- 반응형으로 width 줄어들경우, collapse 버튼관련 -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
            </div>
        </nav>
			
		</header>
		
		<section id='content'>
			<div id='menu-container' class='text-center'>
				
				<div class='menu-test'>
					<h4>전체메뉴조회기능(GET)</h4>
					<input type='button' class='btn btn-block btn-outline-success btn-send'
								id='btn-menus' value="전송">								
				</div>
				
				<div id="menus-result" class='result'></div>
			
				<script>
					function displayResultTable(id , data){
						
						const container = $("#"+id);
						
						let html = "<table class='table'>";
							html+= "<tr><th>번호</th><th>음식점</th><th>메뉴</th><th>가격</th><th>타입</th><th>맛</th></tr>";
							
						if(data.length > 0) {
							$(data).each( (index , menu) => {
								
								const {id, restaurant, name, price, type, taste} = menu;
								html += `<tr>
												<td>\${id}</td>
												<td>\${restaurant}</td>
												<td>\${name}</td>
												<td>\${price}</td>
												<td>\${type}</td>
												<td>\${taste}</td>
											</tr>`;
							})
						}else {
							html += "<tr><td colspan='6'>검색결과가 없습니다.</td></tr>"
						}
						
						html += "</table>";
						container.html(html);
					}
					$("#btn-menus").click(()=> {
						$.ajax({
							url : '${contextPath}/menus' ,
							method : "get" ,
							success : (data) => {
								displayResultTable("menus-result" , data);
							},
							error : (error, req, res) => {
								console.log(error,req,res)
							}
						})
					})
				</script>
				
				<!--  2. GET / menus/kr, /menus/jp, /menus/ch  -->
				<div class="menu-test">
                <h4>추천메뉴(GET)</h4>
	                <form id="menuRecommendationFrm">
		                    <div class="form-check form-check-inline">
		                        <input type="radio" class="form-check-input" name="type" id="get-no-type" value="all" checked>
		                        <label for="get-no-type" class="form-check-label">모두</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="type" id="get-kr" value="kr">
		                        <label for="get-kr" class="form-check-label">한식</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="type" id="get-ch" value="ch">
		                        <label for="get-ch" class="form-check-label">중식</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="type" id="get-jp" value="jp">
		                        <label for="get-jp" class="form-check-label">일식</label>&nbsp;
		                    </div>
		                    <br />
		                    <div class="form-check form-check-inline">
		                        <input type="radio" class="form-check-input" name="taste" id="get-no-taste" value="all" checked>
		                        <label for="get-no-taste" class="form-check-label">모두</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="taste" id="get-hot" value="hot">
		                        <label for="get-hot" class="form-check-label">매운맛</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="taste" id="get-mild" value="mild">
		                        <label for="get-mild" class="form-check-label">순한맛</label>
		                    </div>
		                    <br />
		                    <input type="submit" class="btn btn-block btn-outline-success btn-send" value="전송" >
	                </form>
            </div>
            	<div class="result" id="menuRecommendation-result"></div>
            	<script>
            		$("#menuRecommendationFrm").submit( function (e){
            			e.preventDefault();
            			
            			const $frm =$(e.target);
            			const type = $frm.find("[name=type]:checked").val();	// sp, ch.. 등등
            			const taste = $frm.find("[name=taste]:checked").val();
            			
            			$.ajax({
            				url : `${contextPath}/menus/\${type}/\${taste}` ,
            				success : function(data) {
            					displayResultTable("menuRecommendation-result", data);
            				}
            			})
            		})
            	</script>
			</div>
			
			<!--  2. POST  -->
			<div class="menu-test">
	                <h4>메뉴 등록하기(POST)</h4>
		                <form id="menuEnrollFrm">
		                    <input type="text" name="restaurant" placeholder="음식점" class="form-control" />
		                    <br />
		                    <input type="text" name="name" placeholder="메뉴" class="form-control" />
		                    <br />
		                    <input type="number" name="price" placeholder="가격" class="form-control" />
		                    <br />
		                    <div class="form-check form-check-inline">
		                        <input type="radio" class="form-check-input" name="type" id="post-kr" value="kr" checked>
		                        <label for="post-kr" class="form-check-label">한식</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="type" id="post-ch" value="ch">
		                        <label for="post-ch" class="form-check-label">중식</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="type" id="post-jp" value="jp">
		                        <label for="post-jp" class="form-check-label">일식</label>&nbsp;
		                    </div>
		                    <br />
		                    <div class="form-check form-check-inline">
		                        <input type="radio" class="form-check-input" name="taste" id="post-hot" value="hot" checked>
		                        <label for="post-hot" class="form-check-label">매운맛</label>&nbsp;
		                        <input type="radio" class="form-check-input" name="taste" id="post-mild" value="mild">
		                        <label for="post-mild" class="form-check-label">순한맛</label>
		                    </div>
		                    <br />
		                    <input type="submit" class="btn btn-block btn-outline-success btn-send" value="등록" >
		                </form>
               </div>
               <script>
               		$("#menuEnrollFrm").submit( e => {
               			e.preventDefault();
               			
               			const $frm = $(e.target);
               			
               			const restaurant = $frm.find("[name=restaurant]:checked").val();
               			const name = $frm.find("[name=name]:checked").val();
               			const price = $frm.find("[name=price]:checked").val();
               			const type = $frm.find("[name=type]:checked").val();
               			const taste = $frm.find("[name=taste]:checked").val();
               			
               			const menu = {
               					restaurant ,
               					name ,
               					price  ,
               					type  ,
               					taste 
               			};
               			
               			$.ajax({
               				url : '${contextPath}/menu' ,
               				data : JSON.stringify(menu) ,
               				contentType : "application/json; charset=UTF-8" ,
               				method : 'post' ,
               				success : function(data) {
               					console.log(data)			
               				},
               				error : console.log , 
               				complete() {
               					e.target.reset();
               				}
               			});
               			
               		})

				</script>
			
			<!--  3. PUT
					/menu/9
			 -->
				 			<div class="menu-test">
	                <h4>메뉴 수정하기(PUT)</h4>
	                <p>메뉴번호를 사용해 해당메뉴정보를 수정함.</p>
	                
	                <form id="menuSearchFrm">
	                    <input type="text" name="id" placeholder="메뉴번호" class="form-control" /><br />
	                    <input type="submit" class="btn btn-block btn-outline-primary btn-send" value="검색" >
	                </form>
	                
	                
	                <hr />
	                <form id="menuUpdateFrm">
	                    <input type="hidden" name="id" />
	                    <input type="text" name="restaurant" placeholder="음식점" class="form-control" />
	                    <br />
	                    <input type="text" name="name" placeholder="메뉴" class="form-control" />
	                    <br />
	                    <input type="number" name="price" placeholder="가격" step="1000" class="form-control" />
	                    <br />
	                    <div class="form-check form-check-inline">
	                        <input type="radio" class="form-check-input" name="type" id="put-kr" value="kr" checked>
	                        <label for="put-kr" class="form-check-label">한식</label>&nbsp;
	                        <input type="radio" class="form-check-input" name="type" id="put-ch" value="ch">
	                        <label for="put-ch" class="form-check-label">중식</label>&nbsp;
	                        <input type="radio" class="form-check-input" name="type" id="put-jp" value="jp">
	                        <label for="put-jp" class="form-check-label">일식</label>&nbsp;
	                    </div>
	                    <br />
	                    <div class="form-check form-check-inline">
	                        <input type="radio" class="form-check-input" name="taste" id="put-hot" value="hot" checked>
	                        <label for="put-hot" class="form-check-label">매운맛</label>&nbsp;
	                        <input type="radio" class="form-check-input" name="taste" id="put-mild" value="mild">
	                        <label for="put-mild" class="form-check-label">순한맛</label>
	                    </div>
	                    <br />
	                    <input type="submit" class="btn btn-block btn-outline-success btn-send" value="수정" >
	                </form>
	            </div>
	            
	            <script>
	            // 검색
	            	$("#menuSearchFrm").submit(function(e) {
	            		e.preventDefault();
	            		
	            		const id = $("[name=id]" , e.target).val(); // e.target 하위의 요소 선택
	            		if(!id) return;
	            		
	            		$.ajax({
	            			url : `${contextPath}/menu/\${id}` ,
	            			success : function(data) {
	            				
	            				const frm = $("#menuUpdateFrm");
	            				
	            				const {id, restaurant, name, price, type, taste} = data;
	            				
	            				frm.find("[name=id]").val(id);
	            				frm.find("[name=restaurant]").val(restaurant);
	            				frm.find("[name=name]").val(name);
	            				frm.find("[name=price]").val(price);
	            				frm.find(`[name=type][value=\${type}]`).prop("checked" , true);
	            				frm.find(`[name=taste][value=\${taste}]`).prop("checked" , true);
	            				
	            			},
	            			error : function(xhr){
	            				const {status} = xhr; // 404 200 400 500
	            				if(status == 404) {
	            					alert("해당 메뉴가 존재하지 않습니다.");
	            				}
	            			}
	            		})
	            	})
	            	
	            	// 수정
	            	$("#menuUpdateFrm").submit( e => {
	            		e.preventDefault();
	            		
	            		const frm = $(e.target);
	            		
	            		const frmData = new FormData(e.target);
	            		const menu = {};
	            		
	            		frmData.forEach((value, key) => {
	            			// key ==> id, price, type, taste 각 인풋태그의 name 속성값이 담겨있음
	            			menu[key] = value;
	            		})
	            		
	            		$.ajax({
	            			url : `${contextPath}/menu/\${menu.id}` ,
	            			method : 'PUT' , // UPDATE 의미
	            			data : JSON.stringify(menu) ,
	            			contentType : "application/json; charset=UTF-8" ,
	            			success(data){
	            				const {msg} = data;
	            				alert(msg);
	            			},
	            			error : console.log ,
	            			complete(){
	            				$("#menuUpdateFrm")[0].reset();
	            			}
	            		})
	            	})
	            </script>
			
			
			<!--  4. DELETE  전송방식 : 'DELETE'로 요청
					메뉴 삭제 성공시 => 메뉴 삭제에 성공했습니다.
						    실패시 => 메뉴가 존재하지 않습니다.
					-->
			
			<div class="menu-test">
                <h4>메뉴 삭제하기(DELETE)</h4>
                <p>메뉴번호를 사용해 해당메뉴정보를 삭제함.</p>
                <form id="menuDeleteFrm">
                    <input type="text" name="id" placeholder="메뉴번호" class="form-control" /><br />
                    <input type="submit" class="btn btn-block btn-outline-danger btn-send" value="삭제" >
                </form>
                
                </div>
                <script >
                $("#menuDeleteFrm").submit( function(e) {
                	e.preventDefault();
                	
                	const id = $("[name=id]" , e.target).val(); 
                	
                	if(!id) return;
                	
                	$.ajax({
                		url : `${contextPath}/menu/\${id}`,
                		method : 'delete' ,
                		success : function(data) {
                			const {msg} = data;
                			alert(msg);
                		},
                		error : function(xhr) {
                			const {status} = xhr; // 200, 400, 500
                			if(status == 404) {
                				alert('해당메뉴가 존재하지 않습니다.')
                			}else {
                				alert('메뉴 삭제 실패');
                			}
                		},
                		complete() {
                			$(e.target)[0].reset();
                		}
                	});
                	
                })
                
                </script>
		</section>
	</div>
	
</body>
</html>