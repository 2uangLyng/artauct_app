import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewWorkCard extends StatefulWidget {
  const NewWorkCard({super.key});

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
      width: MediaQuery.of(context).size.width * 0.95,
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              'assets/images/get-started-2.jpg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
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
                    const Text(
                      'Artist Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 24,
                        color: Colors
                            .black, // Remove isFavorite from constant context
                      ),
                      onPressed: toggleFavorite,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Art Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Gallery Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 20,
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
