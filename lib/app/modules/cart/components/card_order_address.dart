import 'dart:async';

import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/modules/address/view/address_list.dart';
import 'package:appstore/app/modules/cart/components/button_personalized_cart.dart';
import 'package:appstore/app/modules/cart/components/header_card.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CardOrderAddress extends StatefulWidget {
  @override
  _CardOrderAddressState createState() => _CardOrderAddressState();
}

class _CardOrderAddressState extends State<CardOrderAddress> {

  final CartController _cartController = BlocProvider.getBloc<CartController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _cartController.streamLocation,
      initialData: _cartController.address,
      builder: (context, snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: snapshot.hasData ? 250 : 160,
          child: Card(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: <Widget>[
                      HeaderCard(Icons.location_on, "LOCAL DE ENTREGA"),
                      SizedBox(height: 16,),
                      contentCard(snapshot.hasData)
                    ],
                  )
              )
          ),
        );
      },
    );
  }

  Widget contentCard(bool hasData) {
    if(!hasData) {
      return addressEmpty();
    }

    return Column(
      children: <Widget>[
        addressField("Cidade:", _cartController.address.cidade),
        addressField("Bairro:", _cartController.address.bairro),
        addressField("Logradouro:", _cartController.address.logradouro),
        addressField("Numero:", _cartController.address.numero),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ButtonPersonalizedCart(
                () => _cartController.setAddress(null),
            "remover".toUpperCase(),
            Icons.delete,
          ),
        )
      ],
    );
  }

  Widget addressEmpty() {
    return Column(
      children: <Widget>[
        Text(
            "Nao há endereco inserido!",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
            ),
        ),
        SizedBox(height: 16,),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ButtonPersonalizedCart(
                  () => Navigator.pushNamed(context, AddressList.router, arguments: true),
              "inserir".toUpperCase(),
              Icons.add_location
          ),
        )
      ],
    );
  }

  Widget addressField(String name, String value) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5,),
          Text(
            value,
            style: TextStyle(
                color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}

