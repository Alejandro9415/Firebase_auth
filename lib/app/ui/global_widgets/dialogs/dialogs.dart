import 'package:flutter/cupertino.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String? title,
    String? description,
    String okText = 'OK',
  }) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(
          title ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(description ?? ''),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(_),
            child: Text(okText),
          )
        ],
      ),
    );
  }
}
