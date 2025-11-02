import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/Datas/cart_item.dart';
import 'package:flutter_shoppin_mall_app/Datas/dummy_data.dart';
import 'package:flutter_shoppin_mall_app/pages/add_product_page.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/Datas/product_entity.dart';
import 'package:flutter_shoppin_mall_app/view_pages/favorite_list_view.dart';
import 'package:flutter_shoppin_mall_app/view_pages/product_list_view.dart';

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({super.key});

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  final String title = 'TaDak#'; //타닥샵 #이 상점의 샵을 뜻하면서 키캡의 네모난 모양과 비슷해서 #으로 씀
  List<CartItem> cartList = [];
  int pageNumber = 1;

  Widget onTogglePage(int pageNumber) {
    switch (pageNumber) {
      case 1:
        return ProductListPage(title);
      case 2:
        return FavoriteList(title);
      default:
        return Center(
          child: Text(
            "등록된 상품이 없습니다.",
            style: TextStyle(fontSize: 20, fontFamily: 'text'),
          ),
        );
    }
  }
  void onSetState(){
    setState((){});
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
          : onTogglePage(pageNumber),

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
                    builder: (context) => AddProductPage(title: title, onSetState:onSetState),
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
            IconButton(
              onPressed: () {
                pageNumber = 1;
                setState(() {});
              },
              icon: Icon(Icons.home, size: 40),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                pageNumber = 2;
                setState(() {});
              },
              icon: Icon(Icons.list_alt, size: 40),
            ),
            Spacer(flex: 5),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(title: title),
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
}
