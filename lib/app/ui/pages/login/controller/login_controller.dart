import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_auth/app/domain/response/sign_in_response.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class LoginController extends SimpleNotifier {
  String _email = '', _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<FormState> get formKey => _formKey;

  final _authRepository = Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() {
    return _authRepository.signWithEmailAndPassword(_email, _password);
  }
}
