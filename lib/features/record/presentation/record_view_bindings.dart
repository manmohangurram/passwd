import 'package:get/get.dart';
import 'package:passwd/features/record/presentation/record_view_controller.dart';
import 'package:realm/realm.dart';

class RecordViewBindings extends Bindings {
  RecordViewBindings(this.realm);

  Realm realm;

  @override
  void dependencies() {
    Get.lazyPut<RecordViewController>(() => RecordViewController(realm));
  }
}
