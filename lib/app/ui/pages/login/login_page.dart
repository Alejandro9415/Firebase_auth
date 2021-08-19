import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_auth/app/ui/global_widgets/custom_input_field.dart';
import 'package:flutter_auth/app/ui/pages/login/controller/login_controller.dart';
import 'package:flutter_auth/app/ui/pages/login/utils/send_login_form.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_auth/app/utils/validator.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomInputField(
                            label: 'Email',
                            onChanged: controller.onEmailChanged,
                            inputType: TextInputType.emailAddress,
                            validator: (text) {
                              if (isValidEmail(text!)) {
                                return null;
                              }
                              return 'Invalid email';
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomInputField(
                          label: 'Password',
                          isPassword: true,
                          onChanged: controller.onPasswordChanged,
                          validator: (text) {
                            if (text!.trim().length >= 6) return null;
                            return 'Invalid password';
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () => sendLoginForm(context),
                              child: const Text('Sign In'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () =>
                                  router.pushNamed(Routes.RESET_PASSWORD),
                              child: const Text('Forgot Password?'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => router.pushNamed(Routes.REGISTER),
                          child: const Text('Sign Up'),
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
          ),
        );
      },
    );
  }
}
