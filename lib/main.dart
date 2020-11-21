import 'package:appstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:appstore/app/modules/auth/view/login_page.dart';
import 'package:appstore/app/modules/auth/view/register_page.dart';
import 'package:appstore/app/modules/details/view/details_page.dart';
import 'package:appstore/app/modules/main/view/main_page.dart';
import 'package:appstore/app/shared/controllers/product_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => AuthController()), Bloc((i) => ProductController())],
      child: MaterialApp(
        title: 'MaxClock App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Constants.COLOR_PRIMARY),
        initialRoute: LoginPage.router,
        routes: {
          LoginPage.router: (_) => LoginPage(),
          RegisterPage.router: (_) => RegisterPage(),
          MainPage.router: (_) => MainPage(),
          DetailsPage.router: (context) => DetailsPage(product: ModalRoute.of(context).settings.arguments,)
        },
      ),
    );
  }
}
