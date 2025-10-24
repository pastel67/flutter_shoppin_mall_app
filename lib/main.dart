import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home: const ShoppingHomePage(title: '쇼핑몰 앱(가제)'),
    );
  }
}

//효동 확인용 푸쉬
