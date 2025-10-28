import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/pages/payment_page.dart';

//도와줘요 준호맨~ 살려줘요 준호맨~

class CartPage extends StatefulWidget {
  final String title;
  final List<CartItem> cartList;

  CartPage({required this.title, required this.cartList});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalPrice = 0;

  int calculatTotalPrice() {
    int changedPrice = 0;
    List<CartItem> finalPriceList = widget.cartList
        .where((selected) => selected.isSelected)
        .toList();
    for (CartItem price in finalPriceList) {
      changedPrice += price.finalPrice();
    }
    return changedPrice;
  }

  int cartItemCount() {
    int totalItemCount = 0;

    for (CartItem count in widget.cartList) {
      if (count.isSelected) {
        totalItemCount++;
      }
    }
    return totalItemCount;
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
      body: widget.cartList.isEmpty
          ? Container(
              height: 550,
              child: Center(
                child: Text(
                  '장바구니가 비어 있습니다.',
                  style: TextStyle(
                    fontFamily: 'text',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          : cartList(),
      bottomSheet: Container(
        width: double.infinity,
        height: 150,
        padding: EdgeInsets.all(18),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  '총 결제예상 금액  ',
                  style: TextStyle(fontSize: 15, fontFamily: 'text'),
                ),
                Spacer(),
                Text(
                  '${calculatTotalPrice()}원',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'text',
                  ),
                ),
              ],
            ),

            FilledButton(
              onPressed: calculatTotalPrice() == 0
                  ? null
                  : () {
                      final selectedItems = widget.cartList
                          .where((item) => item.isSelected)
                          .toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contaxt) => PaymentPage(
                            title: widget.title,
                            totalPrice: calculatTotalPrice(),
                            selectedItems: selectedItems,
                          ),
                        ),
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
                '${cartItemCount()}개 결제하기',
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

  ListView cartList() {
    final double bottomHeight = 120;
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: bottomHeight + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: widget.cartList.length,
      itemBuilder: (context, index) {
        final cartItem = widget.cartList[index];
        final productData = widget.cartList[index].product;
        // 장바구니 카드 꾸미기
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: const Color.fromARGB(255, 70, 75, 78),
              width: 3,
            ),
          ),

          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: cartItem.isSelected,
                onChanged: (value) {
                  setState(() {
                    widget.cartList[index].isSelected = value!;
                  });
                },
                activeColor: Colors.lightBlue,
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(productData.image),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      productData.name,
                      style: TextStyle(fontSize: 16, fontFamily: 'text'),
                    ),
                    SizedBox(height: 20),
                    //수량 체크 바꿀수 있게
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.indeterminate_check_box,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              if (cartItem.quantity > 1) {
                                cartItem.quantity--;
                              }
                            });
                            calculatTotalPrice();
                            cartItem.quantity = cartItem.quantity;
                          },
                        ),
                        Text(
                          '${cartItem.quantity}',
                          style: TextStyle(fontFamily: 'text'),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_box,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              cartItem.quantity++;
                              cartItem.quantity = cartItem.quantity;
                              calculatTotalPrice();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              widget.cartList.removeAt(index);
                            });
                          },
                          child: Text(
                            '삭제',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'text',
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        '가격 ${cartItem.finalPrice()}원',
                        style: TextStyle(fontSize: 15, fontFamily: 'text'),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
