import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwd/features/record/presentation/mobile/widgets/record_item.dart';
import 'package:passwd/features/record/presentation/record_view_controller.dart';

class RecordListView extends StatefulWidget {
  const RecordListView({
    super.key,
  });

  @override
  State<RecordListView> createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<RecordViewController>();
    return FutureBuilder(
        future: controller.insertData().then((_) => controller.getRecords()),
        builder: (c, state) {
          if (state.connectionState == ConnectionState.done) {
            if (state.hasData) {
              var data = state.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecordItem(record: data[index]);
                  });
            } else {
              return Text(state.error.toString());
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
