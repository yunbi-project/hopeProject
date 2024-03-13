![메인](https://github.com/springbootProejct/hopeProject/assets/104418414/1ef608bb-a4ef-4a93-b943-0941763408b5)
# 😊 : 희망의 조각프로젝트 소개


---
##### 희망의 조각은 지역 기부를 활성화하고 사람들이 손쉽게 기부할 수 있는 플랫폼입니다.
이 플랫폼은 기부 사이트, 채팅방, 웹소켓을 이용한 실시간 소통, 게시판, 소셜 로그인, 시큐리티, 관리자 페이지 등의 기능을 제공합니다. 사용자들은 희망의 조각을 통해 다양한 사람들과 소통하고 지역사회에 기여할 수 있습니다.
## 👏 : 팀원 구성
---
- 박건욱
- 임도원
- 박상준
- 이현영
- 박윤비

## 🐱‍🏍 : 개발환경
- Front : HTML, JavaScript , Css , Jsp, Ajax
- Back-end : SpringBoot3 , JDK17
- DB : Oracle , Mybatis
- 버전 및 이슈관리 : Github, Github Desktop , Git
- 협업 툴 : Discord, Notion, Slack
- 서비스 배포 환경 : AWS 

<br>



## ✔ : 브랜치 전략


-  주로 feature와 main 브랜치만 사용했습니다. 
-개발할 기능이 있을 때마다 feature 브랜치를 만들어서 해당 기능을 개발하고 테스트했습니다. 개발이 완료되면 pull request를 통해 해당 기능을 main 브랜치에 머지했습니다.

    - **main** 브랜치는 배포 단계에서만 사용하는 브랜치입니다.
    - **Feature** 브랜치는 기능 단위로 독립적인 개발 환경을 위하여 사용하고 merge 후 pull을 받았습니다..




<br>

## 👨🏽‍🤝‍👨🏽 역할 분담


### 🍊이현영

- **역할**
    - 메인페이지 
    - 후원모집
    - 물품기부
    - 활동보고서(후원후기)
    - 관리자페이지(활동보고서)
- **기능**
    - 결제 API 사용
    - 후원모집 : 기업/ 비회원 / 회원 기부 / 문자인증
    - 물품기부 : 물품 등록 및 리스트 조회
    - 활동보고서: 후원후기 CRUD
    - 관리자페이지(활동보고서) : 후원종료, 봉사활동 종료 리스트 조회, 활동보고서 삭제

<br>
    
### 👻임도원

- **역할**
    - 마이페이지  
    - 활동보고서
- **기능**
    - 마이페이지 정보 수정, 우편번호 API
    - 활동보고서 등록

<br>

### 😎박건욱

- **역할**
    - 로그인 , Oauth 2.0 로그인 , 회원가입
    - 라이브 채팅
    - 관리자
    - 스프링 시큐리티
- **기능**
    - 로그인 : Oauth2.0 로그인 , 아이디, 비밀번호 유효성 및 중복 검사, 회원가입 유효성 및 중복 검사  
              , 문자 검증, 아이디/비밀번호 찾기, 우편번호 API
    - 라이브채팅 : 실시간 채팅, 채팅방 수정/삭제
    - 관리자 : 채팅, 회원, 블랙리스트 관리
    - 시큐리티 : 인증, 인가 부여

<br>

### 🐬박상준

- **역할**
    - 관리자
    - 게시판
- **기능**
    - 후기 / 자유 / 공지사항 / FAQ 게시판 CRUD
    - 게시판 : 페이징 처리, 검색 기능, 파일등록 , 댓글 CRUD
    - 관리자 : 고객센터 , 게시판관리 (수령, 게시글 명단) , 댓글관리, 신고내역

<br>

### 👌박윤비

- **역할**
    - 자원봉사 활동 게시판, 유저 마이페이지
    - 공통 컴포넌트 : 탑배너, 하단 모달창
- **기능**
    - 자원봉사 활동 프로그램 신청, 취소
    - 자원봉사 활동 프로그램 게시글 생성, 수정, 삭제, 조회, 검색

<br>

## 개발 기간 및 작업 관리

### 개발 기간

- 전체 개발 기간 : 2024-02-16 ~ 2024-03-13
- UI 구현 : 2024-02-16 ~ 2022-02-24
- 기능 구현 : 2024-02-24 ~ 2024-03-13


### ERD
---
![희망의 조각 erd](https://github.com/springbootProejct/hopeProject/assets/104418414/67018a92-a4f6-4631-a44e-dc61e688b4ca)




### Usecase Diagram
---
![희망의조각 유스케이스다이어그램](https://github.com/springbootProejct/hopeProject/assets/63948477/51bbf259-a266-463d-ab8b-2868afbd5304)



(31kB)
