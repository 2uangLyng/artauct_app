import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  final double fontSize;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const Button({
    super.key,
    required this.value,
    required this.fontSize,
    this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: isEnabled
            ? const LinearGradient(
                colors: [
                  Color.fromARGB(131, 3, 3, 3),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.grey,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
