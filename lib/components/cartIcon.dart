// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
class CartIcon extends StatelessWidget {
  final String? icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double borderRadius;
  final VoidCallback onPressed;

  const CartIcon({super.key, 
    required this.onPressed,
    this.icon = '',
    this.backgroundColor = Colors.black,
    this.iconColor  = Colors.white,
    required this.size,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: ElevatedButton(
           onPressed: onPressed,
           style: ElevatedButton.styleFrom(
          backgroundColor:  Colors.black, // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        ),
          child: Icon(
            Icons.shopping_cart,
            color: iconColor,
            size: size * 0.6,
          ),
        ),
      ),
    );
  }
}