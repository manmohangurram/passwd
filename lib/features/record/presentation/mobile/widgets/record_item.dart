import 'package:flutter/material.dart';
import 'package:passwd/features/record/domain/record.dart';

class RecordItem extends StatelessWidget {
  const RecordItem({super.key, required this.record});

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          record.metadata.name,
          style: Theme.of(context).primaryTextTheme.headlineMedium,
        ),
        Text(
          record.metadata.username,
          style: Theme.of(context).primaryTextTheme.headlineSmall,
        )
      ],
    );
  }
}
