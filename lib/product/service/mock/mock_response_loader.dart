import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular_mvvm/product/service/mock/mock_response_type.dart';
import 'package:vexana/vexana.dart';

/// A class that loads mock responses for testing purposes.
class MockResponseLoader {
  MockResponseLoader._();

  /// Loads a mock response from the specified path.
  ///
  /// The [path] parameter specifies the path of the mock response file.
  /// The [responseType] parameter specifies the type of mock response to load.
  /// Returns a Future that completes with a Map<String, dynamic> representing
  /// the loaded mock response.
  static Future<Map<String, dynamic>> load({
    required String path,
    MockResponseType responseType = MockResponseType.success,
  }) async {
    final response =
        await rootBundle.loadString('${path}_${responseType.name}.json');
    return json.decode(response) as Map<String, dynamic>;
  }

  /// Loads a mock response from the specified path.
  ///
  /// The [path] parameter is the path of the mock response file.
  /// The [responseType] parameter is the type of the mock response, which
  /// defaults to [MockResponseType.success].
  ///
  /// Returns a [Future] that completes with a [Response] object containing the
  /// loaded data, status code, and request options.
  static Future<Response<dynamic>> loadResponse({
    required String path,
    MockResponseType responseType = MockResponseType.success,
  }) async {
    return Response(
      data: await load(path: path, responseType: responseType),
      statusCode: responseType == MockResponseType.success ? 200 : 400,
      requestOptions: RequestOptions(path: path),
    );
  }
}
