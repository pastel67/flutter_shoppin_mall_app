import 'package:flutter_shoppin_mall_app/Datas/product_entity.dart';

class CartItem {
  ProductEntity product;
  bool isSelected;
  int quantity; // 수량

  CartItem({required this.product, this.isSelected = false, this.quantity = 1});

  int finalPrice() {
    return product.price * quantity;
  }
}

class Cart {
  static List<CartItem> list = [];

  static void addCart(int index) {
    CartItem doubledProduct = list.firstWhere(
      (item) => item.product == Product.list[index],
      orElse: () => CartItem(product: Product.list[index], quantity: 0),
    );
    int doubledIndex = list.indexOf(doubledProduct);

    if (doubledProduct.quantity >= 1 && doubledIndex != -1) {
      print('추가 전 ${list[doubledIndex].quantity}');
      list[doubledIndex].quantity++;
      print('추가 후 ${list[doubledIndex].quantity}');
    } else {
      list.add(CartItem(product: Product.list[index]));
      print('추가됨');
    }
  }

  static void onToggleFavorite(int index){
    CartItem doubledProduct = list.firstWhere(
      (item) => item.product == Product.list[index],
      orElse: () => CartItem(product: Product.list[index], quantity: 0),
    );
    int doubledIndex = list.indexOf(doubledProduct);

    if (doubledProduct.quantity >= 1 && doubledIndex != -1) {
      print('추가 전 ${list[doubledIndex].quantity}');
      list[doubledIndex].isSelected = true;
      print('추가 후 ${list[doubledIndex].quantity}');
    } else {
      list.add(CartItem(product: Product.list[index],isSelected: true));
      print('추가됨');
    }
  }

  static void deleteProduct(int index){
    list.remove(list[index]);
  }

  static void resetProductSelected(){
    for (CartItem item in list) {
      if (item.isSelected) {
        item.isSelected = !item.isSelected;
      }
    }
  }
}
