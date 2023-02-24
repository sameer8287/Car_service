import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Toasts
{
  void messages(String mess)
  {
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}