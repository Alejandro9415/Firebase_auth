import 'package:flutter/material.dart';
import 'package:flutter_auth/app/ui/pages/login/utils/sign_in_with_facebook.dart';
import 'package:flutter_auth/app/ui/pages/login/utils/sign_in_with_google.dart';
import 'package:flutter_auth/app/utils/colors.dart';
import 'package:flutter_auth/app/utils/icons.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialButton(
          icon: MeeduIcons.google,
          color: primaryLightColor,
          onPressed: () => signInWithGoogle(context),
        ),
        SocialButton(
          icon: MeeduIcons.facebook,
          color: primaryDarkColor,
          onPressed: () => signInWithFacebook(context),
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(50, 50),
        ),
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
