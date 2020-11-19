
import 'package:flutter/material.dart';

void showDialogCustom(BuildContext context, Widget child) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => child
  );
}