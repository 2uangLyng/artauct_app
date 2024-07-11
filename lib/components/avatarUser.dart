import 'package:flutter/material.dart';

class AvatarUser extends StatelessWidget {
  final double size;
  final String? imagePath;
  
  const AvatarUser({
    Key? key,
    required this.size,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center( /* condition ? A : B */
        child: imagePath != null && imagePath!.isNotEmpty
            ? ClipOval(
                child: Image.network(
                  imagePath!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                ),
              )
            : 
            Icon(
                Icons.person_outline,
                size: size * 0.5,
                color: Colors.black,
              )
            
            
        ),
    );
  }
}


