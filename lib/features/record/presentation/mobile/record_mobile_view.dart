import 'package:flutter/material.dart';
import 'package:passwd/features/record/presentation/mobile/widgets/record_list_view.dart';

class RecordMobileView extends StatelessWidget {
  const RecordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        extendBody: true,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorDark,
            title: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Pass",
                    style: Theme.of(context).textTheme.titleLarge),
                TextSpan(
                    text: "wd",
                    style: Theme.of(context).primaryTextTheme.titleLarge)
              ]),
            )),
        body: const RecordListView());
  }
}
