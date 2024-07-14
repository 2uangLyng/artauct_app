import 'package:flutter/material.dart';
import 'package:artauct_app/components/viewDetailButton.dart';
import 'package:artauct_app/components/cartIcon.dart';
class Productcardproductpage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;
  final String price;
  final Color cardColor;
  const Productcardproductpage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.price,
    this.cardColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 180,
      height: 450,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular( 10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 270,
                width: size.width*0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.all(2)),
                  Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  const SizedBox(height: 2),
                  Text(
                    'Artist: $artist',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Price: $price',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height:10),
                      ViewDetailButton(
                        size: 100,
                        label: 'View Detail', 
                        onPressed: () {},
                        icon: 'https://img.icons8.com/?size=100&id=39777&format=png&color=000000',
                      ),
                      const SizedBox(width: 2),
                      CartIcon(
                      icon: '', 
                      onPressed: () {},
                      size: 40, 
                      borderRadius: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
