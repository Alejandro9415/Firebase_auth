import 'package:flutter/widgets.dart';
import 'package:flutter_auth/app/domain/response/sign_up_response.dart';
import 'package:flutter_auth/app/domain/repositories/sign_up_repository.dart';
import 'package:flutter_auth/app/ui/pages/register/register_state.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);

  final GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<FormState> get formKey => _formKey;

  final _signUpRepository = Get.i.find<SignUpRepository>();

  Future<SignUpResponse> submit() {
    return _signUpRepository.register(
      SignUpData(
          name: state.name,
          lastname: state.lastname,
          email: state.email,
          password: state.password),
    );
  }

  void onNameChange(String text) {
    state = state.copyWith(name: text);
  }

  void onLastNameChange(String text) {
    state = state.copyWith(lastname: text);
  }

  void onEmailChange(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChange(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChange(String text) {
    state = state.copyWith(vpassword: text);
  }
}
