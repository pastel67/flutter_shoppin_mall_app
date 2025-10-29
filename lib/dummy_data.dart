import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class DummyData {
  List<ProductEntity> productList;
  List<CartItem> cartList;

  DummyData({required this.productList, required this.cartList});

  void addDummyData() {
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '기본 키보드',
        price: 80000,
        favorite: false,
        description:
            '이곳은 상품 상세 내용을 작성하는 공간 입니다.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n하하',
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/단청키보드.webp',
        name: '단청 키보드',
        price: 160000,
        favorite: true,
        description:
            '이곳은 상품 상세 내용을 작성하는 공간 입니다.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n하하',
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/적축키보드.webp',
        name: '적축 키보드',
        price: 100000,
        favorite: false,
        description:
            '이곳은 상품 상세 내용을 작성하는 공간 입니다.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n하하',
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/abko.webp',
        name: '가죽 핸드백',
        description: '고급스러운 가죽 소재의 여성 핸드백',
        price: 45000,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/keychron.webp',
        name: '러닝화',
        description: '편안한 착용감의 운동화',
        price: 69000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '러닝화',
        description: '편안한 착용감의 운동화',
        price: 69000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '시계',
        description: '깔끔한 디자인의 손목시계',
        price: 120000,
        favorite: false,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '시계',
        description: '깔끔한 디자인의 손목시계',
        price: 120000,
        favorite: false,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/단청키보드.webp',
        name: '단청 키보드',
        price: 160000,
        favorite: true,
        description:
            '이곳은 상품 상세 내용을 작성하는 공간 입니다.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n하하',
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/단청키보드.webp',
        name: '단청 키보드',
        price: 160000,
        favorite: true,
        description:
            '이곳은 상품 상세 내용을 작성하는 공간 입니다.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n하하',
      ),
    );

    for (int i = 0; i < productList.length; i++) {
      cartList.add(CartItem(product: productList[i]));
    }
  }
}
