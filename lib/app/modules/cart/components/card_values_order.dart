import 'package:appstore/app/modules/cart/components/header_card.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CardValuesOrder extends StatelessWidget {

  final CartController _cartController = BlocProvider.getBloc<CartController>();

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: Card(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  HeaderCard(
                    Icons.attach_money,
                    "VALORES DO PEDIDO"
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: StreamBuilder(
                      stream: _cartController.streamListProducts,
                      initialData: _cartController.cartProducts,
                      builder: (context, snapshot) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            value("desconto:", _cartController.getDiscount()),
                            value("subtotal:", _cartController.getSubTotal()),
                            value("total:",    _cartController.getTotal())
                          ],
                        );
                      },
                    )
                  )
                ],
              )
          )
      ),
    );
  }

  Widget value(String name, double value) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Text(
            name.toUpperCase(),
            style: TextStyle(
                color: Colors.grey,
            ),
          ),
          SizedBox(width: 5,),
          Text(
            formatNumberInReal(value),
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
