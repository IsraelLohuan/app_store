import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/modules/address/components/card_address.dart';
import 'package:appstore/app/modules/address/controllers/address_controller.dart';
import 'package:appstore/app/modules/address/view/address_page.dart';
import 'package:appstore/app/shared/components/icon_back.dart';
import 'package:appstore/app/shared/components/progress_custom.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/components/error_component.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AddressList extends StatefulWidget {

  static const router = "/addresslist";

  final bool addAddressInOrder;

  AddressList({this.addAddressInOrder});

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {

  AddressController _addressController = BlocProvider.getBloc<AddressController>();

  @override
  void initState() {
    super.initState();
    _addressController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      appBar: AppBar(
        elevation: 0,
        leading: IconBack(),
      ),
      body: StreamBuilder(
        stream: _addressController.streamList.stream,
        initialData: null,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return ErrorComponent(
              message: messageError(snapshot.error),
              onPressed: () => _addressController.getAll(),
            );
          }

          if(!snapshot.hasData) {
            return Center(
              child: ProgressCustom(),
            );
          }

          List<Address> list = snapshot.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => CardAddress(
              address: list[index],
              addAddressInOrder: widget.addAddressInOrder ?? false,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.add_location,
            color: Constants.COLOR_PRIMARY,
        ),
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, AddressPage.router),
      ),
    );
  }
}
