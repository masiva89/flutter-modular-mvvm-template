// ignore_for_file: unused_field, inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:widget/src/core/textfield_pads.dart';

/// A custom text field widget with customizable properties.
///
/// This widget provides a text field with various customization options such as
/// prefix and suffix icons, password visibility, label and hint text styles,
/// primary and secondary colors, and more.
///
/// Example usage:
/// ```dart
/// TestCustomTextfield(
///   isPassword: true,
///   controller: _passwordController,
///   label: 'Password',
///   hintText: 'Enter your password',
///   primaryColor: Colors.blue,
///   secondaryColor: Colors.white,
///   tertiaryColor: Colors.grey,
///   pads: TextFieldSizes(
///     padding: EdgeInsets.all(10),
///     fontSize: 16,
///     iconSize: 24,
///     radius: 8,
///   ),
///   textStyle: TextStyle(fontSize: 16),
///   hintStyle: TextStyle(color: Colors.grey),
///   labelStyle: TextStyle(color: Colors.blue),
///   isObscure: true,
///   errorWidget: Icon(Icons.error),
///   onChanged: (value) {
///     // Handle text field value change
///   },
///   onSubmitted: (value) {
///     // Handle text field submission
///   },
/// )
/// ```
class CustomTextfield extends StatefulWidget {
  /// Creates a [CustomTextfield].
  const CustomTextfield({
    required this.isPassword,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.pads,
    required this.textStyle,
    required this.hintStyle,
    required this.labelStyle,
    required this.isObscure,
    required this.errorWidget,
    super.key,
    this.prefixIcon,
    this.focusNode,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.suffixIcon,
    this.onSubmitted,
  });

  /// The prefix icon.
  final Widget? prefixIcon;

  /// The suffix icon.
  final Widget? suffixIcon;

  /// Whether the text field is a password field.
  final bool isPassword;

  /// The text field controller.
  final TextEditingController controller;

  /// The focus node.
  final FocusNode? focusNode;

  /// The label text.
  final String label;

  /// The hint text.
  final String hintText;

  /// The callback function when the text field value changes.
  final Function(String)? onChanged;

  /// The callback function when the text field is submitted.
  final Function(String)? onSubmitted;

  /// The text input action.
  final TextInputAction? textInputAction;

  /// The keyboard type.
  final TextInputType? keyboardType;

  /// The primary color.
  final Color primaryColor;

  /// The secondary color.
  final Color secondaryColor;

  /// The tertiary color.
  final Color tertiaryColor;

  /// The text field sizes.
  final TextFieldSizes pads;

  /// The text style.
  final TextStyle textStyle;

  /// The hint text style.
  final TextStyle hintStyle;

  /// The label text style.
  final TextStyle labelStyle;

  /// Whether the text field is obscured.
  final bool isObscure;

  /// The error widget.
  final Widget? errorWidget;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late TextEditingController _controller = TextEditingController();

  late FocusNode? _focusNode;
  late bool _isPassword;
  late String _label;
  late String _hintText;
  late Function(String)? _onChanged;
  late Function(String)? _onSubmitted;
  late TextInputAction? _textInputAction;
  late TextInputType? _keyboardType;
  late Widget? _prefixIcon;
  late Widget? _suffixIcon;
  late Color _primaryColor;
  late Color _secondaryColor;
  late Color _tertiaryColor;
  late TextFieldSizes _pads;
  late TextStyle _textStyle;
  late TextStyle _hintStyle;
  late TextStyle _labelStyle;
  late bool _isObscure;
  late Widget? _errorWidget;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _isPassword = widget.isPassword;
    _label = widget.label;
    _hintText = widget.hintText;
    _onChanged = widget.onChanged;
    _onSubmitted = widget.onSubmitted;
    _textInputAction = widget.textInputAction;
    _keyboardType = widget.keyboardType;
    _prefixIcon = widget.prefixIcon;
    _suffixIcon = widget.suffixIcon;
    _focusNode = widget.focusNode;
    _primaryColor = widget.primaryColor;
    _secondaryColor = widget.secondaryColor;
    _tertiaryColor = widget.tertiaryColor;
    _pads = widget.pads;
    _textStyle = widget.textStyle;
    _hintStyle = widget.hintStyle;
    _labelStyle = widget.labelStyle;
    _isObscure = widget.isObscure;
    _errorWidget = widget.errorWidget;
  }

  @override
  void didUpdateWidget(covariant CustomTextfield oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller = widget.controller;
    }
    if (oldWidget.hintText != widget.hintText) {
      _hintText = widget.hintText;
    }
    if (oldWidget.label != widget.label) {
      _label = widget.label;
    }
    if (oldWidget.textInputAction != widget.textInputAction) {
      _textInputAction = widget.textInputAction;
    }
    if (oldWidget.isObscure != widget.isObscure) {
      _isObscure = widget.isObscure;
    }
    if (oldWidget.errorWidget != widget.errorWidget) {
      _errorWidget = widget.errorWidget;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: _primaryColor,
      onChanged: _onChanged,
      onSubmitted: _onSubmitted,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      style: _textStyle,
      focusNode: _focusNode,
      cursorHeight: _pads.fontSize,
      decoration: InputDecoration(
        error: _errorWidget,
        hintText: widget.hintText,
        hintStyle: _hintStyle,
        contentPadding: _pads.padding,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: _pads.padding?.left ?? 0),
          child: _prefixIcon,
        ),
        prefixIconColor: _tertiaryColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: _pads.iconSize ?? 0,
        ),
        suffixIconColor: _primaryColor,
        suffixIcon: _isPassword
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _pads.padding?.left ?? 0),
                child: _suffixIcon,
              )
            : null,
        constraints: BoxConstraints(
          minHeight: _pads.iconSize ?? 0,
        ),
        filled: true,
        fillColor: _secondaryColor,
        label: Text(
          _label,
          style: _labelStyle,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(_pads.radius ?? 20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _primaryColor),
          borderRadius: BorderRadius.circular(_pads.radius ?? 20),
        ),
      ),
    );
  }
}
