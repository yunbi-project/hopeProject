<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/style/css/sangjun.css/SFAQList.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <main>
   <div class="Sn-wrapper1">
        <div class="Sn-wrapper2">
            <div>
                <div>
                    <div>
                        <div class="Sn-TextLabel" >공지사항</div>
                    </div>
                </div>
            </div>
            
          
            <header class="entry-header">
                <h1 class="entry-title">
                    [기한연장] 2024 아름다운함께서기 – 청년인턴십 6기 참여자 모집(~2/18)
                </h1>
                <div class="entry-meta">
                  <div class="detail-date">등록일</div>
                  <div class="detail-date-">2023.12.23</div>
                  <div>조회수</div>
                  <div>3</div>
                </div>
                <div class="entry-meta">
                    <div class="detail-date">작성자</div>
                    <div class="detail-date-">관리자</div>
                  </div>                 
            </header>
            <div>
                <div class="attachment">
                    <div>첨부파일</div>
                    <div> adsfkl;adf.jpg</div>
                    
                </div>
            </div>
       
        <section class="entry-content">
            <textarea class="detail-content" readonly="readonly">
            오늘부터우리는
                오늘부터우니르니아ㅣㄴ아다노아아니asdffffffffffffffffffff
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                f
                
                f
                f
                f
                f
                f
                f
                아
                s
                a
                d
                f
                
                f
                f
                f
                ffffffffffffffffffffffffffffff로하아니아추아ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
            </textarea>

        </section>
        <div class="reply-insert">           
            <div class="comment-section">
                <textarea class="form-control comment-input" name="replyContent" id="replyContent" rows="2" cols="55" style="resize: none; width: 100%;" placeholder="댓글을 입력하세요..."></textarea>
                <button class="btn btn-secondary comment-button" onclick="insertReply();">등록하기</button>
            </div>
            <div class="comment-list">
                <h3>댓글 (<span id="rcount">0</span>)</h3>
                <table id="replyArea" class="table">
                    
                    <tbody>
                        <!-- 여기에 동적으로 댓글이 추가될 예정입니다. -->
                        <tr>
                            <td>John Doe</td>
                            <td>This is a comment.</td>
                            <td>2024-02-15</td>
                            <td><button>수정</button>
                                <button>삭제</button>
                            </td>
                       </tr>
                       <tr>
                        <td>John Doe</td>
                        <td>This is a comment.</td>
                        <td>2024-02-15</td>
                        <td><button>수정</button>
                            <button>삭제</button>
                        </td>
                   </tr>
                   <tr>
                    <td>John Doe</td>
                    <td>This is a comment.</td>
                    <td>2024-02-15</td>
                    <td><button>수정</button>
                        <button>삭제</button>
                    </td>
               </tr>
               <tr>
                <td>John Doe</td>
                <td>This is a comment.</td>
                <td>2024-02-15</td>
                <td><button>수정</button>
                    <button>삭제</button>
                </td>
           </tr>    <tr>
            <td>John Doe</td>
            <td>This is a comment.</td>
            <td>2024-02-15</td>
            <td><button>수정</button>
                <button>삭제</button>
            </td>
       </tr>
       
                    </tbody>
                </table>
            </div>
               
        </div>
        <div class="btn-group">
            <div class="login-detail-btn">                
                <button class="delete-btn">삭제</button>
                <button class="modify-btn">수정</button>                
             </div>
             <div class="detail-btn">                
                <button class="list-btn">목록</button>                
             </div>

        </div>
       </div>
    </div>
 
  </main>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>