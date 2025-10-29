# Flutter Shopping Mall App

Flutter로 제작한 간단한 쇼핑몰 애플리케이션입니다.
상품 목록을 보고, 상품 상세 정보를 확인하고, 장바구니에 담거나 구매할 수 있습니다.
직관적인 UI와 상태 관리를 통해 실제 쇼핑 앱의 구조를 학습할 수 있도록 구성되었습니다.


## 주요 기능

<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 16 - 2025-10-29 at 22 09 36" src="https://github.com/user-attachments/assets/b0899931-4d1d-43ab-9b63-41afe051a724" />

### 홈 화면 (HomePage)

상품 목록(ProductList)을 카드 형태로 표시

각 상품에는 이미지, 이름, 가격, 찜 상태가 표시됨

찜 버튼 클릭 시 즐겨찾기 상태 토글


<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 16 - 2025-10-29 at 22 09 41" src="https://github.com/user-attachments/assets/222c8523-60ca-42b9-aff3-d4c7260b735c" />

### 상품 상세 페이지 (DescriptionPage)

선택한 상품의 이미지, 이름, 가격, 상세설명 표시

상품 이미지 클릭 시 확대 보기 기능

수량 조절 (+ / - 버튼) 가능

찜 상태 실시간 반영

“장바구니에 추가” / “구매하기” 버튼 제공



<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 16 - 2025-10-29 at 22 10 02" src="https://github.com/user-attachments/assets/55aa7bab-2383-432a-8269-504d7f2921ba" />

### 장바구니 페이지 (CartPage)

담긴 상품 목록 표시

상품 개수 조절, 삭제 가능

선택한 상품만 결제 처리 가능

결제 후 장바구니 초기화 기능 제공


<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 16 - 2025-10-29 at 22 10 18" src="https://github.com/user-attachments/assets/cf7fdba8-2e77-46a1-9cfc-266d6a01d631" />

### 상품 등록 페이지 (AddProductPage)

갤러리에서 이미지 업로드 (image_picker 사용)

상품 이름 / 가격 / 설명 입력 가능

등록 시 ProductEntity 리스트에 새로운 상품 추가

모든 항목 입력 시에만 “등록하기” 버튼 활성화

# 제작자

### 개발자: 김효동,최준호

### 프로젝트명: flutter_shoppin_mall_app

### 플랫폼: iOS / Android
