import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/modules/address/components/card_address.dart';
import 'package:appstore/app/modules/address/controllers/address_controller.dart';
import 'package:appstore/app/shared/components/icon_back.dart';
import 'package:appstore/app/shared/components/progress_custom.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class AddressList extends StatefulWidget {

  static const router = "/addresslist";

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {

  AddressController _addressController = AddressController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      appBar: AppBar(
        elevation: 0,
        leading: IconBack(),
      ),
      body: FutureBuilder(
        future: _addressController.getAll(),
        initialData: null,
        builder: (context, snapshot) {

          if(!snapshot.hasData) {
            return Center(
              child: ProgressCustom(),
            );
          }

          List<Address> list = snapshot.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => CardAddress(),
          );
        },
      ),
    );
  }
}
