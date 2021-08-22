import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_auth/app/ui/pages/login/login_page.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'handle_login_response.dart';

void signInWithGoogle(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithGoogle();
  router.pop();
  handleLoginResponse(context, response);
}
