import 'dart:io';

///
/// 全局配置信息
///
class Configs {
  // Google Admob 配置
  static final String ADMOB_APP_ID = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544~3347511713'
      : 'ca-app-pub-3940256099942544~1458002511';

  // 横幅广告 Id
  static final String ADMOB_BANNER_ID = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  // 插屏广告 Id
  static final String ADMOB_INTERSTITIAL_ID = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  // 视频广告 Id
  static final String ADMOB_VIDEO_ID = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  // 测试设备
  static const String ADMOB_TEST_DEVICES = 'Samsung_Galaxy_SII_API_26:5554';
}
