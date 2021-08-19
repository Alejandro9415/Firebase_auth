import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (_, watch, __) {
                final user = watch(sessionProvider).user!;
                return Text(user.displayName ?? '');
              },
            ),
            const Text('Hola Home'),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: const Text('Sign Out'),
              color: Colors.blue,
              onPressed: () async {
                await sessionProvider.read.signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            )
          ],
        ),
      ),
    );
  }
}
