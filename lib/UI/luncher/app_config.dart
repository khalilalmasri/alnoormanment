

import 'package:alnoormanment/UI/shared/words.dart';

enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {
  static Flavor appFlavor = Flavor.DEVELOPMENT;

  static String get title {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return StringPlatform.companyname;
      case Flavor.DEVELOPMENT:
      default:
        return StringPlatform.companyname;
    }
  }

  static bool get isDebug {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return false;
      case Flavor.DEVELOPMENT:
      default:
        return true;
    }
  }
}
