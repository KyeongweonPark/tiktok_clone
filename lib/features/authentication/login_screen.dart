import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/utils.dart';

void _onEmailLoginTap(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const LoginFormScreen()));
}

class LoginScreen extends StatelessWidget {
  static String routeURL = "/login";
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          children: [
            Gaps.v40,
            const Text(
              "Log in to TikTok",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v40,
            const Opacity(
              opacity: 0.7,
              child: Text(
                "Manage your account, check notifications, comment on videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gaps.v20,
            GestureDetector(
              onTap: () => _onEmailLoginTap(context),
              child: const AuthButton(
                  text: "Use email & password",
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                  )),
            ),
            Gaps.v20,
            GestureDetector(
              onTap: () => null,
              child: const AuthButton(
                  text: "Continue with Apple",
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                  )),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        color: isDarkMode(context)
            ? Theme.of(context).appBarTheme.backgroundColor
            : Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size32,
            bottom: Sizes.size64,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
