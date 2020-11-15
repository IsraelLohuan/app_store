import 'package:appstore/app/components/dialog_custom.dart';
import 'package:appstore/app/modules/auth/components/button_personalized.dart';
import 'package:appstore/app/modules/auth/components/field_background.dart';
import 'package:appstore/app/modules/auth/components/line_or.dart';
import 'package:appstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:appstore/app/modules/auth/view/register_page.dart';
import 'package:appstore/app/modules/home/view/home_page.dart';
import 'package:appstore/app/shared/constants.dart';
import 'package:appstore/app/shared/dialog.dart';
import 'package:appstore/app/shared/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  static const router = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AuthController _authController;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authController = BlocProvider.getBloc<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(right: 25, left: 25, top: 70),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 18,),

              FieldBackground(
                label: "Email",
                sufixIcon: Icon(Icons.email),
                controller: _emailController,
              ),

              SizedBox(height: 16,),

              FieldBackground(
                label: "Senha",
                sufixIcon: Icon(Icons.lock),
                controller: _passwordController,
              ),

              SizedBox(height: 16,),

              StreamBuilder(
                stream: _authController.loading,
                initialData: false,
                builder: (context, snapshot) {
                  return ButtonPersonalized(
                    label: "Logar",
                    loading: snapshot.data,
                    width: MediaQuery.of(context).size.width,
                    colorButton: Constants.COLOR_PRIMARY,
                    onPressed: () async {
                      try {
                        await _authController.login(_emailController.text, _passwordController.text);
                        Navigator.of(context).pushNamedAndRemoveUntil(HomePage.router, (route) => false);
                      } catch(e) {
                        showDialogCustom(
                            context,
                            DialogCustom(message: messageError((e)),)
                        );
                        _authController.setLoading(false);
                      }
                    },
                  );
                },
              ),

              SizedBox(height: 16,),

              LineOr(),

              SizedBox(height: 16,),

              ButtonPersonalized(
                label: "Registrar",
                colorText: Constants.COLOR_PRIMARY,
                colorButton: Constants.COLOR_PRIMARY,
                width: MediaQuery.of(context).size.width,
                onPressed: () => Navigator.of(context).pushNamed(RegisterPage.router),
                borderLine: true,
              )
            ],
          ),
        )
    );
  }
}

