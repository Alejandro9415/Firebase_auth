import 'package:flutter_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_auth/app/domain/responses/reset_password_responsse.dart';
import 'package:flutter_auth/app/ui/global_controller/session_controller.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = '';


  String get email => _email;

  final _authenticationRepository = Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text) => _email = text;

  Future<ResetPasswordResponse> submit() =>
      _authenticationRepository.sendResetPasswordLink(_email);
}
