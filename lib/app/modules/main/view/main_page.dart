import 'package:appstore/app/modules/cart/view/cart_page.dart';
import 'package:appstore/app/modules/home/view/home_page.dart';
import 'package:appstore/app/modules/main/components/cart_icon.dart';
import 'package:appstore/app/modules/main/controllers/main_controller.dart';
import 'package:appstore/app/modules/product/view/product_list.dart';
import 'package:appstore/app/modules/profile/view/profile_page.dart';
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
    CartPage(),
    ProfilePage()
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
                  icon: CartIcon(),
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
