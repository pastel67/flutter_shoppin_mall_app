import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class ShoppingHomePage extends StatelessWidget {
  const ShoppingHomePage({super.key, required this.title});

  final String title;

  @override
  // List<ProductEntity> productList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle(fontSize: 30))),
      body: Center(child: Text("등록된 상품이 없습니다.")),
    );
  }
}
