extension VersionExtension on String {
  bool isLowerThan(String version) {
    String x = this;
    String y = version;

    List<String> xParts = x.split('.');
    List<String> yParts = y.split('.');
    int len = xParts.length > yParts.length ? xParts.length : yParts.length;

    for (int i = 0; i < len; i++) {
      int xPart = i < xParts.length ? int.parse(xParts[i]) : 0;
      int yPart = i < yParts.length ? int.parse(yParts[i]) : 0;

      if (xPart < yPart) {
        return true;
      } else if (xPart > yPart) {
        return false;
      }
    }

    return false;
  }

  bool isGreaterThan(String version) {
    return !this.isLowerThan(version) && this != version;
  }

  bool isEqualTo(String version) {
    return this.compareTo(version) == 0;
  }

  bool isLowerOrEqualTo(String version) {
    return this.isLowerThan(version) || this.isEqualTo(version);
  }

  bool isGreaterOrEqualTo(String version) {
    return this.isGreaterThan(version) || this.isEqualTo(version);
  }
}
