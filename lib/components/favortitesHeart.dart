import 'package:flutter/material.dart';
class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: _isFavorited ? Colors.red : Colors.black,
        size: 35,
        weight: 1.0,
      ),
      onPressed: _toggleFavorite,
    );
  }
}