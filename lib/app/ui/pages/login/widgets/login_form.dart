import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_widgets/custom_input_field.dart';
import 'package:flutter_auth/app/ui/global_widgets/rounded_button.dart';
import 'package:flutter_auth/app/ui/pages/login/login_page.dart';
import 'package:flutter_auth/app/ui/pages/login/utils/send_login_form.dart';
import 'package:flutter_auth/app/ui/pages/login/widgets/social_buttons.dart';
import 'package:flutter_auth/app/ui/pages/routes/routes.dart';
import 'package:flutter_auth/app/utils/validator.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_meedu/router.dart' as router;

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);
  final _controller = loginProvider.read;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    final padding = context.mediaQueryPadding;
    final height = context.height - padding.top - padding.bottom;

    return ListView(
      children: [
        SizedBox(
          height: height,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Form(
                  key: _controller.formKey,
                  child: Align(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 360),
                      child: Column(
                        mainAxisAlignment: context.isTablet
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.end,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: SvgPicture.asset(
                              'assets/${isDark ? 'dark' : 'light'}/welcome.svg',
                            ),
                          ),
                          CustomInputField(
                              label: 'Email',
                              onChanged: _controller.onEmailChanged,
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
                            onChanged: _controller.onPasswordChanged,
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
                              const SizedBox(
                                width: 5,
                              ),
                              TextButton(
                                onPressed: () =>
                                    router.pushNamed(Routes.RESET_PASSWORD),
                                child: const Text('Forgot Password?'),
                              ),
                              RoundedButton(
                                onPressed: () => sendLoginForm(context),
                                text: 'Sign In',
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don´t have an account?'),
                              TextButton(
                                onPressed: () =>
                                    router.pushNamed(Routes.REGISTER),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text('Or sign in with: '),
                          const SizedBox(
                            height: 10,
                          ),
                          const SocialButtons(),
                          if (!context.isTablet)
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
          ),
        ),
      ],
    );
  }
}
