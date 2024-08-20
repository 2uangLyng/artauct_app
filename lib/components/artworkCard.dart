import 'package:artauct_app/components/favortitesHeart.dart';
import 'package:flutter/material.dart';

class ArtworkCard extends StatelessWidget {
  final String title;

  final String artist;
  final String auctionHouse;
  final String price;
  final String imageUrl;
 

  const ArtworkCard({
    Key? key,
    required this.title,
 
    required this.artist,
    required this.auctionHouse,
    required this.price,
    required this.imageUrl,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 210,
      height: 370,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl,
              height: 200,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
               const HeartIcon(
                 

               ),
              ],
            ),
      
            Text(artist,
              style: const TextStyle(
                fontSize: 14,
              ),
              ),
            Text(auctionHouse,
            style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(price, style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            
          ],
        ),
      ),
    );
  }
}
