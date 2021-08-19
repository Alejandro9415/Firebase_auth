import 'package:flutter/widgets.dart';
import 'package:flutter_auth/app/domain/responses/sign_up_response.dart';
import 'package:flutter_auth/app/domain/repositories/sign_up_repository.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_auth/app/ui/pages/register/register_state.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);

  final SessionController _sessionController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<FormState> get formKey => _formKey;

  final SignUpRepository _signUpRepository = Get.i.find();

  Future<SignUpResponse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
          name: state.name,
          lastname: state.lastname,
          email: state.email,
          password: state.password),
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
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
