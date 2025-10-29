import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  final int totalPrice;
  final List<CartItem> selectedItems;

  PaymentPage({
    required this.title,
    required this.totalPrice,
    required this.selectedItems,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController requestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                const Color.fromARGB(255, 229, 247, 255),
                const Color.fromARGB(255, 185, 232, 255),
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
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputText('받는분 성함', nameController),
            inputText('배송지 입력', addressController),
            inputText('배달 요청 사항', requestController),
            // 장바구니에 담긴거 가져와서 보여주기
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.selectedItems.map((cartItem) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 70, 75, 78),
                          width: 3,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child:
                                  cartItem.product.image.startsWith('assets/')
                                  ? Image.asset(
                                      cartItem.product.image,
                                      fit: BoxFit.contain,
                                    )
                                  : Image.file(File(cartItem.product.image)),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.product.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'text',
                                    ),
                                  ),
                                  Text(
                                    '수량: ${cartItem.quantity}',
                                    style: TextStyle(fontFamily: 'text'),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${cartItem.finalPrice()}원',
                              style: TextStyle(fontFamily: 'text'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 157, 219, 247),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '총 상품 가격',
                            style: TextStyle(fontFamily: 'text', fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            '${widget.totalPrice}원',
                            style: TextStyle(fontSize: 15, fontFamily: 'text'),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '쿠폰 할인비',
                            style: TextStyle(fontSize: 20, fontFamily: 'text'),
                          ),
                          Spacer(),
                          Text(
                            '0원',
                            style: TextStyle(fontSize: 15, fontFamily: 'text'),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            '배송비',
                            style: TextStyle(fontSize: 20, fontFamily: 'text'),
                          ),
                          Spacer(),
                          Text(
                            '0원',
                            style: TextStyle(fontSize: 15, fontFamily: 'text'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        '결제 완료',
                        style: TextStyle(fontFamily: 'text'),
                      ),
                      content: Text(
                        '타닥샵을 이용해 주셔서 감사합니다.',
                        style: TextStyle(fontSize: 15, fontFamily: 'text'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // 팝업 닫기
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                          child: Text(
                            '확인',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                fixedSize: Size(500, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(5),
                ),
              ),
              child: Text(
                '${widget.totalPrice}원 결제하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'text',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column inputText(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontFamily: 'text')),
        TextField(
          maxLines: 1,
          controller: controller,
          cursorColor: const Color.fromARGB(255, 0, 54, 73),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
