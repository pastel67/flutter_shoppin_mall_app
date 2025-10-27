import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage(this.title);

  String title;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController prodcutNameController = TextEditingController();

  int productPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: TextStyle())),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("상품 상세 내용"),
                Container(
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.amber,
              height: 90,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Center(child: Text("등록 하기")),
              ),
            ),
          ),
        ],
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
