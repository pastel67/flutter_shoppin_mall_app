import 'package:flutter/material.dart';

List<CartItem> cartItems = [];

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();

    // ✅ 더미 데이터 (디자인용)
    cartItems = [
      CartItem(
        product: ProductEntity(
          image: '이미지',
          name: '가죽 핸드백',
          descriptiuon: '고급스러운 가죽 소재의 여성 핸드백',
          price: 45000,
          favorite: false,
        ),
        quantity: 1,
      ),
      CartItem(
        product: ProductEntity(
          image: '👟',
          name: '러닝화',
          descriptiuon: '편안한 착용감의 운동화',
          price: 69000,
          favorite: true,
        ),
        quantity: 2,
      ),
      CartItem(
        product: ProductEntity(
          image: '⌚',
          name: '시계',
          descriptiuon: '깔끔한 디자인의 손목시계',
          price: 120000,
          favorite: false,
        ),
        quantity: 1,
      ),
    ];
  }

  int getTotalPrice() {
    return cartItems
        .where((item) => item.isSelected)
        .fold(0, (sum, item) => sum + item.product.price * item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('타탁')),
      body: cartItems.isEmpty
          ? Center(child: Text('장바구니가 비어 있습니다.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                // 장바구니 카드 꾸미기
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: item.isSelected,
                        onChanged: (value) {
                          setState(() {
                            item.isSelected = value!;
                          });
                        },
                        activeColor: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 40,
                        height: 80,
                        //여기 이미지 넣는곳인데 어떻게 받아와야대는거야아아아아아아아아아아아아아아아앙
                        child: Image.asset('assets/단청키보드.webp'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              item.product.name,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 20),
                            //수량 체크 바꿀수 있게
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) item.quantity--;
                                    });
                                  },
                                ),
                                Text('${item.quantity}'),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 40),
                      Padding(
                        padding: const EdgeInsets.all(.0),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '삭제',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Text(
                              '가격 ${item.product.price}원',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomSheet: Container(
        width: double.infinity,
        height: 150,
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text('총 결제예상 금액  ', style: TextStyle(fontSize: 15)),
                Spacer(),
                Text(
                  '${getTotalPrice()}원',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            FilledButton(
              onPressed: getTotalPrice() == 0
                  ? null
                  : () {
                      final selectedItems = cartItems
                          .where((item) => item.isSelected)
                          .toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contaxt) => PaymentPage(
                            totalPrice: getTotalPrice(),
                            selectedItems: selectedItems,
                          ),
                        ),
                      );
                    },
              child: Text(
                '${cartItems.length}개 결제하기',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                fixedSize: Size(500, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
