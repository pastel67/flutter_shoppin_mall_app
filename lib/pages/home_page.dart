import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class ShoppingHomePage extends StatelessWidget {
  ShoppingHomePage({super.key});

  final String title = '쇼핑몰 앱(가제)';

  final List<ProductEntity> productList = [
    ProductEntity(image: '%%', name: '포크',descriptiuon: '뾰족합니다.', price: 15000, favorite: true),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle())),
      body: Text("등록된 상품이 없습니다.", style: TextStyle())

    );
  }
}
