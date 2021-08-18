import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_auth/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:flutter_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_auth/app/domain/repositories/sign_up_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

void injectDependecies() {
  final _auth = FirebaseAuth.instance;
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(_auth),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(_auth),
  );
}
