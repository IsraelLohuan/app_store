import 'package:appstore/app/modules/auth/view/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

  static const router = "splashpage";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
        () =>  Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.router, (route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.jpeg"
    );
  }
}
