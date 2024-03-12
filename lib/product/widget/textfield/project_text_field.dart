// ignore_for_file: public_member_api_docs, avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/index.dart';
import 'package:flutter_modular_mvvm/product/utility/validator/i_textfield_validator.dart';
import 'package:widget/widgets.dart';

/// Project textfield.
class ProjectTextField extends StatefulWidget {
  /// Project textfield constructor.
  const ProjectTextField({
    required this.controller,
    required this.isPassword,
    required this.label,
    required this.hintText,
    super.key,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.prefixIcon,
    this.validator,
    this.isActive = true,
    this.onValidate,
  });

  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final SvgGenImage? prefixIcon;
  final ITextFieldValidator? validator;
  final bool isActive;
  // ignore: inference_failure_on_function_return_type
  final Function(bool)? onValidate;

  @override
  State<ProjectTextField> createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  final Color primaryColor = ColorName.primary2;
  final Color secondaryColor = ColorName.backgroundSecondary;
  final Color tertiaryColor = ColorName.primary3;

  bool _isObscure = true;
  late ITextFieldValidator? _validator;

  @override
  void initState() {
    super.initState();
    _validator = widget.validator;
  }

  @override
  Widget build(BuildContext context) {
    final pads = TextFieldSizes(
      fontSize: FontSizes.subtitle1.responsive(context),
      iconSize: ProjectSize.large.responsive(context),
      radius: ProjectRadius.medium.responsive(context),
      padding: EdgeInsets.all(ProjectSize.small.responsive(context)),
    );
    return Stack(
      children: [
        CustomTextfield(
          errorWidget: _validator?.alertWidget,
          prefixIcon: widget.prefixIcon?.svg(package: 'gen'),
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          onChanged: (value) {
            widget.onChanged?.call(value);
            final validation = _validator?.onUpdate(value);
            setState(() {});
            widget.onValidate?.call(validation ?? false);
          },
          onSubmitted: (p0) {
            final validation = _validator?.validate();
            setState(() {});
            widget.onValidate?.call(validation ?? false);
          },
          textInputAction: widget.textInputAction,
          isPassword: widget.isPassword,
          controller: widget.controller,
          label: widget.label,
          hintText: widget.hintText,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          tertiaryColor: tertiaryColor,
          isObscure: widget.isPassword && _isObscure,
          suffixIcon: ObscureWidget(
            onTap: () => setState(() {
              _isObscure = !_isObscure;
            }),
            isObscure: _isObscure,
          ),
          pads: pads,
          textStyle: TextStyles.subtitle1(context),
          hintStyle: TextStyles.subtitle1(context, color: ColorName.primary2),
          labelStyle: TextStyles.subtitle1(context, color: ColorName.primary),
        ),
        if (!widget.isActive) ...{
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: ProjectRadius.medium.radius(context),
                color: ColorName.backgroundPrimary.withOpacity(0.2),
              ),
            ),
          ),
        },
      ],
    );
  }
}

/// Obscure widget.
class ObscureWidget extends StatefulWidget {
  /// Obscure widget constructor.
  const ObscureWidget({
    required this.isObscure,
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  final bool isObscure;

  @override
  State<ObscureWidget> createState() => _ObscureWidgetState();
}

class _ObscureWidgetState extends State<ObscureWidget> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    print('initState');
    print(widget.isObscure);
    _isObscure = widget.isObscure;
  }

  @override
  void didUpdateWidget(covariant ObscureWidget oldWidget) {
    print('oldWidget.isObscure != widget.isObscure');
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isObscure != widget.isObscure) {
      _isObscure = widget.isObscure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _isObscure
            ? Assets.icons.visibility.svg(
                package: 'gen',
                colorFilter: const ColorFilter.mode(
                  ColorName.primary2,
                  BlendMode.srcIn,
                ),
              )
            : Assets.icons.visibilityOff.svg(
                package: 'gen',
                colorFilter: const ColorFilter.mode(
                  ColorName.primary2,
                  BlendMode.srcIn,
                ),
              ),
      ),
    );
  }
}
