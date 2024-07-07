// import 'package:artauct_app/pages/homepage.dart';
// import 'package:artauct_app/pages/signup.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppRouter {
//   late GoRouter router;
//   late SharedPreferences pref;

//   AppRouter() {
//     initSharedPref();
//     router = GoRouter(
//       routes: [
//         GoRoute(
//           path: '/home',
//           builder: (context, state) => const HomePage(),
//         ),
//         GoRoute(
//           path: '/',
//           builder: (context, state) => const SignUp(),
//         ),
//       ],
//     );
//   }

//   void initSharedPref() async {
//     pref = await SharedPreferences.getInstance();
//   }
// }
