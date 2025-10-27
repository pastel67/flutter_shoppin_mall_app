import 'package:flutter/material.dart';
import 'home_page.dart';

class DescriptionPage extends StatelessWidget {
  String title;
  

  DescriptionPage(this.title);

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
                    child: Center(child: Text("이미지")),
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
                                TextButton.icon(
                                  onPressed: () {},
                                  label: Text(
                                    "리뷰",
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  icon: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                ),
                                Spacer(),
                                TextButton.icon(
                                  onPressed: () {},
                                  label: Text(
                                    "즐겨찾기",
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("상품명"),
                          Text("가격"),
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

                      child: Text('상품상세설명'),
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
              Text('설명 좌라라락~'),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20),
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
