import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_auth/app/ui/global_controller/theme_controller.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/show_input_dialog.dart';
import 'package:flutter_meedu/state.dart';
import '../../../../utils/dark_mode_extension.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  void _updateDisplay(BuildContext context) async {
    final value = await showInputDialog(context);
    if (value != null) {
      ProgressDialog.show(context);
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
              : null,
          backgroundImage:
              user.photoURL != null ? NetworkImage(user.photoURL!) : null,
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
          label: 'Name',
          value: user.displayName ?? '',
          onPressed: () => _updateDisplay(context),
        ),
        LabelButton(
          label: 'Email',
          value: user.email ?? '',
        ),
        LabelButton(
          label: 'Email verified',
          value: user.emailVerified ? 'YES' : 'NO',
        ),
        CupertinoSwitch(
          value: isDark,
          onChanged: (_) => themeProvider.read.toggle(),
        )
      ],
    );
  }
}

class LabelButton extends StatelessWidget {
  const LabelButton({
    Key? key,
    required this.label,
    required this.value,
    this.onPressed,
  }) : super(key: key);

  final String label, value;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final IconColor = isDark ? Colors.white30 : Colors.black45;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      onTap: onPressed,
      leading: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            Icons.chevron_right_outlined,
            size: 22,
            color: onPressed != null ? IconColor : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
