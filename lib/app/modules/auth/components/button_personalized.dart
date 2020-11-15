import 'package:appstore/app/components/progress_custom.dart';
import 'package:appstore/app/shared/constants.dart';
import 'package:flutter/material.dart';

class ButtonPersonalized extends StatelessWidget {

  final String label;
  final double width;
  final Color colorButton;
  final Color colorText;
  final Function onPressed;
  final bool borderLine;
  final bool loading;

  ButtonPersonalized(
    {this.label, this.width, this.onPressed, this.colorButton = Constants.COLOR_SECONDARY, this.colorText = Colors.white, this.borderLine = false, this.loading = false}
  );

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    if(!borderLine) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(color: colorButton)
          ),
          color: colorButton,
          child: _contentButton(),
          onPressed: onPressed,
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(color: colorButton)
          ),
          child: _contentButton(),
          onPressed: onPressed
      ),
    );
  }

  Widget _contentButton() {
    if(loading) {
      return ProgressCustom();
    }

    return Text(
      label.toUpperCase(),
      style: TextStyle(
          color: colorText,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
