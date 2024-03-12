// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/enums/field_validator_result.dart';
import 'package:flutter_modular_mvvm/product/utility/validator/i_textfield_validator.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/text_field_alert.dart';

@immutable
class ConfirmPasswordValidator extends ITextFieldValidator {
  ConfirmPasswordValidator(this.content);
  final String _errorMessage = 'Şifreler birbiri ile uyuşmuyor.';
  final String _successMessage = 'Şifreler uyuşuyor.';
  /* final String _pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'; */
  String content;

  @override
  String get textController => content;

  Widget? _alertWidget;
  @override
  Widget? get alertWidget => _alertWidget;
  set alertWidget(Widget? value) => _alertWidget = value;

  @override
  bool validate({String? value}) {
    log('validate()', name: 'ConfirmPasswordValidator');
    /* final regExp = RegExp(_pattern); */
    log(
      'content: $content\n password: $value',
      name: 'ConfirmPasswordValidator',
    );
    if (content.isEmpty) {
      log('isEmpty', name: 'ConfirmPasswordValidator');
      alertWidget = TextFieldAlert(
        content: _errorMessage,
        result: FieldValidatorResult.failure,
      );
      return false;
    } else if (content == value) {
      log('valid', name: 'ConfirmPasswordValidator');
      alertWidget = TextFieldAlert(
        content: _successMessage,
        result: FieldValidatorResult.success,
      );
      return true;
    } else {
      log('invalid', name: 'ConfirmPasswordValidator');
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
