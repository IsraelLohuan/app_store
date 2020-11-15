import 'package:appstore/app/shared/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static final router = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _view(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
        ],
        unselectedItemColor: Constants.COLOR_PRIMARY,
        selectedItemColor: Constants.COLOR_SECONDARY,
      )
    );
  }

  Widget _view() {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/images/img_top.jpg",
                fit: BoxFit.fill,
              ),
              width: MediaQuery.of(context).size.width,
              height: 400,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 280),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "RELÓGIOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    "DE ALTA QUALIDADE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "SAIBA MAIS",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      color: Constants.COLOR_SECONDARY,
                      onPressed: () => null,
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ],
    );
  }
}
