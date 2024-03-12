// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/enums/field_validator_result.dart';
import 'package:flutter_modular_mvvm/product/utility/validator/i_textfield_validator.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/text_field_alert.dart';

class UsernameValidator extends ITextFieldValidator {
  UsernameValidator(this.content);
  final String _errorMessage =
      'Kullanıcı adı en az 3 karakterden oluşmalı ve özel karakter içermemelidir.';
  final String _successMessage = 'Kullanıcı adı geçerli.';
  final String _pattern = r'^[a-zA-Z0-9]{3,}$';
  String content;

  @override
  String get textController => content;

  Widget? _alertWidget;
  @override
  Widget? get alertWidget => _alertWidget;
  set alertWidget(Widget? value) => _alertWidget = value;

  @override
  bool validate({String? value}) {
    log('validate()', name: 'UsernameValidator');
    final regExp = RegExp(_pattern);
    if (content.isEmpty) {
      log('isEmpty', name: 'UsernameValidator');
      alertWidget = TextFieldAlert(
        content: _errorMessage,
        result: FieldValidatorResult.failure,
      );
      return false;
    } else if (regExp.hasMatch(content)) {
      log('valid', name: 'UsernameValidator');
      alertWidget = TextFieldAlert(
        content: _successMessage,
        result: FieldValidatorResult.success,
      );
      return true;
    } else {
      log('invalid', name: 'UsernameValidator');
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
