import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class DialogCustom extends StatelessWidget {

  final String message;
  final String messageButton;
  final bool dialogCustomError;
  final Function onCloseDialog;

  DialogCustom({this.message, this.messageButton = "Fechar", this.dialogCustomError = true, this.onCloseDialog});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        child: ListView(
          children: <Widget>[
            HeaderDialog(
              icon: dialogCustomError ? Icons.cancel : Icons.check,
              color: dialogCustomError ? Constants.COLOR_SECONDARY : Colors.green,
            ),
            ContentDialog(
              messageButton: messageButton,
              messageTop: dialogCustomError ? "Ops !!" : "Sucesso !!",
              message: message,
              onCloseDialog: onCloseDialog,
              colorButtonClose: dialogCustomError == true ? Constants.COLOR_SECONDARY : Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderDialog extends StatelessWidget {

  final IconData icon;
  final Color color;

  HeaderDialog({@required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 300/2,
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}

class ContentDialog extends StatelessWidget {

  final String messageTop;
  final String message;
  final String messageButton;
  final Function onCloseDialog;
  final Color colorButtonClose;

  ContentDialog({this.messageButton, this.messageTop, this.message, this.onCloseDialog, this.colorButtonClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            messageTop,
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
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: colorButtonClose,
                onPressed: onCloseDialog,
                child: Text(
                  messageButton,
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

