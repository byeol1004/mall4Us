# 👗Mall4Us 
우리들을 위한 쇼핑몰

-별, 한묵, 경숙, 지훈

## 🖥️프로젝트 소개
마뗑킴 브랜드 자사몰과, 29CM 편집샵 등 의류 쇼핑몰을 참고하여 만든 사이트입니다.


### [개발 주제]

저희가 의류쇼핑몰을 주제로 선정한 이유는 손별님이 패션 온라인 MD경험이 있는데 그 경험을 바탕으로 프로젝트에 도움이 될 수 있을거 같아서,의류 쇼핑몰을 주제로 선정했습니다.
일반적으로는 관리자어드민과 판매사이트가 따로 관리되어있는데, 저희는 그런 번거로움을 개선시키고자 하였습니다.
가상의 요구사항을 선정을 해서 그 요구사항을 기반으로 작성하였습니다.
넘쳐나는 아이템들 사이에서 소비자가 원하는 상품을 효율적으로 찾아내어 시간과 노력을 보다 덜 들이고 효율적으로 쇼핑할 수 있는 사이트를 만들고자 하였습니다.


### [개발목적]
개발 목적으로는 쇼핑몰을 구현하면서 개인의 개발 역량과 팀원들간의 협업 역량을 향상시키자 입니다.

### [차별화]
저희 사이트의 차별점은 검색기능, 상품 가격순+판매순 정렬, 상품 대분류+중분류+소분류 카테고리별 조회를 통한 상품 필터링이 가능합니다.



### 🕰️개발기간
- 2022.12.26 ~ 2023.2.3 (6주)

### ⚙️개발환경
- Language : Java, HTML, CSS, JacaScript
- Server : Apache Tomcat 9.0
- FrameWork, Library : Spring, Mybatis, JQuery, Lombok
- DBMS : Oracle
- API : I'mPort
- IDE : STS(Sprinf Tool Suite)


## ✏️Table Modeling
![그림1](https://user-images.githubusercontent.com/121285584/220585585-35f6e546-9f97-4d86-8b9c-3467deefbd7f.png)

## ✏️Controller + View
![그림2](https://user-images.githubusercontent.com/121285584/220586394-6f0e6751-37e0-41dc-9393-bd3beaacad92.png)



## 📌주요기능
- 고객 : 회원가입(회원가입시 10%쿠폰 발행), 로그인, 마이페이지(회원정보+주문내역확인), 최근본상품 조회, 리뷰작성
- 관리자 : 상품등록, 재고현황, 판매내역 조회
- 상품 : 대분류·중분류·소분류 카테고리별 상품조회, 상품 가격순 판매순 정렬, 상품검색
- 카트 : 장바구니 담기, 장바구니 상품선택, 장바구니 삭제
- 결제 : 상품결제(실결제 금액의 5% 포인트 적립, 구매금액별 신규 or 실버 or 골드 회원등급 부여)


## 📄구현페이지
### 메인페이지(회원가입, 로그인)
https://user-images.githubusercontent.com/121285584/220640622-d77cc964-a5df-4514-bece-b0443ae84984.mp4

#### 구현기능
```
*로그인
*회원가입
*슬라이드 배너 적용 
*하단 이미지 클릭하여 대분류 카테고리로 이동
```


### 상품조회 ~ 장바구니 담기

https://user-images.githubusercontent.com/121285584/220630037-b42c8051-b368-402e-808f-038d45f7ab01.mp4

#### 구현기능
```
*상품 대분류, 중분류, 소분류 카테고리별 상품조회 가능
*가격 낮은순, 가격 높은순, 판매순으로 상품정렬
*검색창에 상품명 입력하여 상품조회 
*상품 장바구니 담기
```


### 결제

https://user-images.githubusercontent.com/121285584/220593408-8a2fa6e4-4f50-4212-9b7d-fee63ce20ad5.mp4

#### 구현기능
```
*배송정보, 쿠폰, 포인트 적용하여 결제
*I'mPort API 사용하여 결제 구현
*결제 완료 후 주문내역 조회
```


### 마이페이지 ~ 리뷰작성

https://user-images.githubusercontent.com/121285584/220594274-92d13e6b-6091-4997-86da-3a86a3a58d06.mp4

#### 구현기능
```
*마이페이지에서 회원정보, 주문내역, 최근본상품
*구매한 상품 리뷰작성 후 작성내역 조회
```


### 관리자페이지 > 상품등록

https://user-images.githubusercontent.com/121285584/220594899-7bdaa98f-8bec-41f7-8bce-4e41f8cbfc9d.mp4

#### 구현기능
```
*관리자페이지에서 상품등록
```


### 관리자페이지 > 상품재고, 판매현황 조회

https://user-images.githubusercontent.com/121285584/220633136-bcc032c9-ab31-4275-9aea-6ed12d0179ae.mp4

#### 구현기능
```
*관리자페이지 상품재고 확인
*관리자페이지 판매현황 확인
```


## 느낀점 & 보완하고 싶은 부분
저희가 처음 팀프로젝트를 진행할 때 막막하고 잘할 수 있을까 걱정이 많이 되었는데, 프로젝트가 완성된 지금은 미흡하더라도 저희가 목표한 개인의 역량 성장과 팀원들간의 협업에 대해 배울 수 있는 계기가 되었습니다.
이번 프로젝트를 진행하면서 저도 모르게 시각적이고, 직관적으로 바라보는 부분이 많다는 것을 깨달았고, 개발자의 입장으로 디자인적인 부분보다 데이터적인 부분으로 생각을 전환할 수 있었습니다.
저희가 시간상 미흡했던 부분 및 시큐리티 관련 부분과 문서 자동화 부분을 보완 강화를 하고 싶습니다.
또한 판매 데이터를 (일,주,월, 계절별로) 지정된 시간과 기간에 엑셀파일로 데이터를 받아  통계를 내줄 수 있게, 
그래프를 그릴 수 있게 자동화 해보고 싶습니다.
그리고, 지금까지는 MVC spring을 주로 배웠고 이번 프로젝도 이와 같은 방법으로 개발하였습니다. 
앞으로는 개발에 많이 적용 될 수 있는 RESTful을 적용하여 다양한 기기와의 정보 교환 처리도 적용해볼 정입니다.


***
<div align="center">읽어주셔서 감사합니다! 😊❤️</div>
