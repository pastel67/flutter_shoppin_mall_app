import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class DescriptionPage extends StatelessWidget {
  final String title;
  final ProductEntity productData;

  DescriptionPage({required this.title, required this.productData});

  @override
  Widget build(BuildContext context) {
    CartItem addCartProduct;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'keyboard', fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: AlertDialog(
                              content: SizedBox(
                                height: 300,
                                width: 350,
                                child: Expanded(
                                  child: Image.asset(productData.image),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: 150,
                      height: 200,
                      child: Image.asset(productData.image),
                    ),
                  ),
                  //리뷰수, 즐겨찾기, 상품명, 가격, 수량체크, 장바구니 /구매하기
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  '리뷰(240)',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'text',
                                  ),
                                ),
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            productData.name,
                            style: TextStyle(
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(flex: 7),
                              Text(
                                '${productData.price}',
                                style: TextStyle(fontFamily: 'text'),
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              // IconButton(
                              //   icon: Icon(Icons.remove_circle_outline),
                              //   onPressed: () {
                              //     setState(() {
                              //       if (cartItem.quantity > 1) {
                              //         cartItem.quantity--;
                              //       }
                              //     });
                              //     calculatTotalPrice();
                              //     cartItem.quantity = cartItem.quantity;
                              //   },
                              // ),
                              // Text('${cartItem.quantity}'),
                              // IconButton(
                              //   icon: Icon(Icons.add_circle_outline),
                              //   onPressed: () {
                              //     setState(() {
                              //       cartItem.quantity++;
                              //       cartItem.quantity = cartItem.quantity;
                              //       calculatTotalPrice();
                              //     });
                              //   },
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        fixedSize: Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(0),
                        ),
                      ),

                      child: Text(
                        '상품 상세 설명',
                        style: TextStyle(
                          fontFamily: 'text',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        fixedSize: Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(0),
                        ),
                      ),

                      child: Text(
                        '리뷰 수',
                        style: TextStyle(
                          fontFamily: 'text',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '${productData.descriptiuon}',
                style: TextStyle(fontFamily: 'text'),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 34),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, size: 30),
            ),
            SizedBox(width: 20),
            Expanded(
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  fixedSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                  ),
                ),
                child: (Text(
                  '구매하기',
                  style: TextStyle(
                    fontFamily: 'text',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
