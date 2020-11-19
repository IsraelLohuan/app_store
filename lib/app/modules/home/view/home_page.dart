
import 'package:appstore/app/modules/home/components/header_image.dart';
import 'package:appstore/app/modules/home/components/row_category.dart';
import 'package:appstore/app/modules/home/controllers/home_controller.dart';
import 'package:appstore/app/shared/components/progress_custom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HeaderImage(),
        FutureBuilder(
          future: _homeController.searchAllProducts(),
          initialData: _homeController.productController.products,
          builder: (context, snapshot) {

            if(snapshot.hasError) {
              return Center(
                child: Text(
                    "OPA! Não foi possível carregar os produtos!",
                    style: TextStyle(
                      color: Colors.white
                    ),
                ),
              );
            }

            if(!snapshot.hasData) {
              return ProgressCustom();
            }

            return Column(
              children: <Widget>[
                RowCategory(
                  category: "Destaque",
                  subTitleCategory: "Veja nossos relógios em destaque!",
                  products: _homeController.productController.productsFeatured(),
                ),
                RowCategory(
                  category: "Promoção",
                  subTitleCategory: "Veja nossos relógios em promoção!",
                  products: _homeController.productController.productsPromotional(),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
