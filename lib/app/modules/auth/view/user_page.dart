import 'package:appstore/app/models/person.dart';
import 'package:appstore/app/shared/components/input_text_costumer.dart';
import 'package:appstore/app/shared/components/icon_back.dart';
import 'package:appstore/app/shared/controllers/user_controller.dart';
import 'package:appstore/app/modules/auth/view/login_page.dart';
import 'package:appstore/app/shared/components/button_personalized.dart';
import 'package:appstore/app/shared/components/dialog_custom.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/dialog.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserPage extends StatefulWidget {

  static const router = "/register";

  final Person person;

  UserPage({this.person});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = UserController(person: widget.person);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      appBar: AppBar(
        elevation: 0,
        leading: IconBack()
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              InputTextCostumer(
                label: "Nome",
                icon: Icons.supervised_user_circle,
                validator: (String value) => _userController.validatorName(value),
                controller: _userController.controllersText[0],
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Documento",
                icon: Icons.account_box,
                validator: (String value) => _userController.validatorDocument(value),
                controller: _userController.controllersText[1],
                enabled: _userController.isEditing == false,
                inputFormatter: [
                  MaskTextInputFormatter(
                      mask: "###.###.###-##"
                  ),
                ]
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Telefone",
                icon: Icons.phone_android,
                validator: (String value) => _userController.validatorPhone(value),
                controller: _userController.controllersText[2],
                inputFormatter: [
                  MaskTextInputFormatter(
                      mask: "(##) #####-####"
                  ),
                ]
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "E-mail",
                icon: Icons.email,
                validator: (String value) => _userController.validatorEmail(value),
                controller: _userController.controllersText[3],
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Senha de Login",
                icon: Icons.remove_red_eye,
                validator: (String value) => _userController.validatorPassword(value),
                controller: _userController.controllersText[4],
              ),
              SizedBox(height: 16,),
              StreamBuilder(
                stream: _userController.loading,
                initialData: false,
                builder: (context, snapshot) {
                  return ButtonPersonalized(
                    label: _userController.isEditing ? "Editar" : "Registrar",
                    loading: snapshot.data,
                    width: MediaQuery.of(context).size.width,
                    colorButton: Constants.COLOR_SECONDARY,
                    onPressed: () => _userController.isEditing ? _onClickEdit() : _onClickRegister(),
                  );
                },
              )
            ],
          ),
        )
      )
    );
  }

  void _onClickEdit() async {
    if(_formKey.currentState.validate()) {
      try {
        _userController.setLoading(true);
        await _userController.edit();
        showDialogCustom(
            context,
            DialogCustom(
              message: "Registro atualizado com êxito :)",
              onCloseDialog: () => Navigator.of(context).pop(),
              messageButton: "Ok",
              dialogCustomError: false,
            )
        );
      } catch(e) {
        showDialogCustom(
            context,
            DialogCustom(
              message: messageError((e)),
              onCloseDialog: () => Navigator.of(context).pop(),
            )
        );
      } finally {
        _userController.setLoading(false);
      }
    }
  }

  void _onClickRegister() async {
    if(_formKey.currentState.validate()) {
      try {
        _userController.setLoading(true);
        await _userController.register();
        showDialogCustom(
            context,
            DialogCustom(
              message: "Olá, seu registro foi efetuado com êxito :)\n\n Vamos Logar?",
              onCloseDialog: () => Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.router, (route) => false),
              messageButton: "Logar",
              dialogCustomError: false,
          )
        );
      } catch(e) {
        showDialogCustom(
            context,
            DialogCustom(
              message: messageError((e)),
              onCloseDialog: () => Navigator.of(context).pop(),
          )
        );
      } finally {
        _userController.setLoading(false);
      }
    }
  }
}
