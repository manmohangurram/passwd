import 'dart:collection';

import 'package:flutter/widgets.dart';

class LogoMapper {
  LogoMapper() {
    loadData();
  }

  static final Map<String, String> _logoMap = HashMap();
  static final RegExp _regExp =
      RegExp(r'(?:https?://)?(?:www\.)?([a-zA-Z0-9-]+)\.');

  static void loadData() {
    _logoMap["google"] = "google.png";
    _logoMap["amazon"] = "amazon.png";
    _logoMap["git"] = "git.png";
    _logoMap["microsoft"] = "microsoft.png";
  }

  Image getImage(String url) {
    String? companyName = extractCompanyName(url);
    String logoName = _logoMap[companyName] ?? "hospitable.png";
    return Image.asset("assets/$logoName");
  }

  String? extractCompanyName(String url) {
    Match? match = _regExp.firstMatch(url);
    if (match != null) {
      return match.group(1);
    }
    return null;
  }
}
