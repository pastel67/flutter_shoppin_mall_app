import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/Datas/cart_item.dart';
import 'package:flutter_shoppin_mall_app/numberFromatter.dart';
import 'package:flutter_shoppin_mall_app/pages/add_product_page.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/pages/description_page.dart';
import 'package:flutter_shoppin_mall_app/Datas/product_entity.dart';

class FavoritePage extends StatefulWidget {
  final String title;
  List<CartItem> cartList;
  final void Function(List<CartItem> changedCartList) resetProductSelected;
  final void Function(List<CartItem> changedCartList) deleteProduct;
  final void Function(String image, String name, int prise, String description)
  getNewProductData;

  FavoritePage({
    required this.title,
    required this.cartList,
    required this.resetProductSelected,
    required this.deleteProduct,
    required this.getNewProductData,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void resetProductSelected(List<CartItem> changedCartList) {
    for (CartItem item in changedCartList) {
      if (item.isSelected) {
        item.isSelected = !item.isSelected;
      }
    }
    setState(() {});
    print('리셋');
  }

  void deleteProduct(List<CartItem> changedCartList) {
    cartList = changedCartList;
    print('삭제');
    setState(() {});
  }

  // 상품 추가시 데이터를 가져오는 함수
  void getNewProductData(
    String image,
    String name,
    int prise,
    String description,
  ) {
    setState(() {
      Product.list.add(
        ProductEntity(
          image: image,
          name: name,
          description: description,
          price: prise,
        ),
      );
    });
    print('상품추가');
  }

  // 장바구니에 상품을 추가 하는 함수
  void addProductInCart(
    ProductEntity addCartProduct,
    bool? addCartisSelected,
    int? addQuantity,
  ) {
    setState(() {
      cartList.add(
        CartItem(
          product: addCartProduct,
          isSelected: addCartisSelected ?? false,
          quantity: addQuantity ?? 1,
        ),
      );
      print('카트 추가');
    });
  }

  List<CartItem> cartList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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

      body: Product.list.where((item) => item.favorite).toList().isEmpty
          ? Center(
              child: Text(
                "즐겨찾기한 상품이 없습니다.",
                style: TextStyle(fontSize: 20, fontFamily: 'text'),
              ),
            )
          : Container(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProductPage(
                      title: widget.title,
                      newProduct: widget.getNewProductData,
                    ),
                  ),
                );
              },
              child: Icon(Icons.add, size: 35),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: Icon(Icons.home, size: 40),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.list_alt, size: 40),
              ),
              Spacer(flex: 5),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        title: widget.title,
                        resetProductSelected: widget.resetProductSelected,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart, size: 40),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            "로그인 해주세요",
                            style: TextStyle(fontSize: 20, fontFamily: 'text'),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(Icons.person, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }

}