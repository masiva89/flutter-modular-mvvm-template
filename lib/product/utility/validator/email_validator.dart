// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/decoration/enums/field_validator_result.dart';
import 'package:flutter_modular_mvvm/product/utility/validator/i_textfield_validator.dart';
import 'package:flutter_modular_mvvm/product/widget/alert/text_field_alert.dart';

class EmailValidator extends ITextFieldValidator {
  EmailValidator(this.content);

  final String _errorMessage = 'Lütfen geçerli bir e-posta adresi giriniz.';
  final String _successMessage = 'E-posta adresi geçerli.';
  final String _pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  String content;

  @override
  String get textController => content;

  Widget? _alertWidget;
  @override
  Widget? get alertWidget => _alertWidget;
  set alertWidget(Widget? value) => _alertWidget = value;

  @override
  bool validate({String? value}) {
    log('validate()', name: 'EmailValidator');
    final regExp = RegExp(_pattern);
    if (content.isEmpty) {
      log('isEmpty', name: 'EmailValidator');
      alertWidget = TextFieldAlert(
        content: _errorMessage,
        result: FieldValidatorResult.failure,
      );
      return false;
    } else if (regExp.hasMatch(content)) {
      log('valid', name: 'EmailValidator');
      alertWidget = TextFieldAlert(
        content: _successMessage,
        result: FieldValidatorResult.success,
      );
      return true;
    } else {
      log('invalid', name: 'EmailValidator');
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
