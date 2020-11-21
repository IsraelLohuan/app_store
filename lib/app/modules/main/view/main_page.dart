import 'package:appstore/app/modules/home/view/home_page.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static final router = "/home";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.COLOR_PRIMARY,
        body: pages[0],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.COLOR_PRIMARY,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.label),
              title: Text(
                "Produtos",
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Carrinho"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Perfil"),
            ),
          ],
          unselectedItemColor: Colors.white,
          selectedItemColor: Constants.COLOR_SECONDARY,
        ));
  }
}
