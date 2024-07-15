import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget {
  final String title;
  final double fontSize;
  final VoidCallback? onPressed;

  const TitleBar(
      {super.key, required this.title, required this.fontSize, this.onPressed});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        widget.title,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      IconButton(
        onPressed: widget.onPressed,
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 24,
          fill: 0.5,
          color: Colors.black,
        ),
      ),
    ]);
  }
}
