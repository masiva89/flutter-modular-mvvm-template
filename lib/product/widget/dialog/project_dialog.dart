import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:widget/widgets.dart';

/// A dialog widget for displaying a confirmation message with customizable
/// options.
///
/// This dialog widget provides a convenient way to display a confirmation
/// message with customizable title, content, button texts, button colors,
/// and more. It is typically used to prompt the user for confirmation
/// before performing a critical action.
///
/// Example usage:
/// ```dart
/// final result = await ProjectDialog.show(
///   context: context,
///   title: 'Uyarı',
///   content: 'İşlemi gerçekleştirmek istediğinize emin misiniz?',
///   closeButtonText: 'Kapat',
///   checkButtonText: 'Tamam',
///   checkColor: ColorName.primary,
///   closeColor: Colors.grey,
///   showActionIcons: true,
/// );
/// ```
class ProjectDialog {
  const ProjectDialog._();

  /// Displays the project dialog.
  ///
  /// Returns a [Future] that completes with the user's choice:
  /// - `true` if the user taps the check button.
  /// - `false` if the user taps the close button or dismisses the dialog.
  static Future<bool> showOptionDialog({
    required BuildContext context,
    String title = 'Uyarı',
    String content = 'İşlemi gerçekleştirmek istediğinize emin misiniz?',
    String closeButtonText = 'Kapat',
    String checkButtonText = 'Tamam',
    Color checkColor = ColorName.primary,
    Color? closeColor,
    bool showActionIcons = false,
  }) async {
    return await OptionDialog.show(
          context: context,
          closeButtonText: closeButtonText,
          checkButtonText: checkButtonText,
          closeColor: closeColor,
          checkColor: checkColor,
          title: title,
          message: content,
          showActionIcons: showActionIcons,
        ) ??
        false;
  }

  /// Shows a success dialog with the given [title] and [content].
  ///
  /// The [context] parameter is required and represents the build context.
  /// The [title] parameter is optional and defaults to 'Başarılı'.
  /// The [content] parameter is optional and defaults to 'İşlem başarıyla gerçekleştirildi.'.
  ///
  /// Example usage:
  /// ```dart
  /// await ProjectDialog.showSuccessDialog(
  ///   context: context,
  ///   title: 'Başarılı',
  ///   content: 'İşlem başarıyla gerçekleştirildi.',
  /// );
  /// ```
  static Future<void> showSuccessDialog({
    required BuildContext context,
    String title = 'Başarılı!',
    String content = 'İşlem başarıyla gerçekleştirildi.',
  }) async {
    await SuccessDialog.show(
      context: context,
      title: 'Başarılı',
    );
  }

  /// Shows a question dialog with the specified parameters.
  ///
  /// Returns a [Future] that resolves to a [QuestionAnswer] object.
  /// The [context] parameter is required and represents the build context.
  /// The [question] parameter is required and represents the dialog title.
  ///
  /// Example usage:
  /// ```dart
  /// QuestionAnswer answer = await ProjectDialog.showQuestionDialog(
  ///   context: context,
  ///   title: 'What is your favorite color?',
  /// );
  /// ```
  static Future<QuestionAnswer> showQuestionDialog({
    required BuildContext context,
    required String question,
  }) async {
    return await QuestionDialog.show(
          context: context,
          title: question,
        ) ??
        QuestionAnswer.empty();
  }
}
