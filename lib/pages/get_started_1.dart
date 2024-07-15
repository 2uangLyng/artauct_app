import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStarted1 extends StatefulWidget {
  const GetStarted1({super.key});

  @override
  State<GetStarted1> createState() => _GetStarted1State();
}

class _GetStarted1State extends State<GetStarted1> {
  @override
  void initState() {
    final router = GoRouter.of(context);

    super.initState();
    // Tạo một Timer để đếm ngược 5 giây và sau đó chuyển đến trang mới
    Timer(const Duration(seconds: 5), () {
      router.go('/get-started-2');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const StartOrder(),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 250,
            ),
            const Text(
              'Artauct',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
