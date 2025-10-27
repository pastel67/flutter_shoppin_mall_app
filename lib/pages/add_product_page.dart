import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  String title;

  AddProductPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle())),
      body: Center(child: Text("AddProductPage")),
    );
  }
}
