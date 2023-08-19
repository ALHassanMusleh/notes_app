import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    {Color? backgroundcolor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: backgroundcolor,
  ));
}
