import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/cart_item.dart';
import 'package:flutter_shoppin_mall_app/pages/add_product_page.dart';
import 'package:flutter_shoppin_mall_app/pages/cart_page.dart';
import 'package:flutter_shoppin_mall_app/pages/description_page.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({super.key});

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  final String title = 'TaDak#'; //타닥샵 #이 상점의 샵을 뜻하면서 키캡의 네모난 모양과 비슷해서 #으로 씀

  List<ProductEntity> productList = [];
  List<CartItem> cartList = [];

  void onToggleFavorite(bool toggleFavorite, int index) {
    setState(() {
      productList[index].favorite = toggleFavorite;
    });
  }

  // void addProductInCart (){
  //   cartList.add()
  // }

  // 상품 추가시 데이터를 가져오는 함수
  void getNewProductData({
    required String newImage,
    required final String newName,
    final String? newDescriptiuon,
    required final int newPrice,
    required bool newFavorite,
  }) {
    productList.add(
      ProductEntity(
        image: newImage,
        name: newName,
        descriptiuon: newDescriptiuon,
        price: newPrice,
        favorite: newFavorite,
      ),
    );
  }

  //더미 데이터 추가
  @override
  void initState() {
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '기본 키보드',
        price: 80000,
        favorite: false,
        descriptiuon:
            '이곳은 상품 상세 내용을 작성하는 공간 입니다.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n하하',
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/단청키보드.webp',
        name: '단청 키보드',
        price: 160000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/적축키보드.webp',
        name: '적축 키보드',
        price: 100000,
        favorite: false,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '가죽 핸드백',
        descriptiuon: '고급스러운 가죽 소재의 여성 핸드백',
        price: 45000,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '러닝화',
        descriptiuon: '편안한 착용감의 운동화',
        price: 69000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '러닝화',
        descriptiuon: '편안한 착용감의 운동화',
        price: 69000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '시계',
        descriptiuon: '깔끔한 디자인의 손목시계',
        price: 120000,
        favorite: false,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '시계',
        descriptiuon: '깔끔한 디자인의 손목시계',
        price: 120000,
        favorite: false,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/단청키보드.webp',
        name: '단청 키보드',
        price: 160000,
        favorite: true,
      ),
    );
    productList.add(
      ProductEntity(
        image: 'assets/단청키보드.webp',
        name: '단청 키보드',
        price: 160000,
        favorite: true,
      ),
    );

    for (int i = 0; i < productList.length; i++) {
      cartList.add(CartItem(product: productList[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'keyboard', fontSize: 30),
        ),
      ),

      body: productList.isEmpty
          ? Center(
              child: Text(
                "등록된 상품이 없습니다.",
                style: TextStyle(fontFamily: 'text'),
              ),
            )
          : productListView(title: title),

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
                    builder: (context) => AddProductPage(title: title),
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
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 40)),
            Spacer(flex: 5),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartPage(title: title, cartList: cartList),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart, size: 40),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 40)),
          ],
        ),
      ),
    );
  }

  // 상품 리스트
  Widget productListView({required String title}) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DescriptionPage(
                  title: title,

                  productData: productList[index],
                ),
              ),
            );
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
                    child: Image.asset(productList[index].image),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList[index].name,
                            style: TextStyle(
                              fontFamily: 'text',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          productList[index].descriptiuon == null
                              ? SizedBox()
                              : Text(
                                  "${productList[index].descriptiuon}",
                                  maxLines: 3,
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
                          productList[index].favorite =
                              !productList[index].favorite;
                          onToggleFavorite(productList[index].favorite, index);
                        },
                        icon: productList[index].favorite
                            ? Icon(Icons.favorite, color: Colors.red, size: 20)
                            : Icon(Icons.favorite_border),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 16.0),
                        child: Text("${productList[index].price}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: productList.length,
    );
  }
}
