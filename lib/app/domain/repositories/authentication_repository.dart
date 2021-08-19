import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/app/domain/responses/reset_password_responsse.dart';
import 'package:flutter_auth/app/domain/responses/sign_in_response.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signWithEmailAndPassword(
    String email,
    String password,
  );

  Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}


