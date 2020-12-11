import 'package:appstore/app/models/order.dart';
import 'package:appstore/app/modules/cart/components/header_card.dart';
import 'package:appstore/app/modules/my_orders/controllers/my_order_controller.dart';
import 'package:appstore/app/shared/mixins/dialog_mixin.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class CardOrder extends StatelessWidget with DialogMixin {

  final Order order;

  final MyOrderController _myOrderController = MyOrderController();

  CardOrder({this.order});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 80,
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.grey,
              ),
              title: Text(
                "Pedido #${order.id}",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                dateFormat(order.dataCadastro),
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(
                Icons.add,
                color: Colors.grey,
              ),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FutureBuilder(
                    future: _myOrderController.getOrder(order.id),
                    initialData: null,
                    builder: (context, snapshot) {
                      if(snapshot.hasError) {
                        return dialogError(context: context);
                      }

                      if(!snapshot.hasData) {
                        return dialogLoader();
                      }

                      final Order _order = snapshot.data;

                      return Dialog(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              HeaderCard(Icons.info_outline, "INFOs do Pedido"),
                              SizedBox(height: 16,),
                              RowInfoOrder("Código:", "#" + _order.id.toString()),
                              RowInfoOrder("Cadastro:", dateFormat(_order.dataCadastro)),
                              RowInfoOrder("Valor Total:", formatNumberInReal(_order.valorTotal)),
                              RowInfoOrder("Quantidade de itens:", _order.items.length.toString()),
                              RowInfoOrder("Status do Pedido:", _order.statusPedido),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ),
        )
    );
  }
}

class RowInfoOrder extends StatelessWidget {

  final String title;
  final String value;

  RowInfoOrder(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
