
import 'package:appstore/app/modules/product/controllers/product_list_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/upper_case_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {

  final ProductListController productListController;

  Search(this.productListController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        height: 180,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SearchTop(productListController),
            SearchTextField(productListController)
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
      ),
    );
  }
}

class SearchTop extends StatelessWidget {

  final ProductListController productListController;

  SearchTop(this.productListController);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Constants.COLOR_PRIMARY,
          ),
          onPressed: () => null,
        ),
        InkWell(
          child: Opacity(
            child: Text("Cancelar"), opacity: 0.5,
          ),
          onTap: () => productListController.setSearch(false),
        )
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {

  final ProductListController productListController;

  SearchTextField(this.productListController);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          inputFormatters: [
            UpperCaseTextFormatter()
          ],
          style: TextStyle(
            fontFamily: 'Alfa Slab One',
            fontSize: 28,
            color: Constants.COLOR_PRIMARY
          ),
          onChanged: (String text) => productListController.search(text.toLowerCase()),
        ),
        SizedBox(height: 16,),
        Text(
            "Resultados (${productListController.productsSearch.length})",
            style: TextStyle(
              color: Colors.grey
            ),
        )
      ],
    );
  }
}


