import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;

  const SignUpButton({super.key, 
    this.text = 'Sign up',
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderRadius = 30.0, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor.withOpacity(0.5), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}



