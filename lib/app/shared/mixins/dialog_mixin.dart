import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/components/dialog_custom.dart';
import 'package:appstore/app/shared/components/error_component.dart';
import 'package:appstore/app/shared/components/modal_items/card_item_modal.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DialogMixin {

  Widget dialogLoader() {
    return Dialog(
      child: Container(
        height: 150,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Container(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Constants.COLOR_PRIMARY),
              ),
              width: 20,
              height: 20,
            ),
            SizedBox(width: 8,),
            Text("Aguarde, processando requisicao...")
          ],
        ),
      )
    );
  }

  Widget dialogError({String messageError = "OPA! \n\nFalha ao realizar requisicao!", BuildContext context}) {
    return DialogCustom(
      message: messageError,
      onCloseDialog: () => Navigator.of(context).pop(),
    );
  }

  Widget dialogSucess({String messageSucess = "Sucesso! \n\nRequisicao efetuada com sucesso!", BuildContext context, Function onPressed}) {
    return DialogCustom(
      message: messageSucess,
      dialogCustomError: false,
      onCloseDialog: onPressed,
    );
  }

  void showDialogItems(BuildContext context) {

    CartController cartController = BlocProvider.getBloc<CartController>();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Constants.COLOR_PRIMARY,
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: StreamBuilder(
                stream: cartController.streamListProducts,
                initialData: cartController.cartProducts,
                builder: (context, snapshot) {

                  if(snapshot.hasData) {
                    if(snapshot.data.isEmpty) {
                      return ErrorComponent(
                        message: "Nao há itens inserido no pedido!",
                        colorButton: Constants.COLOR_PRIMARY,
                        visibleButton: false,
                      );
                    }
                  }

                  List<Product> products = snapshot.data;

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => CardItemModel(products[index]),
                  );
                },
              )
            )
          ),
        );
      }
    );
  }
}