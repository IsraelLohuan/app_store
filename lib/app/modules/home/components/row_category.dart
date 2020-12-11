import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/details/view/details_page.dart';
import 'package:appstore/app/modules/home/components/column_item.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class RowCategory extends StatefulWidget {
  final String category;
  final String subTitleCategory;
  final List<Product> products;

  RowCategory({
    @required this.category,
    @required this.subTitleCategory,
    @required this.products,
  });

  @override
  _RowCategoryState createState() => _RowCategoryState();
}

class _RowCategoryState extends State<RowCategory> {
  String get category => widget.category;
  String get subTitleCategory => widget.subTitleCategory;
  List<Product> get products => widget.products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          _description(),
          SizedBox(
            height: 8,
          ),
          _horizontalList()
        ],
      ),
    );
  }

  Widget _description() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              category,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Oswald", fontSize: 30),
            ),
            Text(
              subTitleCategory,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ],
    );
  }

  Widget _horizontalList() {
    if (products.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          "Não há produtos que se encontre nesta categoria.",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }

    int cardType = category == "Destaque"
        ? Constants.TYPE_CARD_FEATURED
        : category == "Promoção"
            ? Constants.TYPE_CARD_PROMOTIONAL
            : Constants.TYPE_CARD_GENERAL;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: products.map<ColumnItem>((product) => ColumnItem(product: product, typeCard: cardType),).toList(),
      ),
    );
  }
}
