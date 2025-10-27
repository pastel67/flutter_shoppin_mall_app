import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

  ProductEntity cartitem;
  int quantity;
  bool isSelected;

  CartItem({
    required this.cartitem,
    this.quantity = 1,
    this.isSelected = false,
  });
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('타닥', style: TextStyle())),
      body: Column(children: [
        Row(
          
        )
      ],
      )
    );
  }

}
