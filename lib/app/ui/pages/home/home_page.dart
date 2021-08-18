import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Hola Home'),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: const Text('Sign Out'),
              color: Colors.blue,
              onPressed: () async {
                await Get.i.find<AuthenticationRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            )
          ],
        ),
      ),
    );
  }
}
