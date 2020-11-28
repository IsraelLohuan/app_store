import 'package:appstore/app/modules/home/view/home_page.dart';
import 'package:appstore/app/modules/main/controllers/main_controller.dart';
import 'package:appstore/app/modules/product/view/product_list.dart';
import 'package:appstore/app/modules/user/view/user_page.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static final router = "/main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  MainController _mainController = MainController();

  final pages = [
    HomePage(),
    ProductList(),
    Container(child: Text("PAGE B"),),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _mainController.indexBottomStream,
      initialData: 0,
      builder: (context, snapshot) {
        return Scaffold(
            backgroundColor: Constants.COLOR_PRIMARY,
            body: pages[snapshot.data],
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
                  title: Text("Produtos",),
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
              currentIndex: snapshot.data,
              unselectedItemColor: Colors.white,
              selectedItemColor: Constants.COLOR_SECONDARY,
              onTap: (int index) => _mainController.setIndex(index),
            )
        );
      },
    );
  }
}
