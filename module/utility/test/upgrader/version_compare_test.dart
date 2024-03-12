import 'package:flutter_test/flutter_test.dart';
import 'package:utility/src/upgrader/enum/upgrade_requirement_type.dart';
import 'package:utility/src/upgrader/extension/version_extension.dart';
import 'package:utility/src/upgrader/upgrader.dart';

void main() {
  group('Version Comparison Tests', () {
    test('checks if version is lower than', () {
      String version1 = '1.9.5';
      String version2 = '2.0.0';

      expect(version1.isLowerThan(version2), isTrue);
    });

    test('checks if version is greater than', () {
      String version1 = '2.0.0';
      String version2 = '1.0.0';

      expect(version1.isGreaterThan(version2), isTrue);
    });

    test('checks if version is equal to', () {
      String version1 = '1.0.0';
      String version2 = '1.0.0';

      expect(version1.isEqualTo(version2), isTrue);
    });

    test('checks if version is lower or equal to', () {
      String version1 = '1.0.0';
      String version2 = '1.0.0';

      expect(version1.isLowerOrEqualTo(version2), isTrue);
    });

    test('checks if version is greater or equal to', () {
      String version1 = '1.0.0';
      String version2 = '1.0.0';

      expect(version1.isGreaterOrEqualTo(version2), isTrue);
    });
  });

  group('Upgrader Test', () {
    test('checks upgrade requirement [canUpgrade]', () {
      Upgrader upgrader = Upgrader();

      String minVersion = '1.0.0';
      String maxVersion = '1.2.0';
      String currentVersion = '1.0.0';

      expect(
        upgrader.checkUpgradeRequirement(
          minVersion: minVersion,
          maxVersion: maxVersion,
          currentVersion: currentVersion,
        ),
        UpgradeRequirementType.canUpgrade,
      );
    });

    test('checks upgrade requirement [mustUpgrade]', () {
      Upgrader upgrader = Upgrader();

      String minVersion = '1.0.0';
      String maxVersion = '2.0.0';
      String currentVersion = '0.5.0';

      expect(
        upgrader.checkUpgradeRequirement(
          minVersion: minVersion,
          maxVersion: maxVersion,
          currentVersion: currentVersion,
        ),
        UpgradeRequirementType.mustUpgrade,
      );
    });

    test('checks upgrade requirement [none]', () {
      Upgrader upgrader = Upgrader();

      String minVersion = '1.0.0';
      String maxVersion = '1.0.0';
      String currentVersion = '1.0.0';

      expect(
        upgrader.checkUpgradeRequirement(
          minVersion: minVersion,
          maxVersion: maxVersion,
          currentVersion: currentVersion,
        ),
        UpgradeRequirementType.none,
      );
    });
  });
}
