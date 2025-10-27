import 'package:flutter_shoppin_mall_app/product_entity.dart';

class CartItem {
  ProductEntity product;
  bool isSelected;
  int quantity; // 수량
  
  CartItem({
    required this.product,
    this.isSelected = false,
    this.quantity = 1,
  });

  int finalPrice(){
    return product.price * quantity;
  }
}
