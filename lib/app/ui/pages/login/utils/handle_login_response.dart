import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/app/domain/responses/sign_in_response.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

void handleLoginResponse(BuildContext context, SignInResponse response) {
  if (response.error != null) {
    late String errorMessage;
    if (response.error != SignInError.cancelled) {
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
        case SignInError.invalidcredential:
          errorMessage = 'invalid-credential';
          break;
        case SignInError.accountexistswithdifferentcredential:
          errorMessage = response.providerId ?? 'Invalid auth method';
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
    }
  } else {
    router.pushReplacementNamed(Routes.HOME);
  }
}
