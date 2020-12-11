
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/cart/components/header_card.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CardOrderItems extends StatelessWidget {

  final CartController _cartController = BlocProvider.getBloc<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              HeaderCard(Icons.assignment, "ITENS DO PEDIDO"),
              SizedBox(height: 16,),
              StreamBuilder(
                stream: _cartController.streamListProducts,
                initialData: _cartController.cartProducts,
                builder: (context, snapshot) {
                  return Table(children: _tableItems(snapshot.data));
                },
              )
            ],
          )
        )
      ),
    );
  }

  List<TableRow> _tableItems(List<Product> products) {

    List<TableRow> _tables = [_tableLine(["ITEM", "VALOR UNIT", "QUANTIDADE"], isHeader: true) ];

    products.forEach((product) => _tables.add(
      _tableLine([product.titulo, formatNumberInReal(product.preco), product.cartQuantity.toString()])
    ));

    return _tables;
  }

  TableRow _tableLine(List<String> nameList, {bool isHeader = false}) {
    return TableRow(
        children: nameList.map((String value) => Container(
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          padding: EdgeInsets.all(8.0),
        )
        ).toList()
    );
  }
}
