import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'HomePage.dart';
import 'BasketPage.dart';

class CampaignsPage extends StatefulWidget {
  final int currentIndex;

  const CampaignsPage({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _CampaignsPageState createState() => _CampaignsPageState();
}

class _CampaignsPageState extends State<CampaignsPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text("Campaigns Page"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
