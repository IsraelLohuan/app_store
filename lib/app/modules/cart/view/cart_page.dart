
import 'package:appstore/app/modules/cart/components/button_personalized_cart.dart';
import 'package:appstore/app/modules/cart/components/card_order_address.dart';
import 'package:appstore/app/modules/cart/components/card_order_items.dart';
import 'package:appstore/app/modules/cart/components/card_values_order.dart';
import 'package:appstore/app/shared/components/error_component.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:appstore/app/shared/mixins/dialog_mixin.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with DialogMixin {

  final CartController cartController = BlocProvider.getBloc<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      body: StreamBuilder(
          stream: cartController.streamListProducts,
          initialData: cartController.cartProducts,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              if(snapshot.data.isEmpty) {
                return Center(
                  child: ErrorComponent(
                    message: "Seu carrinho está Vazio!",
                    visibleButton: false,
                    icon: Icons.remove_shopping_cart,
                  ),
                );
              }
            }

            return Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  CardOrderItems(),
                  CardOrderAddress(),
                  CardValuesOrder(),
                  ButtonPersonalizedCart(
                        () => showDialogItems(context),
                    "Editar item".toUpperCase(),
                    Icons.edit,
                    inverse: true,
                  ),
                  ButtonPersonalizedCart(
                        () => _onPressedSend(),
                    "Enviar Pedido".toUpperCase(),
                    Icons.send,
                    inverse: true,
                  ),
                ],
              ),
            );
          },
        )
    );
  }

  void _onPressedSend() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return FutureBuilder(
            future: cartController.insertOrder(),
            initialData: null,
            builder: (context, snapshot) {

              if(snapshot.hasError) {
                return dialogError(
                    context: context,
                    messageError: messageError(snapshot.error.toString())
                );
              }

              if(!snapshot.hasData) {
                return dialogLoader();
              }

              return dialogSucess(
                  context: context,
                  onPressed: () {
                    Navigator.pop(context);
                    cartController.clearCart();
                  },
                  messageSucess: "Seu pedido foi enviado com sucesso! Ele está em estado de análise, voce pode acompanhar o status de seu pedido pelo nosso app! Fique atento a sua caixa de e-mails!"
              );
            },
          );
        }
    );
  }
}
