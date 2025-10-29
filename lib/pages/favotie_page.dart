import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/pages/add_product_page.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class FavotiePage extends StatefulWidget {
  final String title;
  final List<ProductEntity> productList;
  final void Function(bool toggleFavorite, int reversedIndex) onToggleFavorite;
  List<CartItem> cartList;
  final void Function(List<CartItem> changedCartList) resetProductSelected;
  final void Function(List<CartItem> changedCartList) deleteProduct;
  final void Function(String image, String name, int prise, String description)
  getNewProductData;

  FavotiePage({
    required this.title,
    required this.productList,
    required this.onToggleFavorite,
    required this.cartList,
    required this.resetProductSelected,
    required this.deleteProduct,
    required this.getNewProductData,
  });

  @override
  State<FavotiePage> createState() => _FavotiePageState();
}

class _FavotiePageState extends State<FavotiePage> {
  @override
  Widget build(BuildContext context) {
    List<ProductEntity> favotieProductList = widget.productList
        .where((item) => item.favorite)
        .toList();

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

      body: ListView.builder(
        itemBuilder: (context, index) {
          int reversedIndex = favotieProductList.length - 1 - index;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 70, 75, 78),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(5),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: Image.asset(favotieProductList[reversedIndex].image),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            favotieProductList[reversedIndex].name,
                            style: TextStyle(
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            favotieProductList[reversedIndex].description,
                            maxLines: 2,
                            style: TextStyle(fontFamily: 'text'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 25),

                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, right: 10),
                          child: Text(
                            "${widget.productList[reversedIndex].price}원",
                            style: TextStyle(fontFamily: 'text', fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: favotieProductList.length,
      ),
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
                        cartList: widget.cartList,
                        resetProductSelected: widget.resetProductSelected,
                        deleteProduct: widget.deleteProduct,
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
