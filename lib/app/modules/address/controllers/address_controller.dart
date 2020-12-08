import 'dart:async';

import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/modules/auth/controllers/login_controller.dart';
import 'package:appstore/app/repositories/address_repository.dart';
import 'package:appstore/app/shared/controllers/loading_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';

class AddressController extends LoadingController {

  StreamController<List<Address>> streamList = StreamController<List<Address>>.broadcast();

  LoginController _loginController = BlocProvider.getBloc<LoginController>();
  AddressRepository _addressRepository = AddressRepository();

  String ufSelected = "AC";

  Address address;

  bool get isEditing => address != null;

  List<TextEditingController> controllersText = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  AddressController({this.address}) {
    if(isEditing) {
      controllersText[0].text = address.descricao;
      controllersText[1].text = address.rua;
      controllersText[2].text = address.logradouro;
      controllersText[3].text = address.cidade;
      controllersText[4].text = address.bairro;
      controllersText[5].text = address.cep;
      controllersText[6].text = address.numero;
      ufSelected = address.uf;
    }
  }

  Future<void> insert() async {

    Address _address = Address(
      descricao: controllersText[0].text,
      rua: controllersText[1].text,
      logradouro: controllersText[2].text,
      cidade: controllersText[3].text,
      bairro: controllersText[4].text,
      cep: controllersText[5].text,
      numero: controllersText[6].text,
      uf: ufSelected,
      idPessoa: _loginController.person.id
    );

    await _addressRepository.insert(_address);
  }

  Future<void> update() async {

    Address _address = Address(
        id: this.address.id,
        descricao: controllersText[0].text,
        rua: controllersText[1].text,
        logradouro: controllersText[2].text,
        cidade: controllersText[3].text,
        bairro: controllersText[4].text,
        cep: controllersText[5].text,
        numero: controllersText[6].text,
        uf: ufSelected,
        idPessoa: _loginController.person.id,
        deleted: "0"
    );

    await _addressRepository.update(_address);
  }

  Future<bool> delete() async {

    Address _address = Address(
        id: this.address.id,
        descricao: this.address.descricao,
        rua: this.address.rua,
        logradouro: this.address.logradouro,
        cidade: this.address.cidade,
        bairro: this.address.bairro,
        cep: this.address.cep,
        numero: this.address.numero,
        uf: this.address.uf,
        idPessoa: this.address.idPessoa,
        deleted: "1"
    );

    return await _addressRepository.update(_address);
  }

  Future<List<Address>> getAll() async {

    streamList.add(null);

    try {
      List<Address> result = await _addressRepository.getAll();
      streamList.add(result);
    } catch(e) {
      streamList.addError(e);
    }

    return [];
  }

  void setAddress(Address address) {
    this.address = address;
  }

  void dispose() {
    streamList.close();
  }

  String validatorDescription(String value) {
    if(value.isEmpty) {
      return "Necessário preencher a descricao!";
    }

    return null;
  }

  String validatorRua(String value) {
    if(value.isEmpty) {
      return "Necessário preencher o campo rua!";
    }

    return null;
  }

  String validatorLogradouro(String value) {
    if(value.isEmpty) {
      return "Necessário preencher o campo logradouro!";
    }

    return null;
  }

  String validatorCity(String value) {
    if(value.isEmpty) {
      return "Necessário preencher o campo cidade!";
    }

    return null;
  }

  String validatorBairro(String value) {
    if(value.isEmpty) {
      return "Necessário preencher o campo bairro!";
    }

    return null;
  }

  String validatorNumero(String value) {
    if(value.isEmpty) {
      return "Necessário preencher o campo numero!";
    }

    return null;
  }

  String validatorCEP(String value) {
    if(value.isEmpty) {
      return "Necessário preencher o campo cep!";
    }

    return null;
  }
}