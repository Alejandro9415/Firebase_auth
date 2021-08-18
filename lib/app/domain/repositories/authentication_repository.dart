import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/app/domain/response/sign_in_response.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signWithEmailAndPassword(
    String email,
    String password,
  );
}


