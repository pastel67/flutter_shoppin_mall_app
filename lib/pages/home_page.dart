import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/dummy_data.dart';
import 'package:flutter_shoppin_mall_app/numberFromatter.dart';
import 'package:flutter_shoppin_mall_app/pages/add_product_page.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/pages/description_page.dart';
import 'package:flutter_shoppin_mall_app/pages/favotie_page.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';
import 'package:intl/intl.dart';

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({super.key});

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  final String title = 'TaDak#'; //타닥샵 #이 상점의 샵을 뜻하면서 키캡의 네모난 모양과 비슷해서 #으로 씀
  List<CartItem> cartList = [];

  void onToggleFavorite(bool toggleFavorite, int index) {
    setState(() {
      Product.list[index].favorite = !toggleFavorite;
    });
  }

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

  //더미 데이터 추가
  @override
  void initState() {
    DummyData().addList();
    super.initState();
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
        title: Text(
          title,
          style: TextStyle(fontFamily: 'keyboard', fontSize: 30),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.lightBlueAccent, thickness: 5),
        ),
      ),

      body: Product.list.isEmpty
          ? Center(
              child: Text(
                "등록된 상품이 없습니다.",
                style: TextStyle(fontSize: 20, fontFamily: 'text'),
              ),
            )
          : productListPage(title: title),

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
                      title: title,
                      newProduct: getNewProductData,
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

      bottomNavigationBar: bottomMenu(context),
    );
  }

  // 하단 메뉴 모음
  SafeArea bottomMenu(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home, size: 40)),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (Route) => FavoritePage(
                      cartList: cartList,
                      title: title,
                      resetProductSelected: resetProductSelected,
                      deleteProduct: deleteProduct,
                      getNewProductData: getNewProductData,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.list_alt, size: 40),
            ),
            Spacer(flex: 5),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      title: title,
                      resetProductSelected: resetProductSelected,
                      deleteProduct: deleteProduct,
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
    );
  }

  // 상품 리스트
  Widget productListPage({required String title}) {
    return ListView.builder(
      itemBuilder: (context, index) {
        int reversedIndex = Product.list.length - 1 - index;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DescriptionPage(
                  title: title,
                  deleteProduct: deleteProduct,
                  addProductInCart: addProductInCart,
                  productData: Product.list[reversedIndex],
                  cartList: cartList,
                  resetProductSelected: resetProductSelected,
                  index: reversedIndex,
                ),
              ),
            );
            print(reversedIndex);
          },
          child: Container(
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
                    child: Image.asset(Product.list[reversedIndex].image),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Product.list[reversedIndex].name,
                            style: TextStyle(
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            Product.list[reversedIndex].description,
                            maxLines: 2,
                            style: TextStyle(fontFamily: 'text'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Product.onToggleFavorite(index: reversedIndex);
                          setState(() {});
                        },
                        icon: Product.list[reversedIndex].favorite
                            ? Icon(Icons.favorite, color: Colors.red, size: 25)
                            : Icon(Icons.favorite_border),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, right: 10),
                        child: Text(
                          "${PriceFormatter(Product.list[reversedIndex].price).priceFormat()}원",
                          style: TextStyle(fontFamily: 'text', fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: Product.list.length,
    );
  }
}
