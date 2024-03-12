// Project service path
// ignore_for_file: public_member_api_docs

enum ProductServicePath {
  userV1('user'),
  posts('posts'),
  usersV2('v2/users'),
  signUp('signup'),
  login('login'),
  version('version'),
  homeHeader('home/header'),
  homeSections('home/sections'),
  discover('discover/discover'),
  discoverSearch('discover/search'),
  discoverFilter('discover/filter');

  const ProductServicePath(this.value);
  final String value;

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }

  String get rawValue => value;
}
