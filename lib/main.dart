import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwd/common/theme/default_theme.dart';
import 'package:passwd/features/record/presentation/mobile/record_mobile_view.dart';
import 'package:passwd/features/record/presentation/record_view_bindings.dart';
import 'package:passwd/features/record/domain/cipher_record.dart';
import 'package:passwd/features/tag/domain/cipher_tag.dart';
import 'package:realm/realm.dart';

void main() {
  var realm =
      Realm(Configuration.local([CipherRecord.schema, CipherTag.schema]));
  runApp(GetMaterialApp(
    initialRoute: '/home',
    defaultTransition: Transition.native,
    darkTheme: DefaultTheme().getTheme(),
    themeMode: ThemeMode.dark,
    getPages: [
      GetPage(
          name: '/home',
          page: () => const RecordMobileView(),
          binding: RecordViewBindings(realm)),
    ],
  ));
}
