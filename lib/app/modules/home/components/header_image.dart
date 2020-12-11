import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _image(context),
        _contentImage(context)
      ],
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/img_top.png",
        fit: BoxFit.fill,
      ),
      width: MediaQuery.of(context).size.width,
      height: 400,
    );
  }

  Widget _textImage(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Alfa Slab One',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400
      ),
    );
  }

  Widget _buttonMore(BuildContext context) {
    return Container(
      width: 150,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "SAIBA MAIS",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        color: Constants.COLOR_SECONDARY,
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("MaxClock Relógios"),
              content: Text("Nossos relógios possuem qualidade e valores acessíveis, entregamos na porta da sua casa para maior comodidade! Ficou interessado ? fique por dentro das novidades em nosso APP :)"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok, obrigado.", style: TextStyle(color: Constants.COLOR_PRIMARY),),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _contentImage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, top: 275),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _textImage("Relógios"),
            _textImage("de qualidade"),
            SizedBox(height: 5,),
            _buttonMore(context)
          ],
        )
    );
  }
}
