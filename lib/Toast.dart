import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessage(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: const Color.fromARGB(255, 247, 0, 0),
    textColor: const Color.fromARGB(255, 0, 0, 0),
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 4,

  );
}