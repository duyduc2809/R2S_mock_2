import 'package:flutter/material.dart';

import '../constants/dimension_const.dart';

//custom lại decoration cho các textField
class CustomInputDecoration extends InputDecoration {
  CustomInputDecoration({
    String? labelText,
    String? hintText,
    Icon? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
  }) : super(
    constraints: BoxConstraints(maxHeight: 70, minHeight: 47),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabled: enabled,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kMinPadding),
          ),
// Customize the properties below according to your needs
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kMinPadding),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kMinPadding),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kMinPadding),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
// labelStyle: const TextStyle(color: Colors.green),
// hintStyle: const TextStyle(color: Colors.grey),
        );
}
