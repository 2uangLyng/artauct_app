import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 2),
    ),
  );
}
