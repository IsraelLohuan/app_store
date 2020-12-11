
import 'dart:convert';
import 'dart:typed_data';
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:intl/intl.dart';

String dateFormat(String value) {

  DateTime data = DateTime.parse(value);

  return DateFormat('dd/MM/yyyy').format(data);
}

String getEndpointApi(String endpoint) {
  return Constants.API_BASE_URL + endpoint;
}

String messageError(messageException) {
  return messageException.toString().replaceAll("Exception:", "");
}

bool isValidEmail(String email) {
  bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  return isValid;
}

Uint8List getBytesImage(String imageBase64) {
  return base64.decode(imageBase64);
}

String formatNumberInReal(double valor, {bool replace = false}) {

  NumberFormat numberFormat = new NumberFormat("00.00", "pt_BR");

  if(replace) {
    return numberFormat.format(valor).replaceAll("R\$", "");
  }

  return "R\$ " + numberFormat.format(valor);
}

String getPercentualValue(double valueTotal, double valueDiscount) {
  double value = valueDiscount * 100;
  double result = value/valueTotal;
  return result.toStringAsFixed(2);
}

int getTypeCard(Product product) {
  if(product.desconto > 0)
    return Constants.TYPE_CARD_PROMOTIONAL;

  if(product.destaque)
    return Constants.TYPE_CARD_FEATURED;

  return Constants.TYPE_CARD_GENERAL;
}
