import 'package:appstore/app/shared/components/dialog_custom.dart';
import 'package:appstore/app/shared/components/button_personalized.dart';
import 'package:appstore/app/modules/auth/components/field_background.dart';
import 'package:appstore/app/modules/auth/components/line_or.dart';
import 'package:appstore/app/modules/auth/controllers/login_controller.dart';
import 'package:appstore/app/modules/auth/view/register_page.dart';
import 'package:appstore/app/modules/main/view/main_page.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/dialog.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  static const router = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _loginController;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController = BlocProvider.getBloc<LoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.COLOR_PRIMARY,
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
                stream: _loginController.loading,
                initialData: false,
                builder: (context, snapshot) {
                  return ButtonPersonalized(
                    label: "Logar",
                    loading: snapshot.data,
                    width: MediaQuery.of(context).size.width,
                    colorButton: Constants.COLOR_SECONDARY,
                    onPressed: () async {
                      try {
                        _loginController.setLoading(true);
                        await _loginController.login(_emailController.text, _passwordController.text);
                        Navigator.of(context).pushNamedAndRemoveUntil(MainPage.router, (route) => false);
                      } catch(e) {
                        showDialogCustom(
                            context,
                            DialogCustom(message: messageError((e)),)
                        );
                      } finally {
                        _loginController.setLoading(false);
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
                colorText: Colors.black,
                colorButton: Colors.white,
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

