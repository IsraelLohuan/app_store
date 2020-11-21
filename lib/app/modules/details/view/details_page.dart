import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/details/components/body.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsPage extends StatelessWidget {
  static const router = "/details";

  final Product product;

  DetailsPage({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.COLOR_PRIMARY,
        appBar: _buildAppBar(context),
        body: Body(product)
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.COLOR_PRIMARY,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(
          width: 16 / 2,
        )
      ],
    );
  }
}
