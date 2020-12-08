import 'package:appstore/app/modules/address/view/address_list.dart';
import 'package:appstore/app/modules/auth/controllers/login_controller.dart';
import 'package:appstore/app/modules/auth/view/login_page.dart';
import 'package:appstore/app/modules/auth/view/user_page.dart';
import 'package:appstore/app/modules/profile/components/menu_user_page.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final LoginController _loginController = BlocProvider.getBloc<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            MenuUserPage(
                Icons.person,
                "Meus Dados",
                    () => Navigator.pushNamed(context, UserPage.router, arguments: _loginController.person)
            ),
            MenuUserPage(
                Icons.shopping_cart,
                "Meus Pedidos",
                    () => print("Pedidos")
            ),
            MenuUserPage(
              Icons.location_on,
              "Endereços",
                  () => Navigator.pushNamed(context, AddressList.router),
            ),
            MenuUserPage(
              Icons.exit_to_app,
              "Sair",
                  () => Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.router, (route) => false),
            )
          ],
        ),
      )
    );
  }
}
