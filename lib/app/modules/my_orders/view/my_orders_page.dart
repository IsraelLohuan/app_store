import 'package:appstore/app/models/order.dart';
import 'package:appstore/app/modules/my_orders/components/card_order.dart';
import 'package:appstore/app/modules/my_orders/controllers/my_order_controller.dart';
import 'package:appstore/app/shared/components/error_component.dart';
import 'package:appstore/app/shared/components/icon_back.dart';
import 'package:appstore/app/shared/components/progress_custom.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {

  static const router = "/orders";

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {

  final MyOrderController _myOrderController = MyOrderController();

  @override
  void initState() {
    super.initState();
    _myOrderController.getAll();
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
        stream: _myOrderController.streamListOrder,
        initialData: null,
        builder: (context, snapshot) {

          if(snapshot.hasError) {
            return ErrorComponent(
              message: messageError(snapshot.error),
              onPressed: () => _myOrderController.getAll(),
            );
          }

          if(!snapshot.hasData) {
            return Center(
              child: ProgressCustom(),
            );
          }

          List<Order> list = snapshot.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => CardOrder(
              order: list[index],
            ),
          );
        },
      ),
    );
  }
}


