import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/product_entity.dart';
import 'home_page.dart';

class DescriptionPage extends StatelessWidget {
  final String title;
  final ProductEntity productData;

  DescriptionPage({required this.title, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle())),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(productData.image),
                  ),
                  //리뷰수, 즐겨찾기, 상품명, 가격, 수량체크, 장바구니 /구매하기
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Row(
                              children: [
                                Text('리뷰(240)', style: TextStyle(fontSize: 10)),
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
                          Text(productData.name),
                          Text('${productData.price}'),
                          Spacer(),
                          Text("수량체크 및 가격 변동"),
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

                      child: Text('상품 상세 설명'),
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

                      child: Text('리뷰 수'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('${productData.descriptiuon}'),
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
                child: (Text('구매하기')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
