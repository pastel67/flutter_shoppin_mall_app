class ProductEntity {
  final String image; // 상품이미지
  final String name; // 상품이름
  final String? descriptiuon; // 상세 내용
  final int price; // 가격
  final int quantity; // 수량
  bool favorite; // 즐겨찾기
  final String? typingSoundLink;

  ProductEntity({
    required this.image,
    required this.name,
    this.descriptiuon,
    required this.price,
    this.quantity = 1,
    required this.favorite,
    this.typingSoundLink,
  });
}

// 리뷰 엔티티 (추후 추가 예정)
