import 'package:cached_network_image/cached_network_image.dart';

class LogoRetriever {
  static const String _url = "https://passwd-1-r2208101.deta.app/logos";

  static final RegExp _regExp =
      RegExp(r'(?:https?://)?(?:www\.)?([a-zA-Z0-9-]+)\.');

  CachedNetworkImage getImage(String url) {
    String? companyName = extractCompanyName(url);
    return CachedNetworkImage(
      imageUrl: "$_url/$companyName",
      width: 50,
      height: 50,
    );
  }

  String? extractCompanyName(String url) {
    Match? match = _regExp.firstMatch(url);
    if (match != null) {
      return match.group(1);
    }
    return null;
  }
}
