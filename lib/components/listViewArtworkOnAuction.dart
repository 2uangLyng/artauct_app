// ignore: file_names
import 'package:artauct_app/components/artworkCard.dart';

import 'package:flutter/material.dart';
  enum WidgetType {
    // ignore: constant_identifier_names
    NewWorkCard(),
    // ignore: constant_identifier_names
    ProductCard(),
    // ignore: constant_identifier_names
    Productcardproductpage(),
  }
// ignore: must_be_immutable
class ListViewArtworkOnAuction extends StatelessWidget {
   final int numberOfArtworks;
  
  const ListViewArtworkOnAuction( {super.key, required this.numberOfArtworks,});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 420, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numberOfArtworks,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child:ArtworkCard(title: 'Spring Birds', artist: 'Tri ngu, 1995',
             auctionHouse: 'Rago/Wright/Ling/Trisdo & Co.', price: '\$5,000 (Bid)', 
             imageUrl: 'https://mdl.artvee.com/sftb/35153dr.jpg'), 
          );
        },
      ),
    );
  }
}