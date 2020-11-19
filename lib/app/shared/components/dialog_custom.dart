import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class DialogCustom extends StatelessWidget {

  final String message;

  DialogCustom({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        child: ListView(
          children: <Widget>[
            _header(context),
            _alert(context)
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      color: Constants.COLOR_SECONDARY,
      height: 300/2,
      child: Center(
        child: Icon(
          Icons.cancel,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }

  Widget _alert(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Ops !!",
              style: TextStyle(
                color: Constants.COLOR_PRIMARY,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
          ),
          SizedBox(height: 16,),
          Text(
            message,
            style: TextStyle(
                color: Constants.COLOR_PRIMARY,
                fontWeight: FontWeight.bold,
                fontSize: 13
            ),
          ),
          SizedBox(height: 16,),
          Container(
            child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Constants.COLOR_SECONDARY,
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                    Icons.close,
                    color: Colors.white,
                ),
                label: Text(
                  "Fechar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
