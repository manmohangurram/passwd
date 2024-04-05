import 'package:flutter/material.dart';
import 'package:passwd/features/record/presentation/mobile/widgets/record_list_view.dart';

class RecordMobileView extends StatelessWidget {
  const RecordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        extendBody: true,
        body: const RecordListView());
  }
}
