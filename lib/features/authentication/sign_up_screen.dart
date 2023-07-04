import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  static const routeURL = "/";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    context.push(LoginScreen.routeURL);
  }

  void _onEmailTap(BuildContext context) {
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //     transitionDuration: const Duration(seconds: 1),
    //     reverseTransitionDuration: const Duration(seconds: 1),
    //     pageBuilder: (context, animation, secondaryAnimation) =>
    //         const UsernameScreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       final offsetAnimation =
    //           Tween(begin: const Offset(1, 0), end: Offset.zero)
    //               .animate(animation);
    //       final opacityAnimation = Tween(begin: 0.5, end: 1).animate(animation);
    //       return FadeTransition(
    //           opacity: animation,
    //           child: SlideTransition(position: offsetAnimation, child: child));
    //     },
    //   ),
    // );
    context.pushNamed(UsernameScreen.routeName);
    // context.push("/users/lynn?show=likes");
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isDark = isDarkMode(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(children: [
                Gaps.v40,
                Text(
                  S.of(context).signUpTitle("TikTok", DateTime.now()),
                  style: const TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v40,
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    S.of(context).signUpSubTitle(0),
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gaps.v20,
                if (orientation == Orientation.portrait) ...[
                  GestureDetector(
                    onTap: () => _onEmailTap(context),
                    child: AuthButton(
                        text: S.of(context).emailPasswordButton,
                        icon: const FaIcon(
                          FontAwesomeIcons.user,
                        )),
                  ),
                  Gaps.v20,
                  GestureDetector(
                    onTap: () => null,
                    child: AuthButton(
                        text: S.of(context).appleButton,
                        icon: const FaIcon(
                          FontAwesomeIcons.apple,
                        )),
                  )
                ],
                if (orientation == Orientation.landscape)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _onEmailTap(context),
                          child: AuthButton(
                              text: S.of(context).emailPasswordButton,
                              icon: const FaIcon(
                                FontAwesomeIcons.user,
                              )),
                        ),
                      ),
                      Gaps.h16,
                      Expanded(
                        child: GestureDetector(
                          onTap: () => null,
                          child: AuthButton(
                              text: S.of(context).appleButton,
                              icon: const FaIcon(
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
                        text: TextSpan(
                            text: 'By continuing, you agree to our ',
                            style: const TextStyle(
                              fontSize: Sizes.size14,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.grey : Colors.black),
                              ),
                              const TextSpan(
                                text:
                                    ' and acknowledge that you have read our ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.grey : Colors.black),
                              ),
                              const TextSpan(
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
          bottomNavigationBar: Container(
            color: isDark
                ? Theme.of(context).appBarTheme.backgroundColor
                : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size32,
                bottom: Sizes.size64,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).alreadyHaveAnAccount,
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      S.of(context).logIn("female"),
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
