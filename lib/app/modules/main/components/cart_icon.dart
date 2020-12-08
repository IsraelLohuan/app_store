import 'package:appstore/app/modules/cart/controller/cart_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {

  final CartController _cartController = BlocProvider.getBloc<CartController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _cartController.streamCounter,
      initialData: 0,
      builder: (context, snapshot) {
        if(snapshot.data == 0) {
          return Icon(Icons.shopping_cart);
        }

        return CartWithCounter(snapshot.data);
      }
    );
  }
}

class CartWithCounter extends StatelessWidget {

  final int counter;

  CartWithCounter(this.counter);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(Icons.shopping_cart),
        Padding(
          padding: EdgeInsets.only(left: 22),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              counter.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

