import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/app/domain/repositories/account_repository.dart';

class AccountRespositoryImpl implements AccountRepository {
  final FirebaseAuth _auth;

  AccountRespositoryImpl(this._auth);
  @override
  Future<User?> updateDisplayName(String value) async {
    try {
      final user = _auth.currentUser;

      assert(user != null);

      await user!.updateDisplayName(value);
      user.reload();

      return _auth.currentUser;
    } catch (e) {
      return null;
    }
  }
}
