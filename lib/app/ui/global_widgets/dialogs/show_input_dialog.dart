import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/screen_utils.dart';

Future<String?> showInputDialog(
  BuildContext context, {
  String? title,
  String? initialValue,
}) async {
  String value = initialValue ?? '';

  final isDark = context.isDarkMode;

  final result = await showCupertinoDialog<String?>(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: CupertinoTextField(
        controller: TextEditingController()..text = initialValue ?? '',
        onChanged: (text) {
          value = text;
        },
        style: TextStyle(
          color: isDark ?  Colors.white : Colors.black87,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isDark ? const Color(0xFF37474F) : Colors.black12,
        ),
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
            Navigator.pop(context);
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
