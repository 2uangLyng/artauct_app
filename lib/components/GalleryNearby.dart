// ignore: file_names
import 'package:flutter/material.dart';

class GalleryNearby extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String dateStart;
  final String dateEnd;

  const GalleryNearby({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.dateStart,
    required this.dateEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 360,
              ),
            ),
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 137, 137, 137).withOpacity(0.2),
              ),
            ),
            Positioned(
              bottom: 35,
              left: 30,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Location: $location',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Date start: $dateStart',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Date end: $dateEnd',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
