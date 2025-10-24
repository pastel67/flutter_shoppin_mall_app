import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';

class ShoppingHomePage extends StatefulWidget {
  ShoppingHomePage({super.key});

  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  final String title = '쇼핑몰 앱(가제)';

  List<ProductEntity> productList = [];

  void onToggleFavorite(bool toggleFavorite, int index) {
    setState(() {
      productList[index].favorite = toggleFavorite;
    });
  }

  @override
  void initState() {
    //더미 데이터
    productList.add(
      ProductEntity(
        image: 'assets/기본키보드.webp',
        name: '기본 키보드',
        price: 80000,
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
        image: 'assets/적축키보드.webp',
        name: '적축 키보드',
        price: 100000,
        favorite: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle())),

      body: productList.isEmpty
          ? Center(child: Text("등록된 상품이 없습니다.", style: TextStyle()))
          : productListView(),
    );
  }

  // 리스트 뷰 위젯
  Widget productListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  child: Image.asset(productList[index].image),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${productList[index].name}"),
                        Text("${productList[index].descriptiuon}"),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          productList[index].favorite =
                              !productList[index].favorite;
                          onToggleFavorite(productList[index].favorite, index);
                        },
                        icon: productList[index].favorite
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border),
                      ),
                      SizedBox(height: 50),
                      Text("${productList[index].price}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: productList.length,
    );
  }
}
