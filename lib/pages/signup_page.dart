import 'package:artauct_app/components/textField.dart';
import 'package:artauct_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:gradient_borders/input_borders/gradient_underline_input_border.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', height: 100),
                  const SizedBox(
                      width: 5), // Khoảng cách giữa logo và tên (nếu cần
                  const Text('Artauct',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Boroto',
                          fontWeight: FontWeight.bold)),
                ],
              ), // Logo của bạn
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create a new account',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              RoundedTextField(
                controller: usernameController,
                labelText: 'Username',
                isPassword: false,
              ),
              const SizedBox(height: 20),
              RoundedTextField(
                controller: passwordController,
                labelText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              RoundedTextField(
                controller: passwordController,
                labelText: 'Repeat Password',
                isPassword: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 211, 26, 13), // Màu nền của nút
                  padding:
                      const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Boroto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow
                    ], // Màu gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        print('Google Sign In');
                      },
                      icon: Image.asset(
                        'assets/icons/google_icon.png',
                        height: 30,
                      ),
                      label: const Text(
                        'Continue with Google',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                            color: Colors.transparent, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Text.rich(
                TextSpan(
                  text: "Already have an account?",
                  children: [
                    TextSpan(
                      text: 'Login here',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto', // Áp dụng phông chữ Roboto
                        decoration: TextDecoration.underline, // Gạch chân
                        decorationColor: Colors.red, // Màu gạch chân
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
