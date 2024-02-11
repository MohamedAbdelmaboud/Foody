import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.isFavourite,
  });

  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
      child: Icon(
        isFavourite ? Icons.favorite_outlined : Icons.favorite_outline_sharp,
        size: 20,
        color: isFavourite ? Colors.red : Colors.black,
      ),
    );
  }
}
