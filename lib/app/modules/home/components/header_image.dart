import 'package:appstore/app/shared/constants.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _image(context),
        _contentImage()
      ],
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/img_top.jpg",
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
      ),
    );
  }

  Widget _buttonMore() {
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
        onPressed: () => null,
      ),
    );
  }

  Widget _contentImage() {
    return Padding(
        padding: EdgeInsets.only(left: 16, top: 280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _textImage("Relógios"),
            _textImage("De qualidade"),
            SizedBox(height: 10,),
            _buttonMore()
          ],
        )
    );
  }
}
