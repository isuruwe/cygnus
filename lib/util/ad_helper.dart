import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2430434408560784/7447165089';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2430434408560784/9307875814';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2430434408560784/7447165089';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2430434408560784/9307875814';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2430434408560784~8186365836';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}