import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  InputDecoration ? decoration;
  TextEditingController controller;
  String? Function(String?)? validation;
  CustomTextField({this.decoration,required this.controller,this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      controller: controller ,
      validator: validation,
    );
  }
}
