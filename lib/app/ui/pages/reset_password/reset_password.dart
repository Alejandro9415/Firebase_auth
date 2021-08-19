import 'package:flutter/material.dart';
import 'package:flutter_auth/app/domain/responses/reset_password_responsse.dart';
import 'package:flutter_auth/app/ui/global_widgets/custom_input_field.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:flutter_auth/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_auth/app/ui/pages/reset_password/controller/reset_password_controller.dart';
import 'package:flutter_auth/app/utils/validator.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

final resetPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ResetPasswordController>(
      provider: resetPasswordProvider,
      builder: (_, controller) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomInputField(
                    label: 'Email',
                    inputType: TextInputType.emailAddress,
                    onChanged: controller.onEmailChanged,
                  ),
                  ElevatedButton(
                    onPressed: () => _submit(context),
                    child: const Text('Send'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

void _submit(BuildContext context) async {
    final controller = resetPasswordProvider.read;
    if (isValidEmail(controller.email)) {
      ProgressDialog.show(context);
      final response = await controller.submit();
      Navigator.pop(context);
      if (response == ResetPasswordResponse.ok) {
        Dialogs.alert(
          context,
          title: "GOOD",
          description: "Email sent",
        );
      } else {
        String errorMessage = "";
        switch (response) {
          case ResetPasswordResponse.networkRequestFailed:
            errorMessage = "network Request Failed";
            break;
          case ResetPasswordResponse.userDisabled:
            errorMessage = "user Disabled";
            break;
          case ResetPasswordResponse.userNotFound:
            errorMessage = "user Not Found";
            break;
          case ResetPasswordResponse.tooManyRequest:
            errorMessage = "too Many Requests";
            break;
          case ResetPasswordResponse.unknown:
          default:
            errorMessage = "unknown error";
            break;
        }
        Dialogs.alert(
          context,
          title: "ERROR",
          description: errorMessage,
        );
      }
    } else {
      Dialogs.alert(context, description: "Invalid email");
    }
  }
}