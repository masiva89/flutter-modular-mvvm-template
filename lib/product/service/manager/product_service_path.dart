// Project service path
// ignore_for_file: public_member_api_docs

enum ProductServicePath {
  userV1('user'),
  posts('posts'),
  usersV2('v2/users'),
  signUp('signup'),
  login('login'),
  refreshToken('refresh-token'),
  version('version'),
  homeHeader('home/header'),
  homeSections('home/sections'),
  discover('discover/discover'),
  discoverSearch('discover/search'),
  discoverFilter('discover/filter'),
  interpretations('interpretations/%/'),
  interpretationsContents('interpretations/%/contents/%'),
  interpretationsContentsDelete('interpretations/%/contents/%/delete');

  const ProductServicePath(this.value);
  final String value;

  /// Returns the path with the given parameters.
  ///
  /// Throws an exception if the number of parameters does not match the number
  /// of path parameters in the path.
  ///
  /// Example:
  /// ```dart
  /// ProductServicePath path = ProductServicePath.interpretationsContents;
  /// expect(path.withPathParameters([1, '2']), 'interpretations/1/contents/2');
  /// ```
  String withPathParameters(List<dynamic> values) {
    var path = this.value;
    int pathParamCount = RegExp(r'%').allMatches(path).length;
    if (values.length != pathParamCount) {
      throw Exception(
          'Path parameter count is not equal to path parameter count');
    }
    for (var i = 0; i < values.length; i++) {
      path = path.replaceFirst('%', (values[i]).toString());
    }
    return path;
  }

  String get rawValue => value;
}
