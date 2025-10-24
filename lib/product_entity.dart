class ProductEntity {
  final String image; // 상품이미지 
  final String name; // 상품이름
  final String? descriptiuon; // 상세 내용
  final int price; // 가격
  bool favorite; // 즐겨찾기

  ProductEntity({required this.image, required this.name,required this.descriptiuon, required this.price, required this.favorite});}