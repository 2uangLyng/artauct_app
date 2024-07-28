import 'package:artauct_app/main_page.dart';
import 'package:artauct_app/pages/forgot_password.dart';
import 'package:artauct_app/pages/get_started_1.dart';
import 'package:artauct_app/pages/get_started_2.dart';
import 'package:artauct_app/pages/home_page.dart';
import 'package:artauct_app/pages/login_page.dart';
import 'package:artauct_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    // initSharedPref();
    router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GetStarted1(),
        ),
        GoRoute(
          path: '/main-page',
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: '/get-started-2',
          builder: (context, state) => const GetStarted2(),
        ),
        GoRoute(
          path: '/homepage',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/signup',
          pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SignUpPage(),
              transitionsBuilder:
                  ((context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              })),
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => CustomTransitionPage(
            transitionDuration: const Duration(seconds: 3),
            key: state.pageKey,
            child: const LoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/forgot-password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
      ],
    );
  }

  // void initSharedPref() async {
  //   pref = await SharedPreferences.getInstance();
  // }
}
