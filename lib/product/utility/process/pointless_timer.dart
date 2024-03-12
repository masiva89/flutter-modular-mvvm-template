import 'dart:async';

/// A timer that completes a future after a specified duration.
class PointlessTimer {
  /// Creates a new [PointlessTimer] instance.
  ///
  /// The [d] parameter is required.
  PointlessTimer(Duration d) {
    _timer = Timer(d, _completer.complete);
  }

  late final Timer _timer;
  final _completer = Completer<dynamic>();

  /// The future that completes when the timer finishes.
  Future<dynamic> get future => _completer.future;

  /// Cancels the timer and completes the future immediately.
  void cancel() {
    _timer.cancel();
    _completer.complete();
  }
}
