import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void _onUsernameTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UsernameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(children: [
                Gaps.v40,
                const Text(
                  "Sign up for TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v40,
                const Text(
                  "Create a profile, follow other accounts, make you own videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gaps.v20,
                if (orientation == Orientation.portrait) ...[
                  GestureDetector(
                    onTap: () => _onUsernameTap(context),
                    child: const AuthButton(
                        text: "Use phone or email",
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
                  )
                ],
                if (orientation == Orientation.landscape)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onUsernameTap(context),
                          child: const AuthButton(
                              text: "Use phone or email",
                              icon: FaIcon(
                                FontAwesomeIcons.user,
                              )),
                        ),
                      ),
                      Gaps.h16,
                      Expanded(
                        child: GestureDetector(
                          onTap: () => null,
                          child: const AuthButton(
                              text: "Continue with Apple",
                              icon: FaIcon(
                                FontAwesomeIcons.apple,
                              )),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: 'By continuing, you agree to our ',
                            style: TextStyle(
                                fontSize: Sizes.size14, color: Colors.black45),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: ' and acknowledge that you have read our',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    ' to learn how we collect, use, and share your data.',
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Gaps.v20,
              ]),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.grey.shade100,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
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
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
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
      },
    );
  }
}
