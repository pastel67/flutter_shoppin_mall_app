import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({required this.title});

  final String title;

  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int productPrice = 0;

  bool isIncluded() {
    if (productNameController.text.isEmpty &&
        productPriceController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

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
              color: Colors.lightBlue.withValues(alpha: 0.3),
              height: 200,
              child: Center(child: Text("이미지")),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("상품 이름"),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: productNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text("상품 가격"),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: TextField(
                      controller: productPriceController,
                      onChanged: (value) {
                        productPrice = int.tryParse(value) ?? 0;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("상품 상세 내용"),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(border: InputBorder.none),
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
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
              height: 90,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ElevatedButton(
                  onPressed: isIncluded() ? null : () {},
                  child: Text("등록 하기"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
