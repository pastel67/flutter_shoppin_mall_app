import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({required this.title});

  final String title;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int productPrice = 0;
  XFile? productImage;
  final ImagePicker picker = ImagePicker();

  bool isIncluded() {
    if (productNameController.text.isEmpty ||
        productPriceController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'keyboard', fontSize: 30),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20, 18, 20, 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            fileUploudButton(
                              upLoudFunction: () {},
                              title: '파일 링크',
                              icon: Icons.link,
                            ),
                            fileUploudButton(
                              upLoudFunction: () async {
                                final ImagePicker pickedFile = ImagePicker();
                                final XFile? image = await pickedFile.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  productImage = image;
                                }
                              },
                              title: '갤러리',
                              icon: Icons.add_photo_alternate,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  color: const Color.fromARGB(255, 205, 239, 255),
                  height: 200,
                  child: Center(
                    child: Text(
                      "이곳을 터치해 이미지를 추가 하세요",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'text',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              inputProductData(
                title: '상품 이름',
                controller: productNameController,
              ),
              SizedBox(height: 5),
              inputProductData(
                title: "상품 가격",
                controller: productPriceController,
                isParsing: true,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("상품 상세 내용", style: TextStyle(fontFamily: 'text')),
                  TextField(
                    onChanged: (value) {
                      productPrice = int.tryParse(value) ?? 0;
                      setState(() {});
                    },
                    controller: descriptionController,
                    style: TextStyle(fontFamily: 'text'),
                    decoration: InputDecoration(border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 16),
        height: 90,
        child: bottomButton(),
      ),
    );
  }

  Widget inputProductData({
    required String title,
    required TextEditingController controller,
    bool isParsing = false,
  }) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontFamily: 'text')),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 31, 84)),
            ),
            child: TextField(
              onChanged: (value) {
                isParsing ? productPrice = int.tryParse(value) ?? 0 : null;
                print(controller.text);
                setState(() {});
              },
              inputFormatters: isParsing
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              controller: controller,
              style: TextStyle(fontFamily: 'text', fontWeight: FontWeight.bold),
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

  Widget bottomButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 390,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(500, 60),
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
            ),
            onPressed: isIncluded() ? () {} : null,
            child: Text(
              "등록 하기",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'text',
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 이미지 파일 업로드 버튼
  Widget fileUploudButton({
    required VoidCallback upLoudFunction,
    required String title,
    required IconData icon,
  }) {
    return SizedBox(
      height: 100,
      width: 120,
      child: ElevatedButton(
        onPressed: upLoudFunction,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: const Color.fromARGB(255, 0, 31, 84)),
              Text(
                title,
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 31, 84),
                  fontFamily: 'text',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
