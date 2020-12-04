import 'package:appstore/app/modules/auth/components/input_text_register.dart';
import 'package:appstore/app/modules/auth/controllers/register_controller.dart';
import 'package:appstore/app/shared/components/button_personalized.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {

  static const router = "/register";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              InputTextRegister(
                label: "Nome",
                icon: Icons.supervised_user_circle,
                validator: (String value) => _registerController.validatorName(value),
              ),
              SizedBox(height: 16,),
              InputTextRegister(
                label: "Documento",
                icon: Icons.account_box,
                validator: (String value) => _registerController.validatorDocument(value),
              ),
              SizedBox(height: 16,),
              InputTextRegister(
                label: "Telefone",
                icon: Icons.phone_android,
                validator: (String value) => _registerController.validatorPhone(value),
                inputFormatter: [
                  MaskTextInputFormatter(
                      mask: "(##) #####-####"
                  ),
                ]
              ),
              SizedBox(height: 16,),
              InputTextRegister(
                label: "E-mail",
                icon: Icons.email,
                validator: (String value) => _registerController.validatorEmail(value),
              ),
              SizedBox(height: 16,),
              InputTextRegister(
                label: "Senha de Login",
                icon: Icons.remove_red_eye,
                validator: (String value) => _registerController.validatorPassword(value),
              ),
              SizedBox(height: 16,),
              ButtonPersonalized(
                label: "Registrar",
                width: MediaQuery.of(context).size.width,
                colorButton: Constants.COLOR_SECONDARY,
                onPressed: () {
                  if(_formKey.currentState.validate()) {

                  }
                },
              )
            ],
          ),
        )
      )
    );
  }
}
