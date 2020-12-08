import 'package:appstore/app/modules/address/controllers/address_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class DropdownUf extends StatefulWidget {

  final AddressController addressController;

  DropdownUf(this.addressController);

  @override
  _DropdownUfState createState() => _DropdownUfState();
}

class _DropdownUfState extends State<DropdownUf> {

  AddressController get _addressController => widget.addressController;

  final ufs = [
    "AC",
    "AL",
    "AP",
    "AM",
    "BA",
    "CE",
    "DF",
    "ES",
    "GO",
    "MA",
    "MT",
    "MS",
    "MG",
    "PA",
    "PB",
    "PR",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SP",
    "SE",
    "TO"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Constants.COLOR_PRIMARY,
      items: ufs.map((uf) {
        return DropdownMenuItem(
          onTap: () => print("..."),
          child: Text(
            uf,
            style: TextStyle(
                color: Colors.white
            ),
          ),
          value: uf,
        );
      }).toList(),
      value: _addressController.ufSelected,
      onChanged: (String uf) => setState(() => _addressController.ufSelected = uf),
    );
  }
}
