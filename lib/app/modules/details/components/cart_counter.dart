import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {

  final Product product;

  CartCounter(this.product);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  CartController _cartController = BlocProvider.getBloc<CartController>();

  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BuildOutlineButton(
            icon: Icons.remove,
            onPressed: () => setState(() => _cartController.decrementQuantityProduct(product)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16/2),
          child: Text(
              _cartController.getQuantityProductInCart(product).toString(),
              style: Theme.of(context).textTheme.headline6
          ),
        ),
        BuildOutlineButton(
            icon: Icons.add,
            onPressed: () => setState(() => _cartController.incrementQuantityProduct(product))
        ),
      ],
    );
  }
}

class BuildOutlineButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  BuildOutlineButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13)
        ),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}

