import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class DescriptionPage extends StatefulWidget {
  final String title;
  final ProductEntity productData;
  VoidCallback onToggleFavorite;

  DescriptionPage({
    required this.title,
    required this.productData,
    required this.onToggleFavorite,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    CartItem addCartProduct;

    return Scaffold(
      appBar: AppBar(
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
          child: Divider(color: Colors.blueAccent),
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
                              content: Expanded(
                                child: Image.asset(
                                  widget.productData.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(widget.productData.image),
                    ),
                  ),
                  //리뷰수, 즐겨찾기, 상품명, 가격, 수량체크, 장바구니 /구매하기
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onPressed: () {
                                    print(
                                      '2 -1 ${widget.productData.favorite}',
                                    );
                                    setState(() {
                                      widget.onToggleFavorite();
                                    });
                                    print(
                                      '2 -2 ${widget.productData.favorite}',
                                    );
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
                          Text(
                            widget.productData.name,
                            style: TextStyle(
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Spacer(flex: 10),
                              Text(
                                '${widget.productData.price}',
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
                widget.productData.descriptiuon,
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
                    borderRadius: BorderRadius.circular(30),
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
