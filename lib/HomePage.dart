import 'package:flutter/material.dart';
import 'BasketPage.dart';
import 'CampaignsPage.dart';

class HomePage extends StatefulWidget {
  final int currentIndex;

  const HomePage({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  final List<Map<String, dynamic>> products = [
    {"productName": "Sütaş Süt", "icon": 'lib/assets/images/sut.png', "isAsset": true, "price": "₺5.99"},
    {"productName": "Nestle Nesquik", "icon": 'lib/assets/images/nesquik.png', "isAsset": true, "price": "₺12.49"},
    {"productName": "Kinder Süt Dilimi", "icon": 'lib/assets/images/kinder.png', "isAsset": true, "price": "₺8.75"},
    {"productName": "Hüptrik", "icon": 'lib/assets/images/huptrik.png', "isAsset": true, "price": "₺3.25"},
  ]; // Örnek ürünler listesi

  final List<Map<String, dynamic>> categories = [
    {"name": "Migros", "icon": 'lib/assets/images/migros.png', "isAsset": true},
    {"name": "CarrefourSA", "icon": 'lib/assets/images/carrefour.png', "isAsset": true},
    {"name": "Bim", "icon": 'lib/assets/images/bim.PNG', "isAsset": true},
    {"name": "A101", "icon": 'lib/assets/images/a101.png', "isAsset": true},
  ];

  void addToCart(Map<String, dynamic> product) {
    // Sepete ekleme işlemi burada yapılacak
    print("Ürün sepete eklendi: ${product['productName']}");
    // İlgili ürünü sepete ekleyecek kod buraya yazılabilir
  }

  void _onItemTapped(int index) {
    if (index != _currentIndex) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(currentIndex: index)),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CampaignsPage(currentIndex: index)),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BasketPage(currentIndex: index)),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isTablet = screenWidth > 600;
    var crossAxisCount = isTablet ? 3 : 2; // Tabletlerde 3 sütun, telefonlarda 2 sütun

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black54.withOpacity(0.9), // Arka plan rengini ayarlayın
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.1,),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text('Profile', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Profil seçeneği işlemleri
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Ayarlar seçeneği işlemleri
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Log out', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  //Bu kod, uygulamanızdaki tüm sayfaları kapatır ve uygulamanın başlangıç ekranına ('/') geri döner.
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1f50be), Colors.black38],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Kategorileri sola hizala
          children: [
            SizedBox(height: screenHeight * 0.07), // Üstteki boşluk
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Drawer ikonu AppBar içinde
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(
                        Icons.menu, // Üç alt alta çizgi ikonu
                        color: Colors.white,
                        size: isTablet ? 30.0 : 20.0,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: isTablet ? 28.0 : 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      color: Colors.blueGrey,
                      onPressed: () {
                        // Arama işlemi burada yapılacak
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Kategori alanı ile üst kısım arasına boşluk
            Container(
              height: screenHeight * 0.15, // Kategoriler için sabit yükseklik
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth * 0.25, // Kategori kutusunun genişliği
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        categories[index]['isAsset']
                            ? Image.asset(
                          categories[index]['icon'],
                          width: isTablet ? 40.0 : 30.0,
                          height: isTablet ? 40.0 : 30.0,
                        )
                            : Icon(
                          categories[index]['icon'],
                          color: Colors.white,
                          size: isTablet ? 40.0 : 30.0,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(color: Colors.white, fontSize: isTablet ? 16.0 : 14.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  top: screenHeight * 0.02,
                  bottom: screenHeight * 0.02,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: screenHeight * 0.02,
                  crossAxisSpacing: screenWidth * 0.02,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              products[index]['isAsset']
                                  ? Image.asset(
                                products[index]['icon'],
                                width: isTablet ? 120.0 : 100.0,
                                height: isTablet ? 120.0 : 100.0,
                              )
                                  : Icon(
                                products[index]['icon'],
                                color: Colors.white,
                                size: isTablet ? 60.0 : 50.0,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                products[index]['productName'],
                                style: TextStyle(color: Colors.white, fontSize: isTablet ? 20.0 : 18.0),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                products[index]['price'],
                                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: isTablet ? 16.0 : 14.0),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: IconButton(
                            icon: Icon(Icons.add_circle, color: Colors.white),
                            onPressed: () {
                              // Sepete ekleme işlemi buraya gelecek
                              addToCart(products[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Bu satırı ekleyin
              currentIndex: _currentIndex,
              onTap: _onItemTapped,
              items: const [
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
              selectedItemColor: const Color(0xff1f50be),
              unselectedItemColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
