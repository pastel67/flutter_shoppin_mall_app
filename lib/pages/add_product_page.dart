import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({required this.title, required this.newProduct});

  final String title;
  final void Function(String image, String name, int prise, String descriptiuon)
  newProduct;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int productPrice = 0;

  final ImagePicker picker = ImagePicker();
  XFile? productImage;

  bool isIncluded() {
    if (productNameController.text.isEmpty ||
        productPriceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        productImage == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> getProductImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      productImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                const Color.fromARGB(255, 229, 247, 255),
                const Color.fromARGB(255, 210, 240, 255),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Text(
            widget.title,
            style: TextStyle(fontFamily: 'keyboard', fontSize: 30),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.lightBlueAccent, thickness: 5),
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
                  showUploadMenu(context);
                },
                child: Container(
                  color: const Color.fromARGB(255, 218, 239, 249),
                  height: 200,
                  child: Center(
                    child: productImage == null
                        ? Text(
                            "이곳을 터치해 이미지를 추가 하세요",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Image.file(File(productImage!.path), height: 200),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
              Divider(height: 50, thickness: 3, color: Colors.blue[200]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) => setState(() {}),
                    cursorColor: const Color.fromARGB(255, 0, 54, 73),
                    controller: descriptionController,
                    style: TextStyle(fontFamily: 'text'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "상품 상세 내용",
                    ),
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

  Future<dynamic> showUploadMenu(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.fromLTRB(20, 18, 20, 34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              fileUploadButton(
                uploadFunction: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "아직 준비중..!",
                        style: TextStyle(fontFamily: 'text', fontSize: 20),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                title: '파일 링크',
                icon: Icons.link,
              ),
              fileUploadButton(
                uploadFunction: () {
                  getProductImage();
                  Navigator.pop(context);
                },
                title: '갤러리',
                icon: Icons.add_photo_alternate,
              ),
            ],
          ),
        );
      },
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
          child: TextField(
            onChanged: (value) {
              isParsing ? productPrice = int.tryParse(value) ?? 0 : null;
            },
            inputFormatters: isParsing
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            controller: controller,
            cursorColor: const Color.fromARGB(255, 0, 54, 73),
            style: TextStyle(fontFamily: 'text', fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              contentPadding: EdgeInsets.only(left: 5),
            ),
            maxLines: 1,
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
        SizedBox(
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
            onPressed: isIncluded()
                ? () {
                    widget.newProduct(
                      productImage!.path,
                      productNameController.text,
                      productPrice,
                      descriptionController.text,
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                : null,
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
  Widget fileUploadButton({
    required VoidCallback uploadFunction,
    required String title,
    required IconData icon,
  }) {
    return SizedBox(
      height: 90,
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: uploadFunction,
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
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
