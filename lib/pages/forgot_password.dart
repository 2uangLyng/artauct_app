import 'dart:async';
import 'package:artauct_app/components/textField.dart';
import 'package:artauct_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/Button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final AuthServices _authServices = AuthServices();
  final ValueNotifier<bool> _isEmailValid = ValueNotifier<bool>(false);
  bool _emailSent = false;
  bool _canResend = false;
  Timer? _timer;
  int _start = 45;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final email = _emailController.text;
    final isValid = email.isNotEmpty;
    _isEmailValid.value = isValid;
  }

  void _resendEmail() {
    _sendResetEmail();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Resend email successfully'),
      backgroundColor: Colors.green,
    ));
  }

  Future<void> _sendResetEmail() async {
    String res = await _authServices.sendPasswordResetEmail(
        email: _emailController.text);
    if (res == "Password reset email sent successfully") {
      setState(() {
        _emailSent = true;
        _canResend = false;
        _startTimer();
      });
    }
  }

  void _startTimer() {
    _start = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          _canResend = true;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Forgot Password'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              context.go('/login');
            },
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 100),
                const SizedBox(
                    width: 5), // Khoảng cách giữa logo và tên (nếu cần)
                const Text(
                  'Artauct',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Boroto Mono',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Enter your email to receive a password reset link',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_emailSent)
                  const Column(
                    children: [
                      Text(
                        'Password reset link sent successfully. Please check your email.',
                        style:
                            TextStyle(fontSize: 18, color: Colors.blueAccent),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                else
                  Column(
                    children: [
                      RoundedTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        isPassword: false,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
              ],
            ),
            const Spacer(), // Đẩy các nút xuống phía dưới
            Column(
              children: [
                if (_emailSent)
                  Column(
                    children: [
                      Button(
                        value: 'Go to Login',
                        fontSize: 16,
                        onPressed: () {
                          context
                              .go('/login'); // Sử dụng GoRouter để điều hướng
                        },
                        isEnabled: true,
                      ),
                      const SizedBox(height: 20),
                      if (_canResend)
                        Button(
                          value: 'Resend Email',
                          fontSize: 16,
                          onPressed: _resendEmail,
                          isEnabled: true,
                        )
                      else
                        Button(
                          value: 'Resend available in $_start seconds',
                          fontSize: 16,
                          isEnabled: false,
                        ),
                    ],
                  )
                else
                  ValueListenableBuilder<bool>(
                    valueListenable: _isEmailValid,
                    builder: (context, isValid, child) {
                      return Button(
                        value: 'Send Reset Email',
                        fontSize: 16,
                        onPressed: _sendResetEmail,
                        isEnabled: isValid,
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 70), // Khoảng cách dưới cùng màn hình
          ],
        ),
      ),
    );
  }
}
