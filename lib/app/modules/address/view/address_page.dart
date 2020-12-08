import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/modules/address/components/dropdown_uf.dart';
import 'package:appstore/app/modules/address/controllers/address_controller.dart';
import 'package:appstore/app/shared/components/button_personalized.dart';
import 'package:appstore/app/shared/components/dialog_custom.dart';
import 'package:appstore/app/shared/components/icon_back.dart';
import 'package:appstore/app/shared/components/input_text_costumer.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/dialog.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {

  static const router = "/addresspage";

  final Address address;

  AddressPage({this.address});

  @override
  _AddressAddState createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddressController _addressController;

  AddressController addressController = BlocProvider.getBloc<AddressController>();

  @override
  void initState() {
    super.initState();
    _addressController = AddressController(address: widget.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_PRIMARY,
      appBar: AppBar(
        elevation: 0,
        leading: IconBack(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              InputTextCostumer(
                label: "Descricao (Ex: Casa/Empresa)",
                icon: Icons.location_on,
                validator: (String value) => _addressController.validatorDescription(value),
                controller: _addressController.controllersText[0],
              ),
              InputTextCostumer(
                label: "Rua",
                icon: Icons.location_on,
                validator: (String value) => _addressController.validatorRua(value),
                controller: _addressController.controllersText[1],
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Logradouro",
                icon: Icons.location_on,
                validator: (String value) => _addressController.validatorLogradouro(value),
                controller: _addressController.controllersText[2],
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Cidade",
                icon: Icons.location_on,
                validator: (String value) => _addressController.validatorCity(value),
                controller: _addressController.controllersText[3],
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Bairro",
                icon: Icons.location_on,
                validator: (String value) => _addressController.validatorBairro(value),
                controller: _addressController.controllersText[4],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 120,
                    child: InputTextCostumer(
                      label: "CEP",
                      icon: Icons.location_on,
                      validator: (String value) => _addressController.validatorCEP(value),
                      controller: _addressController.controllersText[5],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: DropdownUf(_addressController),
                  )
                ],
              ),
              SizedBox(height: 16,),
              InputTextCostumer(
                label: "Numero",
                icon: Icons.location_on,
                validator: (String value) => _addressController.validatorNumero(value),
                controller: _addressController.controllersText[6],
              ),
              SizedBox(height: 16,),
              ButtonPersonalized(
                label: _addressController.isEditing ? "Atualizar" : "Registrar",
                width: MediaQuery.of(context).size.width,
                colorButton: Constants.COLOR_SECONDARY,
                onPressed: () async {
                   _addressController.isEditing ? await _onClickUpdate() : await _onClickRegister();
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _onClickUpdate() async {
    if(formKey.currentState.validate()) {
      try {
        _addressController.setLoading(true);
        await _addressController.update();
        showDialogCustom(
            context,
            DialogCustom(
              message: "Endereco atualizado com sucesso!",
              onCloseDialog: () {
                Navigator.pop(context);
                addressController.getAll();
              },
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
        _addressController.setLoading(false);
      }
    }
  }

  Future _onClickRegister() async {
    if(formKey.currentState.validate()) {
      try {
        _addressController.setLoading(true);
        await _addressController.insert();
        showDialogCustom(
            context,
            DialogCustom(
              message: "Endereco cadastrado com sucesso!",
              onCloseDialog: () {
                Navigator.pop(context);
                addressController.getAll();
              },
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
        _addressController.setLoading(false);
      }
    }
  }
}
