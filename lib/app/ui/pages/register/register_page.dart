import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/global_widgets/custom_input_field.dart';
import 'package:flutter_auth/app/ui/pages/register/controller/register_controller.dart';
import 'package:flutter_auth/app/ui/pages/register/register_state.dart';
import 'package:flutter_auth/app/ui/pages/register/utils/send_register_form.dart';
import 'package:flutter_auth/app/utils/validator.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import 'package:flutter_meedu/state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    CustomInputField(
                      label: 'Name',
                      onChanged: controller.onNameChange,
                      validator: (text) {
                        return isValidName(text!) ? null : 'Invalid name';
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                      label: 'Last Name',
                      onChanged: controller.onLastNameChange,
                      validator: (text) {
                        return isValidName(text!) ? null : 'Invalid LastName';
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                      label: 'E-mail',
                      inputType: TextInputType.emailAddress,
                      onChanged: controller.onEmailChange,
                      validator: (text) {
                        return isValidEmail(text!) ? null : 'Invalid email';
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                      label: 'Password',
                      isPassword: true,
                      onChanged: controller.onPasswordChange,
                      validator: (text) {
                        if (text!.trim().length >= 6) return null;
                        return 'Invalid password';
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer(
                      builder: (_, watch, __) {
                        watch(
                          registerProvider.select((_) => _.vpassword),
                        );
                        return CustomInputField(
                          label: 'Verification Password',
                          isPassword: true,
                          onChanged: controller.onVPasswordChange,
                          validator: (text) {
                            if (controller.state.password != text) {
                              return 'Password dont match';
                            }
                            if (text!.trim().length >= 6) return null;

                            return 'Invalid password';
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CupertinoButton(
                      child: const Text('Register'),
                      color: Colors.blue,
                      onPressed: () => sendRegisterForm(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
