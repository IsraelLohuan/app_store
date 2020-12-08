import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {

  final String message;
  final Function onPressed;
  final bool visibleButton;

  ErrorComponent({this.message, this.onPressed, this.visibleButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
              Icons.error,
              color: Colors.white,
              size: 80,
          ),
          SizedBox(height: 16,),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16,),
          Visibility(
            visible: visibleButton,
            child: RaisedButton.icon(
              label: Text("Tentar Novamente", style: TextStyle(color: Colors.white),),
              color: Constants.COLOR_PRIMARY,
              onPressed: onPressed,
              icon: Icon(Icons.update, color: Colors.white,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
