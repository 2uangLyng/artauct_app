import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final bool isPassword;

  const RoundedTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText,
    this.isPassword = false,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorText: widget.errorText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
