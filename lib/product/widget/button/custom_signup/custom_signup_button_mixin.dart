part of 'custom_signup_button.dart';

mixin _CustomSignupButtonMixin
    on MountedMixin<CustomSignupButton>, State<CustomSignupButton> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _isLoadingNotifier.value = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onPressed(BuildContext context) async {
    _isLoadingNotifier.value = true;
    final response = await widget.onOperation.call();
    await safeOperation(() async {
      if (response) {
        try {
          // TODO: Complete the function.
          //await context.router.replaceAll([const AuthNavRoute()]);
        } catch (e) {
          print(e);
        }
      }
      _isLoadingNotifier.value = false;
    });
  }
}
