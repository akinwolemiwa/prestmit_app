enum Flavor {
  development,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Prestmit - Dev';
      case Flavor.staging:
        return 'Prestmit - Staging';
      case Flavor.production:
        return 'Prestmit';
      default:
        return 'title';
    }
  }

}
