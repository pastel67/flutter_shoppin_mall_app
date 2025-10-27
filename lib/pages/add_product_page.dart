import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage(this.title);

  String title;
  TextEditingController prodcutNameController = TextEditingController();

  int productPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle())),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              color: Colors.amber.withValues(alpha: 0.3),
              height: 200,
              child: Center(child: Text("이미지")),
            ),
            SizedBox(height: 5),
            inputField(title: "상품 이름"),
            SizedBox(height: 5),
            inputField(title: "상품 가격", isController: false, isFinction: true),
            SizedBox(height: 5),            
          ],
        ),
      ),
    );
  }

  Row inputField({
    required String title,
    bool isController = true,
    bool isFinction = false,
  }) {
    return Row(
      children: [
        Text(title),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              onChanged: (value) {
                isFinction ? productPrice = int.tryParse(value) ?? 0 : null;
              },
              controller: isController ? prodcutNameController : null,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10),
              ),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
