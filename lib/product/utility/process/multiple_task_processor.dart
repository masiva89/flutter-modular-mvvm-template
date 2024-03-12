/// Bu sınıf, birbirinden bağımsız olarak çalışan ve return type'ları farklı
/// olan iki adet future fonksiyonu aynı anda çalıştırır.
///
/// [T] ve [R] generic type'ları, fonksiyonların return type'larıdır.
///
/// [firstTask] ve [secondTask] fonksiyonları, [T] ve [R] generic type'larına
/// sahip olmalıdır.
///
/// static run() metodu, [firstTask] ve [secondTask] fonksiyonlarını aynı anda
/// çalıştırır ve taskların sonuçlarını T ve R generic type'larına sahip
/// bir [Multiple2TaskProcessorResult] nesnesi olarak döndürür.
final class Multiple2TaskProcessor<T, R> {
  Multiple2TaskProcessor._();

  /// Bu sınıfın tek statik metodu olan [run] metodu, [firstTask] ve [secondTask]
  /// fonksiyonlarını aynı anda çalıştırır ve taskların sonuçlarını T ve R
  /// generic type'larına sahip bir [Multiple2TaskProcessorResult] nesnesi
  /// olarak döndürür.
  static Future<Multiple2TaskProcessorResult<T, R>> run<T, R>({
    required Future<T> Function() firstTask,
    required Future<R> Function() secondTask,
  }) async {
    final firstTaskResult = firstTask();
    final secondTaskResult = secondTask();

    return Multiple2TaskProcessorResult(
      firstTaskResult: await firstTaskResult,
      secondTaskResult: await secondTaskResult,
    );
  }
}

final class Multiple2TaskProcessorResult<T, R> {
  Multiple2TaskProcessorResult({
    required this.firstTaskResult,
    required this.secondTaskResult,
  });

  final T firstTaskResult;
  final R secondTaskResult;
}
