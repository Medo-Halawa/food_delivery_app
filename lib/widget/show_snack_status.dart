import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void showSnackBar(BuildContext context, String text ,Color backgroundColor ) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor:backgroundColor,
    textColor: Colors.white,
  );
}