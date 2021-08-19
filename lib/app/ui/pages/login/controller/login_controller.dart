import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_auth/app/domain/responses/sign_in_response.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class LoginController extends SimpleNotifier {
  LoginController(this._sessionController);

  final SessionController _sessionController;
  String _email = '', _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<FormState> get formKey => _formKey;

  final AuthenticationRepository _authRepository = Get.i.find();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() async {
    final response = await _authRepository.signWithEmailAndPassword(
      _email,
      _password,
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }
}
