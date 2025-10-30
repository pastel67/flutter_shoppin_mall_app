class ProductEntity {
  final String image; // 상품이미지
  final String name; // 상품이름
  final String description; // 상세 내용
  final int price; // 가격
  bool favorite; // 즐겨찾기
  final String? typingSoundLink;

  ProductEntity({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.favorite = false,
    this.typingSoundLink,
  });
}
