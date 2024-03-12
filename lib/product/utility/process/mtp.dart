/* /// Bu sınıf, birbirinden bağımsız olarak çalışan ve return type'ları farklı
/// olan n adet future fonksiyonu aynı anda çalıştırır.
///
/// [T] ve [R] generic type'ları, fonksiyonların return type'larıdır.
///
/// [firstTask] ve [secondTask] fonksiyonları, [T] ve [R] generic type'larına
/// sahip olmalıdır.
///
/// run() metodu, [firstTask] ve [secondTask] fonksiyonlarını aynı anda
/// çalıştırır ve taskların sonuçlarını T ve R generic type'larına sahip
/// bir [Multiple2TaskProcessorResult] nesnesi olarak döndürür. */