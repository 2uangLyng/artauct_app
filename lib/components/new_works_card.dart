import 'package:flutter/material.dart';

class NewWorkCard extends StatefulWidget {
  final String imageUrl; 
  final String artistName; 
  final String artName;
  final String galleryName; 
  final String price; 

  const NewWorkCard({
    super.key,
    required this.imageUrl,
    required this.artistName,
    required this.artName,
    required this.galleryName,
    required this.price,
  });

  @override
  State<NewWorkCard> createState() => _NewWorkCardState();
}

class _NewWorkCardState extends State<NewWorkCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            // blurRadius: 10,
            // spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: 220,
              width: MediaQuery.of(context).size.width * 0.88,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.artName,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 25,
                        color: const Color.fromARGB(255, 9, 4, 4),
                      ),
                      onPressed: toggleFavorite,
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Text(
                  widget.artistName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.galleryName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
