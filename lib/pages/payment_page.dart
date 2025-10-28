import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/pages/home_page.dart';

class PaymentPage extends StatefulWidget {
  final int totalPrice;
  final List<CartItem> selectedItems;

  PaymentPage({required this.totalPrice, required this.selectedItems});

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
      appBar: AppBar(title: Text('타타탁')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('받는분 성함'),
            TextField(maxLines: 1, controller: nameController),
            SizedBox(height: 10),
            Text('배송지 입력'),
            TextField(controller: addressController),
            SizedBox(height: 10),
            Text('배달 요청 사항'),
            TextField(controller: requestController),

            // 장바구니에 담긴거 가져와서 보여주기
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.selectedItems.map((cartItem) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(cartItem.product.image), // 이미지
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
                                    ),
                                  ),
                                  Text('수량: ${cartItem.quantity}'),
                                ],
                              ),
                            ),
                            Text('${cartItem.finalPrice()}원'),
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
                  border: Border.all(width: 3, color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('총 상품 가격', style: TextStyle(fontSize: 20)),
                          Spacer(),
                          Text(
                            '${widget.totalPrice}원',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text('쿠폰 할인비', style: TextStyle(fontSize: 20)),
                          Spacer(),
                          Text('0원', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text('배송비', style: TextStyle(fontSize: 20)),
                          Spacer(),
                          Text('0원', style: TextStyle(fontSize: 15)),
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
                      title: Text('결제 완료'),
                      content: Text(
                        '타닥을 이용해 주셔서 감사합니다.',
                        style: TextStyle(fontSize: 15),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // 팝업 닫기
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShoppingHomePage(),
                              ),
                            );
                          },
                          child: Text(
                            '확인',
                            style: TextStyle(color: Colors.lightBlue),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
