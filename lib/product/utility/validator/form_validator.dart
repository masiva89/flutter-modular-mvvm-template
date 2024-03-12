import 'dart:developer';

import 'package:flutter_modular_mvvm/product/utility/validator/i_textfield_validator.dart';

/// To validate multiple textfields at once.
class FormValidator {
  /// Form validator constructor.
  const FormValidator({required this.validators});

  final List<ITextFieldValidator> validators;

  bool validate() {
    log('FormValidator.validate()');
    var isValid = true;
    for (final validator in validators) {
      if (!validator.validate()) {
        isValid = false;
      }
    }
    log('isValid: $isValid');

    return isValid;
  }
}
