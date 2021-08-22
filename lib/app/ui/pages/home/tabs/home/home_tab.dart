import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
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
                return Text(
                  user.email ?? '',
                );
              },
            ),
            const Text('Hola Home'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
