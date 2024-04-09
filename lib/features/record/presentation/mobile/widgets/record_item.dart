// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwd/features/record/domain/record.dart';
import 'package:passwd/utils/logo_mapper.dart';

class RecordItem extends StatelessWidget {
  const RecordItem({super.key, required this.record});

  final Record record;
  static final LogoMapper logoMapper = LogoMapper();
  static const String USERNAME_COPIED = "Username copied to clipboard";
  static const String PASS_COPIED = "Password copied to clipboard";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_createLeft(context), _createShortcuts(context)],
        ));
  }

  Widget _createLeft(BuildContext context) {
    return Row(
      children: [_createLogo(), _createDiscription(context)],
    );
  }

  Widget _createLogo() {
    return SizedBox(
      width: 45,
      height: 45,
      child: logoMapper.getImage(record.metadata.url),
    );
  }

  Widget _createDiscription(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          record.metadata.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          record.metadata.username,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  Widget _createShortcuts(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: record.metadata.name))
                  .then((_) {
                _showToastMessage(context, USERNAME_COPIED);
              });
            },
            icon: Icon(
              Icons.person_outline,
              color: Theme.of(context).primaryColor,
            )),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: record.metadata.password))
                  .then((_) {
                _showToastMessage(context, PASS_COPIED);
              });
            },
            icon: Icon(
              Icons.password_outlined,
              color: Theme.of(context).primaryColor,
            ))
      ],
    );
  }

  void _showToastMessage(BuildContext context, String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        textColor: Theme.of(context).textTheme.bodySmall?.backgroundColor,
        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize);
  }
}
