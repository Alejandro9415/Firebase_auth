import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/app/data/repositories_impl/account_respository_impl.dart';
import 'package:flutter_auth/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_auth/app/data/repositories_impl/preferences_repository_impl.dart';
import 'package:flutter_auth/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:flutter_auth/app/domain/repositories/account_repository.dart';
import 'package:flutter_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_auth/app/domain/repositories/preferences_repository.dart';
import 'package:flutter_auth/app/domain/repositories/sign_up_repository.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDependecies() async {
  final _auth = FirebaseAuth.instance;
  final _googleSingIn = GoogleSignIn();
  final _preferences = await SharedPreferences.getInstance();
  final _facebookAuth = FacebookAuth.i;

  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
        firebaseAuth: _auth,
        googleSignIn: _googleSingIn,
        facebookAuth: _facebookAuth),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(_auth),
  );
  Get.i.lazyPut<AccountRepository>(
    () => AccountRespositoryImpl(_auth),
  );
  Get.i.lazyPut<PreferencesRepository>(
    () => PreferencesRepositoryImpl(_preferences),
  );
}
