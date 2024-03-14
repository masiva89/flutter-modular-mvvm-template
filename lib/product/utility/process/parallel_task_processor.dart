final class ParallelTaskProcessor {
  ParallelTaskProcessor._();

  static Future<void> runParallel(List<Future<void>> tasks) async {
    await Future.wait(tasks);
  }
}
