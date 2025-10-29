import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class DescriptionPage extends StatefulWidget {
  final String title;
  final ProductEntity productData;
  VoidCallback onToggleFavorite;
  void Function(ProductEntity addCartProduct, bool isSelected, int addQuantity)
  addProductInCart;
  void Function(List<CartItem> changedCartList) resetProductSelected;
  void Function(List<CartItem> changedCartList) deleteProduct;
  final List<CartItem> cartList;

  DescriptionPage({
    required this.title,
    required this.productData,
    required this.onToggleFavorite,
    required this.addProductInCart,
    required this.cartList,
    required this.resetProductSelected,
    required this.deleteProduct,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int productQuantity = 1;
  bool isSelected = false;

  void addCart() {
    print(productQuantity);
    widget.addProductInCart(widget.productData, isSelected, productQuantity);
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

      body: productData(context),

      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 34),
        child: Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showDescriptionDialog(context, "장바구니에 추가하시겠습니까?", () {
                    addCart();
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
                icon: Icon(Icons.shopping_cart, size: 30),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    showDescriptionDialog(context, "해당 상품을 구매하시겠습니까?", () {
                      isSelected = true;
                      addCart();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (route) => CartPage(
                            title: widget.title,
                            cartList: widget.cartList,
                            resetProductSelected: widget.resetProductSelected,
                            deleteProduct:widget.deleteProduct
                          ),
                        ),
                      );
                    });
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    fixedSize: Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
      ),
    );
  }

  Widget productData(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
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
                            content:
                                widget.productData.image.startsWith('assets/')
                                ? Image.asset(
                                    widget.productData.image,
                                    fit: BoxFit.contain,
                                  )
                                : Image.file(File(widget.productData.image)),
                          ),
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: widget.productData.image.startsWith('assets/')
                        ? Image.asset(
                            widget.productData.image,
                            fit: BoxFit.contain,
                          )
                        : Image.file(File(widget.productData.image)),
                  ),
                ),
                Spacer(),
                //리뷰수, 즐겨찾기, 상품명, 가격, 수량체크, 장바구니 /구매하기
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '리뷰(240)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'text',
                                ),
                              ),
                              Icon(Icons.star, color: Colors.amber, size: 25),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.onToggleFavorite();
                                  });
                                },
                                icon: widget.productData.favorite
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 25,
                                      )
                                    : Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.productData.name,
                          style: TextStyle(
                            fontFamily: 'text',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: widget.productData.favorite
                                  ? Colors.red
                                  : Colors.lightBlueAccent,
                              size: 10,
                            ),
                            Text(
                              widget.productData.favorite
                                  ? '174명이 찜한 상품입니다.'
                                  : '173명이 찜한 상품입니다.',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'text',
                              ),
                            ),
                          ],
                        ),

                        Spacer(),
                        Row(
                          children: [
                            Spacer(flex: 10),
                            Text(
                              '${widget.productData.price}원',
                              style: TextStyle(
                                fontFamily: 'text',
                                fontSize: 17,
                              ),
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.indeterminate_check_box),
                              onPressed: () {
                                setState(() {
                                  if (productQuantity > 1) {
                                    productQuantity--;
                                    print(productQuantity);
                                  }
                                });
                              },
                            ),
                            Text('${productQuantity}'),
                            IconButton(
                              icon: Icon(Icons.add_box),
                              onPressed: () {
                                setState(() {
                                  productQuantity++;
                                  print(productQuantity);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.productData.name,
                        style: TextStyle(
                          fontFamily: 'text',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: widget.productData.favorite
                                ? Colors.red
                                : Colors.lightBlueAccent,
                            size: 10,
                          ),
                          Text(
                            widget.productData.favorite
                                ? '174명이 찜한 상품입니다.'
                                : '173명이 찜한 상품입니다.',
                            style: TextStyle(fontSize: 10, fontFamily: 'text'),
                          ),
                        ],
                      ),

                      Spacer(),
                      Row(
                        children: [
                          Spacer(flex: 10),
                          Text(
                            '${widget.productData.price}원',
                            style: TextStyle(fontFamily: 'text', fontSize: 17),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.indeterminate_check_box),
                            onPressed: () {
                              setState(() {
                                if (productQuantity > 1) {
                                  productQuantity--;
                                  print(productQuantity);
                                }
                              });
                            },
                          ),
                          Text('${productQuantity}'),
                          IconButton(
                            icon: Icon(Icons.add_box),
                            onPressed: () {
                              setState(() {
                                productQuantity++;
                                print(productQuantity);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
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
                        borderRadius: BorderRadiusGeometry.circular(15),
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
            widget.productData.description,
            style: TextStyle(fontFamily: 'text', fontSize: 17),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDescriptionDialog(
    BuildContext context,
    String title,
    void acceptFunction(),
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: TextStyle(fontSize: 15, fontFamily: 'text')),
        actions: [
          TextButton(
            child: Text(
              "취소",
              style: TextStyle(fontFamily: 'text', color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            onPressed: acceptFunction,
            child: Text(
              "확인",
              style: TextStyle(fontFamily: 'text', color: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }
}
