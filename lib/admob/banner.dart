import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerClass {
  static const String bannerAdId = "ca-app-pub-3940256099942544/6300978111";
  BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest());
}
