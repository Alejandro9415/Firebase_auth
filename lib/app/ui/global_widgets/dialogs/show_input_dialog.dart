import 'package:flutter/cupertino.dart';

Future<String?> showInputDialog(
  BuildContext context, {
  String? title,
}) async {
  String value = '';

  final result = await showCupertinoDialog<String?>(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: CupertinoTextField(
        onChanged: (text) {
          value = text;
        },
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, value);
          },
          child: const Text('SAVE'),
          isDefaultAction: true,
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, value);
          },
          child: const Text('CANCEL'),
          isDestructiveAction: true,
        ),
      ],
    ),
  );
  if (result != null && result.trim().isEmpty) {
    return null;
  }
  return result;
}
