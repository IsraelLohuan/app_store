import 'package:appstore/app/modules/home/components/card_item.dart';
import 'package:flutter/material.dart';

class RowCategory extends StatefulWidget {

  final String category;
  final String subTitleCategory;

  RowCategory({@required this.category, @required this.subTitleCategory});

  @override
  _RowCategoryState createState() => _RowCategoryState();
}

class _RowCategoryState extends State<RowCategory> {

  String get category => widget.category;
  String get subTitleCategory => widget.subTitleCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          _description(),
          SizedBox(height: 8,),
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
                color: Colors.white,
                fontFamily: "Oswald",
                fontSize: 30
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  subTitleCategory,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(width: 22,),
                Text(
                  "Visualizar Todos",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 13
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _horizontalList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardItem(),
          CardItem(),
          CardItem()
        ],
      ),
    );
  }
}
