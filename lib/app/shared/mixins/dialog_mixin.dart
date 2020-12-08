import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DialogMixin {

  Widget dialogLoader() {
    return Dialog(
      child: Container(
        height: 150,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Container(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Constants.COLOR_PRIMARY),
              ),
              width: 20,
              height: 20,
            ),
            SizedBox(width: 8,),
            Text("Aguarde, processando requisicao...")
          ],
        ),
      )
    );
  }

  Widget dialogError({String messageError = "OPA! \n\nFalha ao realizar requisicao!", BuildContext context}) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
                messageError,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17
                ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text(
                  "Ok",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
                color: Constants.COLOR_PRIMARY,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget dialogSucess({String messageSucess = "Sucesso! \n\nRequisicao efetuada com sucesso!", BuildContext context, Function onPressed}) {
    return Dialog(
        child: Container(
          padding: EdgeInsets.all(16),
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                messageSucess,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: onPressed,
                  color: Constants.COLOR_PRIMARY,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}