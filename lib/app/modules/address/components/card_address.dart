import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/modules/address/controllers/address_controller.dart';
import 'package:appstore/app/modules/address/view/address_page.dart';
import 'package:appstore/app/shared/controllers/cart_controller.dart';
import 'package:appstore/app/shared/mixins/dialog_mixin.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget with DialogMixin {

  final Address address;
  final bool addAddressInOrder;

  AddressController _addressController;

  CardAddress({this.address, this.addAddressInOrder = false}) {
    _addressController = AddressController(address: address);
  }

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
                Icons.location_on,
                color: Colors.grey,
            ),
            title: Text(
              address.descricao,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              address.logradouro,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: InkWell(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Remocao de Endereco"),
                    content: Text("Deseja realmente remover este endereco ?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Cancelar", style: TextStyle(color: Colors.grey),),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text("Sim", style: TextStyle(color: Colors.grey),),
                        onPressed: () {

                          Navigator.pop(context);

                          showDialog(
                            context: context,
                            builder: (context) {
                              return FutureBuilder(
                                future: _addressController.delete(),
                                initialData: null,
                                builder: (context, snapshot) {

                                  if(snapshot.hasError) {
                                    return dialogError(context: context);
                                  }

                                  if(!snapshot.hasData) {
                                    return dialogLoader();
                                  }

                                  BlocProvider.getBloc<AddressController>().getAll();

                                  return dialogSucess(
                                      context: context,
                                      onPressed: () => Navigator.pop(context)
                                  );
                                },
                              );
                            }
                          );
                        },
                      )
                    ],
                  );
                }
              ),
            ),
            onTap: () {
              if(addAddressInOrder) {
                BlocProvider.getBloc<CartController>().setAddress(address);
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, AddressPage.router, arguments: address);
              }
            },
          ),
        ),
      )
    );
  }
}
