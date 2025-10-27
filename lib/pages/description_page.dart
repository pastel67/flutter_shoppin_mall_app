

import 'package:flutter/material.dart';
import 'home_page.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('타다욧', style: TextStyle())),
      body: Padding(
        padding: const EdgeInsets.all(18),
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
                SizedBox(
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
                                "리뷰 수",
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
                      Text("수량체크 및 가격 변동"),
                      Row(
                        children: [
                          
                        ],
                      )
                    ],

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
