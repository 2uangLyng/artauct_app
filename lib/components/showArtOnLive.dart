
import 'package:flutter/material.dart';

class ShowArtOnLive extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final bool isLive;

  const ShowArtOnLive({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    this.isLive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 221, 221, 221))
        ),
      child: Container(
        padding: const EdgeInsets.only(top:10, left: 7, right: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Stack(
               children:[
                ClipRRect(
            borderRadius: BorderRadius.circular(7.0), // Bo góc
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            ),
            Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.circle, color: Color.fromARGB(255, 237, 49, 36), size: 12),
                      SizedBox(width: 4),
                      Text(
                        'Live',
                        style: TextStyle(
                          fontSize: 15,
                       /*    color: Colors.red, */
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ] 
          ),
          const SizedBox(height: 
       19.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500, 
                ),
              ),
            ),
            const SizedBox(height: 3.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}