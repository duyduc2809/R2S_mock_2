import 'package:flutter/cupertino.dart';


class Validator {
  static const validEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const invalidEmailString = 'Invalid email!';
  static const validName = r'^[a-z A-Z]+$';
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be as least 8 characters';
    }
    return null;
  }

  // static String? newPasswordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   } else if (value == SQLAccountHelper.currentAccount['password']) {
  //     return 'Is current password';
  //   } else if (value.length < 8) {
  //     return 'Password must be as least 8 characters';
  //   }
  //   return null;
  // }

  static String? confirmPasswordValidator(
      String? value, TextEditingController passwordController) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Password does not match';
    }
    return null;
  }

  // static String? confirmCurrentPasswordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your current password';
  //   } else if (value != SQLAccountHelper.currentAccount['password']) {
  //     return 'Password does not match';
  //   }
  //   return null;
  // }

  // static Future<String?> emailValidator(String? value) async {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   } else if (!RegExp(validEmail).hasMatch(value)) {
  //     return invalidEmailString;
  //   } else if (await _checkEmailExisted(value)) {
  //     return 'Email existed!';
  //   }
  //   return null;
  // }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!RegExp(validEmail).hasMatch(value)) {
      return 'Invalid email!';
    } else {
      return null;
    }
  }

  static Future<bool> emailFieldValidator(String value) async {
    if (value.isEmpty) {
      return false;
    } else if (!RegExp(validEmail).hasMatch(value)) {
      return false;
    } else {
      return true;
    }

  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty || !RegExp(validName).hasMatch(value)) {
      return 'Enter correct name';
    }
    return null;
  }

  static Future<bool> isValidEmail(String value) async {
    return await Future.delayed(
        const Duration(seconds: 1), () => Validator.emailFieldValidator(value));
  }
}
