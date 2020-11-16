import 'package:appstore/app/modules/home/components/header_image.dart';
import 'package:appstore/app/modules/home/components/row_category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HeaderImage(),
        RowCategory(
          category: "Destaque",
          subTitleCategory: "Veja nossos relógios em destaque!",
        ),
        RowCategory(
          category: "Promoção",
          subTitleCategory: "Veja nossos relógios em destaque!",
        ),
        RowCategory(
          category: "Mais Vendidos",
          subTitleCategory: "Veja nossos relógios em destaque!",
        ),
      ],
    );
  }
}
