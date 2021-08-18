import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => WillPopScope(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
