import 'package:artauct_app/components/cartIcon.dart';
import 'package:artauct_app/components/favortitesHeart.dart';
import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;
  final String price;
  final Color cardColor;
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.price,
    this.cardColor = const Color.fromARGB(255, 231, 231, 231)
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 185,
      height: 430,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        elevation: 5,
        child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: size.width*0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Artist: $artist',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Price: $price',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height:10),
                      const HeartIcon(), 
                      const SizedBox(width: 40),
                      CartIcon(onPressed: (){}, size: 40, borderRadius: 30),              
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
