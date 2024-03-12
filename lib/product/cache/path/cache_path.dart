/// Cache path.
enum CachePath {
  /// Auth cache path.
  auth('auth'),

  /// User cache path.
  user('user');

  /// constructor
  final String value;

  /// Cache path constructor
  const CachePath(this.value);
}
