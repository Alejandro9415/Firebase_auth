import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/app/domain/responses/sign_up_response.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import '../register_page.dart' show registerProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;

  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String description;

      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          description = 'email already in use';
          break;
        case SignUpError.weakPassword:
          description = 'weak password';
          break;
        case SignUpError.networkRequestFailed:
          description = 'network request failed';
          break;
        case SignUpError.unknown:
        case SignUpError.tooManyRequest:
          description = 'too many request';
          break;
        default:
          description = 'unknown error';
          break;
      }
      Dialogs.alert(
        context,
        title: 'ERROR',
        description: description,
      );
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(context, title: 'ERROR', description: 'Invalid Fiedls');
  }
}
