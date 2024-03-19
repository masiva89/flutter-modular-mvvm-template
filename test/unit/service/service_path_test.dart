import 'package:flutter_modular_mvvm/product/service/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Service Path Tests", () {
    test('Path without qParams', () {
      ProductServicePath path = ProductServicePath.userV1;
      expect(path.rawValue, 'user');
    });
    test('Path with qParams | expected success', () {
      ProductServicePath path = ProductServicePath.interpretationsContents;
      expect(path.withPathParameters([1, '2']), 'interpretations/1/contents/2');
    });
    test('Path with qParams | expected failure (not match value length)', () {
      ProductServicePath path = ProductServicePath.interpretationsContents;
      expect(() => path.withPathParameters([1]), throwsException);
    });
  });
}
