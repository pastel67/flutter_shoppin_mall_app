import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class DummyData {
  List<ProductEntity> productList;
  List<CartItem> cartList;

  DummyData({required this.productList, required this.cartList});

  void addDummyData() {
    productList.add(
      ProductEntity(
        image: 'assets/keychron.webp',
        name: '키크론 기계식키보드',
        description:
            '요즘은 돈주고 시끄럽고 옛날 디자인 고른다며? 레트로 디자인의 기계식 키보드!\n부모님이 가격알면 그돈씨 말 나옵니다. \n가격은 알리지 마세요.',
        price: 134000,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/ollibia.webp',
        name: '올리비아 저소음',
        description:
            '회사에서 사용하면 일 안한다고 욕먹을 수 있는 저소음 키보드! \n몰컴에 사용하세요.\n밤에 몰래 컴퓨터 하고 싶은데 키보드 소리가 나서 엄마한테 걸린다?\n저소음 바다축 올리비아라면 문제해결!',
        price: 82000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/abko.webp',
        name: '앱코 게이밍 키보드',
        price: 42000,
        favorite: true,
        description:
            '밤에 게임해도 밝은 LED키보드! 엄마한테 걸릴 수 있으니 주의!\n게이밍키보드여도 게임실력이 늘진않죠. \n게임실력이 안는다고 반품해달라고 애원해도\n반품사항에 해당되지 않습니다.',
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/logitech.webp',
        name: '로지텍 무선키보드',
        description:
            '너무 큰 키보드가 싫다면 당장 겟!! \n귀여움은 덤! 3대 500은 구매하면 안됩니다. \n생김새에 맞는 키보드 사용요망',
        price: 44900,
        favorite: true,
      ),
    );

    productList.add(
      ProductEntity(
        image: 'assets/tochepeu.webp',
        name: '토체프101 에그축',
        description:
            '일반 키보드는 가라. 이색 저색 합쳐놓은 중고 키보드 느낌! 감성있자나~\n이것또한 레트로 감성! \n젊음을 표출하고 싶다? 레트로가 답입니다. \n40대이상 그돈씨 말 나올 키보드!',
        price: 72900,
        favorite: false,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/logitech120.webp',
        name: '로지텍 k120',
        description:
            '디자인, 성능도 저렴한 값을 합니다. \n싼게 비지떡 ㅠ.ㅠ\n하지만 비싼 돈 주고 쓸 필요 없자나~ \n저렴하게 쓸 키보드를 찾는다면 \n굿 가성비 키보드!',
        price: 15900,
        favorite: false,
      ),
    );

    for (int i = 0; i < productList.length; i++) {
      if(i%2 == 0){
      cartList.add(CartItem(product: productList[i]));}
    }
  }
}
