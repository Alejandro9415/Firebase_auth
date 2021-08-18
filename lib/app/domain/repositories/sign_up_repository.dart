import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/app/domain/response/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}


