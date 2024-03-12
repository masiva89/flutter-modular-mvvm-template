// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prod_env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _ProdEnv {
  static const List<int> _enviedkey_baseUrl = [
    3296530641,
    4187822136,
    2613932309,
    182778428,
    4068153895,
    3250528932,
    282280511,
    1918004737,
    604001361,
    3494412827
  ];
  static const List<int> _envieddata_baseUrl = [
    3296530614,
    4187822167,
    2613932410,
    182778459,
    4068153931,
    3250528961,
    282280465,
    1918004834,
    604001342,
    3494412918
  ];
  static final String _baseUrl = String.fromCharCodes(
    List.generate(_envieddata_baseUrl.length, (i) => i, growable: false)
        .map((i) => _envieddata_baseUrl[i] ^ _enviedkey_baseUrl[i])
        .toList(growable: false),
  );
}
