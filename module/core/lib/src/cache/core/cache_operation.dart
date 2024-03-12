import 'package:core/src/cache/core/cache_model.dart';

/// The CacheOperation class is an
/// abstract class for cache operations.
abstract class CacheOperation<T extends CacheModel> {
  /// Add item to cache
  void add(T item);

  /// Add all items to cache
  void addAll(List<T> items);

  /// Remove item from cache
  void remove(String id);

  /// Clear cache
  void clear();

  /// Get all items from cache
  List<T> getAll();

  /// Get item from cache
  T? get(String id);
}
