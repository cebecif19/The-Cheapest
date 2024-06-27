import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key, required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  List<Map<String, dynamic>> basketItems = [
    {"productName": "Sütaş Süt", "icon": 'lib/assets/images/sut.png', "isAsset": true, "price": "₺5.99"},
    {"productName": "Hüptrik", "icon": 'lib/assets/images/huptrik.png', "isAsset": true, "price": "₺12.49"},
  ]; // Sepetteki ürünler listesi

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1f50be), Colors.black38],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Çarpıya basıldığında ne olacak
                  },
                  icon: Icon(Icons.cancel_outlined),
                ),
                Text(
                  "My Basket",
                  style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.03),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    // Çöp kutusuna tıklandığında ne olacak
                  },
                  icon: Icon(Icons.delete_sharp),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: basketItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: Colors.white, // ListTile'ın arka plan rengi
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    leading: basketItems[index]['isAsset']
                        ? Image.asset(
                      basketItems[index]['icon'],
                      width: 60.0,
                      height: 60.0,
                    )
                        : Icon(
                      basketItems[index]['icon'],
                      color: Colors.black,
                      size: 60.0,
                    ),
                    title: Text(
                      basketItems[index]['productName'],
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                    subtitle: Text(
                      basketItems[index]['price'],
                      style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16.0),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          // Sepetten ürünü kaldırma işlemi buraya gelecek
                          basketItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            // Do nothing or handle campaigns page navigation
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Campaigns",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Basket",
          ),
        ],
        backgroundColor: Colors.black45.withOpacity(0.5),
        selectedItemColor: Color(0xff1f50be),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
