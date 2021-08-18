import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/app/inject_dependecies.dart';

import 'app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependecies();
  runApp(
    const MyApp(),
  );
}