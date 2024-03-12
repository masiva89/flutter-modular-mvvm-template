/// Mock response type.
enum MockResponseType {
  /// Success
  success,

  /// Failure
  failure,

  /// Empty
  empty,
}

/* extension MockResponseTypeExtension on MockResponseType {
  /// Returns the corresponding HTTP status code.
  int get statusCode {
    switch (this) {
      case MockResponseType.success:
        return 200;
      case MockResponseType.error:
        return 400;
      case MockResponseType.empty:
        return 204;
    }
  }
} */
