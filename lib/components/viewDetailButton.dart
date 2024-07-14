import 'package:flutter/material.dart';

class ViewDetailButton extends StatelessWidget {
  final double size;
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final String? icon;

  const ViewDetailButton({super.key, 
    required this.size,
    required this.onPressed,
    required this.label,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}