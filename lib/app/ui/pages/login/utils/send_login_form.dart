import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/app/domain/response/sign_in_response.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import '../login_page.dart' show loginProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String errorMessage;
      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = 'network request failed';
          break;
        case SignInError.userDisabled:
          errorMessage = 'user Disabled';
          break;
        case SignInError.userNotFound:
          errorMessage = 'user not found';
          break;
        case SignInError.wrongPassword:
          errorMessage = 'wrong password';
          break;
        case SignInError.tooManyRequest:
          errorMessage = 'too many request';
          break;
        case SignInError.unknown:
        default:
          errorMessage = 'error unknown';
          break;
      }

      Dialogs.alert(
        context,
        title: 'ERROR',
        description: errorMessage,
      );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
