import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/enums/field_validator_result.dart';
import 'package:flutter_modular_mvvm/product/utility/validator/i_textfield_validator.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/text_field_alert.dart';

class PasswordValidator extends ITextFieldValidator {
  PasswordValidator(this.content);
  final String _errorMessage =
      'Şifre en az 8 karakterden oluşmalı ve en az 1 büyük harf, 1 küçük harf, 1 rakam ve 1 özel karakter içermelidir.';
  final String _successMessage = 'Password is valid.';
  final String _pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  String content;

  @override
  String get textController => content;

  Widget? _alertWidget;
  @override
  Widget? get alertWidget => _alertWidget;
  set alertWidget(Widget? value) => _alertWidget = value;

  @override
  bool validate({String? value}) {
    log('validate()', name: 'PasswordValidator');
    final regExp = RegExp(_pattern);
    if (content.isEmpty) {
      log('isEmpty', name: 'PasswordValidator');
      alertWidget = TextFieldAlert(
        content: _errorMessage,
        result: FieldValidatorResult.failure,
      );
      return false;
    } else if (regExp.hasMatch(content)) {
      log('valid', name: 'PasswordValidator');
      alertWidget = TextFieldAlert(
        content: _successMessage,
        result: FieldValidatorResult.success,
      );
      return true;
    } else {
      log('invalid', name: 'PasswordValidator');
      alertWidget = TextFieldAlert(
        content: _errorMessage,
        result: FieldValidatorResult.failure,
      );
      return false;
    }
  }

  @override
  bool onUpdate(String value) {
    print('onUpdate');
    content = value;
    return validate();
  }
}
