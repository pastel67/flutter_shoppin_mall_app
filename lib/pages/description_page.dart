import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class DescriptionPage extends StatefulWidget {
  final String title;
  final ProductEntity productData;
  void Function(ProductEntity addCartProduct, bool isSelected, int addQuantity)
  addProductInCart;
  void Function(List<CartItem> changedCartList) resetProductSelected;
  void Function(List<CartItem> changedCartList) deleteProduct;
  final List<CartItem> cartList;
  final int index;

  // 상세페이지 생성자
  DescriptionPage({
    required this.title,
    required this.productData,
    required this.addProductInCart,
    required this.cartList,
    required this.resetProductSelected,
    required this.deleteProduct,
    required this.index,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int productQuantity = 1;
  bool isSelected = false;

  void addCart() {
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
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                showDescriptionDialog(context, "장바구니에 추가하시겠습니까?", () {
                  Cart.addCart(widget.index);
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
                    Cart.onToggleFavorite(widget.index);
                    Cart.addCart(widget.index);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (route) => CartPage(
                          title: widget.title,
                          resetProductSelected: widget.resetProductSelected,
                          deleteProduct: widget.deleteProduct,
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
                const Spacer(),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '리뷰(240)',
                            style: TextStyle(fontSize: 10, fontFamily: 'text'),
                          ),
                          const Icon(Icons.star, color: Colors.amber, size: 25),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                Product.onToggleFavorite(index: widget.index);
                              });
                              print(widget.index);
                            },
                            icon: Product.list[widget.index].favorite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 25,
                                  )
                                : const Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.productData.name,
                        style: const TextStyle(
                          fontFamily: 'text',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                            style: const TextStyle(
                              fontSize: 10,
                              fontFamily: 'text',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.indeterminate_check_box),
                            onPressed: () {
                              setState(() {
                                if (productQuantity > 1) productQuantity--;
                              });
                            },
                          ),
                          Text('$productQuantity'),
                          IconButton(
                            icon: const Icon(Icons.add_box),
                            onPressed: () {
                              setState(() {
                                productQuantity++;
                              });
                            },
                          ),
                          const Spacer(),
                          Text(
                            '${widget.productData.price * productQuantity}원',
                            style: const TextStyle(
                              fontFamily: 'text',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
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
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
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
            const SizedBox(height: 20),
            Text(
              widget.productData.description,
              style: const TextStyle(fontFamily: 'text', fontSize: 17),
            ),
          ],
        ),
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
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'text',
            fontWeight: FontWeight.bold,
          ),
        ),
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
