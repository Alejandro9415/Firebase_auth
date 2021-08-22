import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_auth/app/ui/global_controller/theme_controller.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/show_input_dialog.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'widgets/label_button.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  void _updateDisplay(BuildContext context) async {
    final sessionController = sessionProvider.read;
    final value = await showInputDialog(context,
        initialValue: sessionController.user!.displayName ?? '');

    if (value != null) {
      ProgressDialog.show(
        context,
      );
      final user = await sessionProvider.read.updateDisplayName(value);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(context,
            title: 'ERROR', description: 'Check your internet connecion');
      }
    }
  }

  @override
  Widget build(BuildContext context, watch) {
    final isDark = context.isDarkMode;

    final sessionController = watch(sessionProvider);
    final user = sessionController.user!;

    final displayName = user.displayName ?? '';

    final letter = displayName.isNotEmpty ? displayName[0] : '';
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 50,
          child: user.photoURL == null
              ? Text(
                  letter,
                  style: const TextStyle(fontSize: 65),
                )
              : ClipOval(
                  child: Image.network(
                  user.photoURL!,
                  fit: BoxFit.cover,
                )),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            user.displayName ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            user.email ?? '',
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        LabelButton(
          label: "Display Name",
          value: displayName,
          onPressed: () => _updateDisplay(context),
        ),
        LabelButton(
          label: "Email",
          value: user.email ?? '',
        ),
        LabelButton(
          label: "Email verified",
          value: user.emailVerified ? "YES" : "NO",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dark Mode"),
              CupertinoSwitch(
                value: isDark,
                activeColor: isDark ? Colors.pinkAccent : Colors.blue,
                onChanged: (_) {
                  themeProvider.read.toggle();
                },
              ),
            ],
          ),
        ),
        LabelButton(
          label: "Sign Out",
          value: "",
          onPressed: () async {
            ProgressDialog.show(context);
            await sessionProvider.read.signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
        ),
      ],
    );
  }
}
