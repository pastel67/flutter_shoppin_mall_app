import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/Datas/product_entity.dart';
import 'package:flutter_shoppin_mall_app/numberFromatter.dart';
import 'package:flutter_shoppin_mall_app/pages/description_page.dart';
import 'package:flutter_shoppin_mall_app/widget/dialog.dart';

class FavoriteList extends StatefulWidget {
  String title;

  FavoriteList(this.title);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return Product.list.where((item) => item.favorite).toList().isEmpty
        ? Center(
            child: Text(
              "즐겨찾기에 추가된 상품이 없습니다.",
              style: TextStyle(fontSize: 20, fontFamily: "text"),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              int reversedIndex = Product.list.length - 1 - index;

              return Product.list[reversedIndex].favorite
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                              title: widget.title,
                              productData: Product.list[reversedIndex],
                              index: reversedIndex,
                            ),
                          ),
                        );
                        print(reversedIndex);
                      },
                      onLongPress: () {
                        showDescriptionDialog(
                          context: context,
                          title: "해당 상품을 삭제 하시겠습니까?",
                          acceptFunction: () {
                            Product.onToggleFavorite(index: reversedIndex);
                            setState(() {});
                            Navigator.pop(context);
                          },
                        );
                      },

                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
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
                                child: Image.asset(
                                  Product.list[reversedIndex].image,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Product.onToggleFavorite(
                                          index: reversedIndex,
                                        );
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 5,
                                        right: 10,
                                      ),
                                      child: Text(
                                        "${PriceFormatter(Product.list[reversedIndex].price).priceFormat()}원",
                                        style: TextStyle(
                                          fontFamily: 'text',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container();
            },
            itemCount: Product.list.length,
          );
  }
}
