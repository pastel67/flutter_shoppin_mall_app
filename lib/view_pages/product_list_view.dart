import 'package:flutter/material.dart';
import 'package:flutter_shoppin_mall_app/Datas/product_entity.dart';
import 'package:flutter_shoppin_mall_app/numberFromatter.dart';
import 'package:flutter_shoppin_mall_app/pages/description_page.dart';

class ProductListPage extends StatefulWidget {
  String title;
  dynamic resetProductSelected;

  ProductListPage(this.title, this.resetProductSelected);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        int reversedIndex = Product.list.length - 1 - index;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DescriptionPage(
                  title: widget.title,
                  productData: Product.list[reversedIndex],
                  resetProductSelected: widget.resetProductSelected,
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
