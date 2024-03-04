<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link rel="stylesheet" href="./resources/style/css/hyun.css/mainPage.css">
   
   
    <!-- 슬라이드바 -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   
    <script src="./resources/js/hyun.js/mainPage.js"></script>

    <!-- 다중 슬라이드바 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main>
        <section id="wrapper">
            <div id="slider-wrap">
                <ul id="slider">
                   <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">CAMPAIGN</h3><br>
                            <div style="border: 4px solid rgb(157, 222, 60); width: 80px;"></div><br>
                            <span>희망의 세상은 그냥 만들어지지 않으니까</span>
                            <h3 style="margin-top: 10px;">희망의 조각</h3>
                            <button class="h_slider_btn">자세히 보기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>
                        <img class="slick-slide" src="https://www.v1365.or.kr/new/img/qna/02_top.jpg">
                   </li>

                    <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">DONATION</h3><br>
                            <div style="border: 4px solid rgb(117, 173, 34); width: 80px;"></div><br>
                            <span>나와 우리 그리고 지구를 위한</span>
                            <h3 style="margin-top: 10px;">물품기부</h3>
                            <button  class="h_slider_btn">물품기부 참여하기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>                
                        <img class="slick-slide"  src="https://t1.daumcdn.net/cfile/tistory/27710E3856DD248E35">
                    </li>
                   
                   <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">CAMPAIGN</h3><br>
                            <div style="border: 4px solid rgb(117, 173, 34); width: 80px;"></div><br>
                            <span>자립준비 청년의 내일을 응원해주세요</span>
                            <h3 style="margin-top: 10px;">희망의 함께서기</h3>
                            <button class="h_slider_btn">자세히 보기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>
                        <img class="slick-slide"  src="https://www.beautifulstore.org/wp-content/uploads/2020/08/%EC%A0%9C%EB%AA%A9-%EC%97%86%EC%9D%8C-1-5.png">
                   </li>
                   
                   <li>
                        <div style="margin-left: 100px;">
                            <h3 class="h_slider_Title">VOLUNTEER</h3><br>
                            <div style="border: 4px solid rgb(117, 173, 34); width: 80px;"></div><br>
                            <span>나와 세상을 밝히는 시간</span>
                            <h3 style="margin-top: 10px;">희망의 조각 자원봉사</h3>
                            <button class="h_slider_btn">바로가기<img class="h_slider_img" src="https://cdn-icons-png.flaticon.com/128/6423/6423875.png"></button>
                        </div>
                        <img class="slick-slide"  src="https://www.1365.go.kr/upload/attachments/5615109e-83da-4827-8c8b-d0dbe11827db.png">
                   </li>

                </ul>
               
                 <!--controls-->
                <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
                <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
                <div id="counter"></div>
               
                <div id="pagination-wrap">
                    <ul>
                    </ul>
                </div>
                <!--controls-->  
                       
            </div>
        </section>

        <!-- //visual -->
        <section class="overlap-group">
            <div class="h_rectangle-3" ></div>
            <p class="p">&#34; 모두가 함께하는 나눔과 순환의 희망의 조각 만들기 &#34;</p>
            <div class="h_rectangle-4" ></div>
            <div class="h_group">
                <div class="h_overlap-group-2">
                    <img class="h_line-6" src="https://www.beautifulstore.org/wp-content/themes/bs/images/meta/img_slogan11.png" >
                </div>
            </div>
            <div class="h_overlap-wrapper">
                <div class="h_overlap-2">
                    <img class="h_line-8"  src="https://www.beautifulstore.org/wp-content/themes/bs/images/meta/img_slogan22.png" >
                </div>
            </div>
            <div class="h_overlap-group-wrapper">
                <div class="h_overlap-3">
                    <img class="h_line-10"  src="https://www.beautifulstore.org/wp-content/themes/bs/images/meta/img_slogan33.png" >
                </div>
            </div>
            <div class="h_text-wrapper-17">자원재순환</div>
            <div class="h_text-wrapper-18">참여문화</div>
            <div class="h_text-wrapper-19">국내·외 지원</div>
            <p class="h_text-wrapper-20">일상의 나눔과 자원의 재순환을 통해 세상의 생명을 연장합니다.</p>
            <p class="h_text-wrapper-21">물품기부, 후원, 봉사 등 다양한 참여로 나눔의 가치를 전파합니다.</p>
            <p class="h_text-wrapper-22">소외된 이웃과 사회를 위한 나눔으로 세상을 긍정적으로 변화시킵니다.</p>
          </section>

          <!-- 지금껏 후원한 사람들-->
        <section>
            <div class="donation_people">
                <p class="h_div-2">
                  <span class="h_span">희망의 조각</span>
                  <span class="h_text-wrapper-23">
                    은 국내 대표 비영리공익재단으로 우리 사회의 생태적, 친환경적 변화에 기여하고 국내외 소외계층 및 공익활동을
                    지원하며 시민의식 성장과 풀뿌리공동체 발전을 위해 노력합니다.
                  </span>
                </p>
                <p class="h_text-wrapper-24">지금까지 희망의 조각에는 여러분의 많은 참여와 후원이 있었습니다.</p>
                <div class="h_text-wrapper-25">마음을 나누어주신 든든한 후원자님</div>
                <div class="h_text-wrapper-26">
                  많은 이들의 힘을 주신
                  <br>
                  자원활동가님
                </div>
                <div class="h_text-wrapper-27">0 명</div>
                <div class="h_text-wrapper-28">0 명</div>
                <p class="h_div-3">
                  <span class="h_text-wrapper-29">투명하고 믿을 수 있는 </span>
                  <span class="h_text-wrapper-30">희망의 조각</span>
                  <span class="h_text-wrapper-29"> 재단</span>
                </p>
            </div>
        </section>


        <!-- 나눔 소식 -->
        <section>
            <article class="shareNews">
                <span class="h_titleLine"></span>
                <span class="h_shareNewsTitle"><a>나눔소식</a></span>
                <img class="h_shaerNews_arrow" src="./resources/style/img/mainPage/화살표.png">
                <span class="shareNews_more">더보기</span>
                <div class="h_overlap-5">
                    <img class="h_image-4" alt="Image" src="https://m.sc.or.kr/webPub/sc_2018_mobile/images/support/spp-sub8-img2.jpg" >
                    <div class="h_rectangle-7" ></div>
                    <div class="h_text-wrapper-34">무엇이 가장 먼저 보이나요?</div>
                    <div class="h_line-16" ></div>
                    <button class="h_text-wrapper-35">지금 보러가기</button>
                    <p class="h_element">
                      손가락 4개로 살면서 겪었던 깊은 상처의 기억을
                      가진 그녀는 지금 어떻게 살아가고 있을까요?
                    </p>
                </div>
            </article>
            <article class="shareNews1">
                <div class="h_overlap-5_1">
                    <img class="h_image-4_1" alt="Image" src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg" >
                    <div class="h_rectangle-7_1" ></div>
                    <div class="h_text-wrapper-34_1">무엇이 가장 먼저 보이나요?</div>
                    <div class="h_line-16_1" ></div>
                    <button class="h_text-wrapper-35_1">지금 보러가기</button>
                    <p class="h_element_1">
                      손가락 4개로 살면서 겪었던 깊은 상처의 기억을
                      가진 그녀는 지금 어떻게 살아가고 있을까요?
                    </p>
                </div>
            </article>
        </section>

        <!-- 함께하는 나눔 프로젝트 -->
        <section>
            <article class="sharingProject">
                <span class="h_titleLine"></span>
                <span class="h_sharingProjectTitle"><a>함께하는 나눔 프로젝트</a></span>
                <img class="h_shaerNews_arrow" src="./resources/style/img/mainPage/화살표.png">
                <span class="sharingProjec_more">더보기</span>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div>
                                <img src="https://www.shippersjournal.com/data/photos/20160207/art_1455677629.jpg">
                                <div class="h_donation_container">
                                    <div>
                                        <span>2024 청소년 보호사업</span>
                                    </div>
                                    <div>
                                        <progress
                                        class="progress"
                                        id="progress"
                                        value="50"
                                        min="0"
                                        max="100"
                                      ></progress>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0%</a> 달성</span>
                                        <span><a class="h_donation">63일</a> 남았어요.</span>
                                    </div>
                                    <div>
                                        <span><a class="h_donation">0</a>원</span>
                                        <span>5,000,000원</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <!-- 네비게이션 -->
                    <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                    <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
               
                    <!-- 페이징 -->
                    <div class="swiper-pagination"></div>
                </div>
            </article>
        </section>
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
    <script>
        // 광고 배너 JS
        var pos = 0;
        var totalSlides = $('#slider-wrap ul li').length;
        var sliderWidth = $('#slider-wrap').width();


        $(document).ready(function(){  
            /*****************
             BUILD THE SLIDER
            *****************/
            //set width to be 'x' times the number of slides
            $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
           
                //next slide  
            $('#next').click(function(){
                slideRight();
            });
           
            //previous slide
            $('#previous').click(function(){
                slideLeft();
            });
           
            /*************************
             //*> OPTIONAL SETTINGS
            ************************/
            //automatic slider
            var autoSlider = setInterval(slideRight, 3000);
           
            //for each slide
            $.each($('#slider-wrap ul li'), function() {

                //create a pagination
                var li = document.createElement('li');
                $('#pagination-wrap ul').append(li);    
            });
           
            //counter
            countSlides();
           
            //pagination
            pagination();
           
            //hide/show controls/btns when hover
            //pause automatic slide when hover
            $('#slider-wrap').hover(
                function(){ $(this).addClass('active'); clearInterval(autoSlider); },
                function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
            );

            // 클릭한 슬라이드로 이동하는 이벤트
            $('#pagination-wrap ul li').click(function() {
                // 클릭한 슬라이드의 인덱스 가져오기
                var clickedIndex = $(this).index();
               
                // 현재 슬라이드의 인덱스와 클릭한 슬라이드의 인덱스 비교
                if (clickedIndex !== pos) {
                    // 클릭한 슬라이드로 이동
                    pos = clickedIndex;
                    $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));
                   
                    // 슬라이드 번호 업데이트
                    countSlides();
                    pagination();
                }
            });
        });//DOCUMENT READY

        /***********
         SLIDE LEFT
        ************/
        function slideLeft(){
            pos--;
            if(pos==-1){ pos = totalSlides-1; }
            $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
       
            //*> optional
            countSlides();
            pagination();
        }

        /************
         SLIDE RIGHT
        *************/
        function slideRight(){
            pos++;
            if(pos==totalSlides){ pos = 0; }
            $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));
       
            //*> optional
            countSlides();
            pagination();
        }
       
        /************************
         //*> OPTIONAL SETTINGS
        ************************/
        function countSlides(){
            $('#counter').html(pos+1 + ' / ' + totalSlides);
        }

        function pagination(){
            $('#pagination-wrap ul li').removeClass('active');
            $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
        }
        
        
        // 명수 자동 증가
        function countUp(targetElement, start, end, duration) {
            let current = start;
            const range = end - start;
            const increment = end > start ? 1 : -1;
            const stepTime = Math.abs(Math.floor(duration / range));
            const element = document.querySelector(targetElement);
            const timer = setInterval(() => {
              current += increment;
              element.innerHTML = current.toLocaleString() + ' 명';
              if (current === end) {
                clearInterval(timer);
              }
            }, stepTime);
          }

          // 사용 예시
          countUp('.h_text-wrapper-27', 0, 1000, 50000); // 3초 동안 0부터 11000까지 증가
          countUp('.h_text-wrapper-28', 0, 1000, 50000); // 3초 동안 0부터 11000까지 증가


    </script>
</body>
</html>